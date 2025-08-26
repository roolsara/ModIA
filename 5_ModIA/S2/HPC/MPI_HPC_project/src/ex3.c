#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <cblas.h>
#include "utils.h"
#include "dsmat.h"
#include "gemms.h"

void p2p_i_transmit_A(int p, int q, Matrix *A, int i, int l) {
  int j, b;
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  int node, tag;
  Block * Ail;
  Ail =  & A->blocks[i][l];
  b = A->b;
  if (me == Ail -> owner) { 
      for(j = 0; j < q; j++){ 
        node = get_node(p, q, my_row, j); 
        // my_row : ligne du processus 
        if(node!=me){ 
          MPI_Issend(Ail->c, b*b, MPI_FLOAT, node, tag, MPI_COMM_WORLD, &(Ail->request)); // asynchrone , on a 1 seul communicateur
        }
      }
    } else if (my_row == Ail ->row) {  
      Ail->c = malloc(b*b*sizeof(float));
      MPI_Irecv(Ail->c, b*b, MPI_FLOAT, Ail->owner, tag, MPI_COMM_WORLD, &(Ail->request));  
  }
}

void p2p_i_transmit_B(int p, int q, Matrix *B, int l, int j) {
  int i,b;
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  int node, tag;
  Block * Blj;
  Blj =  & B->blocks[l][j];
  b = B->b;
  tag = 1;

   if (me== Blj->owner) { 
      for(i=0;i<p;i++){
        node=get_node(p,q,i,my_col);
        if(node!=me){
          /* MPI_Ssend B[l,j] to my column */
          MPI_Issend(Blj->c, b*b, MPI_FLOAT, node, tag,MPI_COMM_WORLD, &(Blj->request));
        }
      }
    } else if (my_col == Blj ->col) {
      Blj->c = malloc(b*b*sizeof(float));
      /* MPI_Recv B[l,j] */
      MPI_Irecv(Blj->c, b*b, MPI_FLOAT, Blj->owner, tag, MPI_COMM_WORLD, &(Blj->request));
    }
}

void p2p_i_wait_AB(int p, int q, Matrix *A, Matrix* B, Matrix* C, int l) {
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  int i, j;
  Block *Ail, *Blj;
  /* TODO : wait for A[i,l] and B[l,j] if I need them */
  for (i = 0; i < A->mb ; i++) {
    Ail = &(A->blocks[i][l]);
    if (me != Ail->owner && my_row == Ail->row/* I need A[i,l] for my computation */) {
      // MPI_Wait Ail
      MPI_Wait(&Ail->request, MPI_STATUS_IGNORE);
    }
  }

  for (j =0; j < B->nb; j++) {
    Blj = &(B->blocks[l][j]);
    if (me != Blj->owner && my_col == Blj->col/* I need B[l,j] for my computation */) {
      // MPI_Wait Blj
      MPI_Wait(&Blj->request, MPI_STATUS_IGNORE);
    }
  }

  /* Alternative suggestion : iterate over blocks of C */
}


//smpirun -trace -platform platforms/cluster_crossbar.xml -hostfile hostfiles/cluster_hostfile.txt -np 4 ./build/bin/main -p 2 -q 2 -n 10 -b 5 --algorithm p2p-i-la --lookahead 2 --niter 2 -c -v

