#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main( int argc, char *argv[] ) {

  int value;
  int my_rank, size;
  int previous, next;
  MPI_Status status;

  // MPI_Init (NULL, NULL);
  MPI_Init(&argc, &argv);


  // Get number of processes
  MPI_Comm_rank (MPI_COMM_WORLD, &my_rank);
  MPI_Comm_size (MPI_COMM_WORLD, &size);

  // determine my neighbors according to my rank

  // if (my_rank == 0) {
  //   next = 1
  //   previous = size - 1;

  // }
  // else if (my_rank == size - 1 ){
  //   next = 0
  //   previous = my_rank - 1;
  // }
  // else {
  //   previous = my_rank - 1;
  //   next = my_rank + 1
  // }

  previous = (size + my_rank - 1)%size;
  next = (my_rank +1)%size;

  value = 1;

  if (my_rank == 0) {
    printf("je suis le processus %d et j'envoie à %d la valeur %d\n", my_rank, next, value);
    MPI_Ssend (&value, 1, MPI_INT, next , 0, MPI_COMM_WORLD);

    MPI_Recv(&value, 1, MPI_INT, previous, 0, MPI_COMM_WORLD, &status);
    printf("je suis le processus %d et je reçois de %d la valeur %d\n", my_rank, previous, value);


  } else {
    MPI_Recv(&value, 1, MPI_INT, previous, 0, MPI_COMM_WORLD, &status);
    printf("je suis le processus %d et je reçois de %d la valeur %d\n", my_rank, previous, value);


    value *= 2;
    printf("je suis le processus %d et j'envoie à %d la valeur %d\n", my_rank, next, value);
    MPI_Ssend (&value, 1, MPI_INT, next , 0, MPI_COMM_WORLD);

  }


  // The nodes, starting with node 0, transmit the value to each other,
  // each time multiplying it by 2.
  // At the end of the transmission, node 0 receives the value 2^(size-1)
  //
  // Instruction: before each send and after each receive, each node displays
  //   - its rank
  //   - the type communication (send, recv)
  //   - the value


  printf("[%d]: The End\n", my_rank);

  MPI_Finalize();

  return EXIT_SUCCESS;

}
