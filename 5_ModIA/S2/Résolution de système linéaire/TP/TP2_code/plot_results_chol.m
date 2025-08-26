close all;
clear all;

load bcsstk27.mat;

n = size(A,1);

figure('Position', [100, 100, 1300, 1300]);

%%%%%%%%%%%%%%% Résultats pour la matrice originale %%%%%%%%%%%%%%%
subplot(5,3,1);
spy(A);
title('Original matrix A', 'FontSize', 7);

L = chol(A, 'lower');
subplot(5,3,2);
spy(L);
title('Cholesky factor L of A', 'FontSize', 7);

% Visualisation du fill-in
C = spones(A);
CLU = spones(L);
FILL = CLU - C;
subplot(5,3,3);
spy(FILL);
title('Fill-in on original A', 'FontSize', 7);

%%%%%%%%%%%%%%% Cholesky avec permutation Symmetric Approximate Minimum Degree %%%%%%%%%%%%%%%%

P = symamd(A);
B = A(P,P);

subplot(5,3,4);
spy(B);
title('symamd(A) permuted matrix', 'FontSize', 7);

L = chol(B, 'lower');
subplot(5,3,5);
spy(L);
title('Cholesky factor L of symamd(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(L);
FILL = BLU_sparse - B_sparse;
subplot(5,3,6);
spy(FILL);
title('Fill-in on symamd(A)', 'FontSize', 7);

%%%%%%%%%%%%%%% Cholesky avec permutation Symmetric Reverse Cuthill-McKee %%%%%%%%%%%%%%%%

P = symrcm(A);
B = A(P,P);

subplot(5,3,7);
spy(B);
title('symrcm(A) permuted matrix', 'FontSize', 7);

L = chol(B, 'lower');
subplot(5,3,8);
spy(L);
title('Cholesky factor L of symrcm(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(L);
FILL = BLU_sparse - B_sparse;
subplot(5,3,9);
spy(FILL);
title('Fill-in on symrcm(A)', 'FontSize', 7);

%%%%%%%%%%%%%%% Cholesky avec permutation Approximate Minimum Degree %%%%%%%%%%%%%%%%

P = amd(A);
B = A(P,P);
subplot(5,3,10);
spy(B);
title('amd(A) permuted matrix', 'FontSize', 7);

L = chol(B, 'lower');
subplot(5,3,11);
spy(L);
title('Cholesky factor L of amd(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(L);
FILL = BLU_sparse - B_sparse;
subplot(5,3,12);
spy(FILL);
title('Fill-in on amd(A)', 'FontSize', 7);

%%%%%%%%%%%%%%% Cholesky avec permutation Column Approximate Minimum Degree %%%%%%%%%%%%%%%%

P = colamd(A);
B = A(P,P);
subplot(5,3,13);
spy(B);
title('colamd(A) permuted matrix', 'FontSize', 7);

L = chol(B, 'lower');
subplot(5,3,14);
spy(L);
title('Cholesky factor L of colamd(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(L);
FILL = BLU_sparse - B_sparse;
subplot(5,3,15);
spy(FILL);
title('Fill-in on colamd(A)', 'FontSize', 7);

saveas(gcf, 'fillin_bcsstk27.png');
