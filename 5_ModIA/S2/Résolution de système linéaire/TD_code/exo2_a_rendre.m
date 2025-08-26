%echo on
clear all;
close all;

figure(1);

A = [1 0 1 0 0 1 0 0;
     0 1 0 0 1 0 0 1;
     1 0 1 0 1 0 0 0;
     0 0 0 1 0 1 1 0;
     0 1 1 0 1 0 0 1;
     1 0 0 1 0 1 1 0;
     0 0 0 1 0 1 1 0;
     0 1 0 0 1 0 0 1];

% 1. Matrice Originale

% affichage de la structure de la matrice originale
subplot(2, 3, 1);
spy(A);
title('Original matrix A');

% factorisation symbolique de la matrice originale
[count, h, parent, post, R] = symbfact(A);
ALU = R+R';

% affichage de la structure des facteurs de la matrice originale
subplot(2, 3, 2)
spy(ALU);
title('Factors of A')
fillin = nnz(ALU)-nnz(A)

% visualisation du fill-in
A_ones = spones(A);
ALU_ones = spones(ALU);
FILL = ALU_ones - A_ones;
subplot(2, 3, 3)
spy(FILL)
title('Fill on A')

% 2. Matrice Permutée

% Aucune
P = [1 2 3 4 5 6 7 8];

P = [1 2 8 5 3 4 6 7];

P = [1 3 6 4 7 5 2 8];

P = [2 8 5 3 1 6 4 7];


B = A(P, P);
% affichage de la structure de la matrice permutée
subplot(2, 3, 4)
spy(B);
title('Permuted matrix B');

% factorisation symbolique de la matrice permutée
[count, h, parent, post, R] = symbfact(B);

% affichage de la structure des facteurs de la matrice permutée
BLU = R+R';
subplot(2, 3, 5)
spy(BLU);
title('Factors of B')
fillin = nnz(BLU) - nnz(A)

% visualisation du fill-in
B_ones = spones(B);
BLU_ones = spones(BLU);
FILLB = BLU_ones - B_ones;
subplot(2, 3, 6)
spy(FILLB);
title('Fill on B')

