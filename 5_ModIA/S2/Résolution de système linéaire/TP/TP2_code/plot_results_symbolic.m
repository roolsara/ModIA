close all;
clear all;

load mat3.mat;

n = size(A,1);

figure('Position', [100, 100, 1300, 1300]);

%%%%%%%%%%%%%%% Résultats pour la matrice originale %%%%%%%%%%%%%%%
subplot(5,3,1);
spy(A);
title('Original matrix A', 'FontSize', 7);


[count, h, parent, post, R] = symbfact(A);
ALU = R+R';
subplot(5,3,2);
spy(ALU);
title('Factors of A', 'FontSize', 7);

% Visualisation du fill-in
C = spones(A);
CLU = spones(ALU);
FILL = CLU - C;
subplot(5,3,3);
spy(FILL);
title('Fill on original A', 'FontSize', 7);

%%%%%%%%%%%%%%% Résultats factorisation symbolique avec permutation Symmetric Approximate Minimum Degree %%%%%%%%%%%%%%%%

P = symamd(A);
B = A(P,P);
subplot(5,3,4);
spy(B);
title('symamd(A) permuted matrix', 'FontSize', 7);

[count, h, parent, post, R] = symbfact(B);
BLU = R+R';
subplot(5,3,5);
spy(BLU);
title('Factors of symamd(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(BLU);
FILL = BLU_sparse - B_sparse;
subplot(5,3,6);
spy(FILL);
title('Fill on symamd(A)', 'FontSize', 7);

%%%%%%%%%%%%%%% Résultats factorisation symbolique avec permutation Symmetric Reverse Cuthill-McKee %%%%%%%%%%%%%%%%
P = symrcm(A);
B = A(P,P);
subplot(5,3,7);
spy(B);
title('symrcm(A) permuted matrix', 'FontSize', 7);

[count, h, parent, post, R] = symbfact(B);
BLU = R+R';
subplot(5,3,8);
spy(BLU);
title('Factors of symrcm(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(BLU);
FILL = BLU_sparse - B_sparse;
subplot(5,3,9);
spy(FILL);
title('Fill on symrcm(A)', 'FontSize', 7);

%%%%%%%%%%%%%%% Résultats factorisation symbolique avec permutation Approximate Minimum Degree %%%%%%%%%%%%%%%%

P = amd(A);
B = A(P,P);
subplot(5,3,10);
spy(B);
title('amd(A) permuted matrix', 'FontSize', 7);

[count, h, parent, post, R] = symbfact(B);
BLU = R+R';
subplot(5,3,11);
spy(BLU);
title('Factors of amd(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(BLU);
FILL = BLU_sparse - B_sparse;
subplot(5,3,12);
spy(FILL);
title('Fill on amd(A)', 'FontSize', 7);

%%%%%%%%%%%%%%% Résultats factorisation symbolique avec permutation Column Approximate Minimum Degree %%%%%%%%%%%%%%%%

P = colamd(A);
B = A(P,P);
subplot(5,3,13);
spy(B);
title('colamd(A) permuted matrix', 'FontSize', 7);

[count, h, parent, post, R] = symbfact(B);
BLU = R+R';
subplot(5,3,14);
spy(BLU);
title('Factors of colamd(A)', 'FontSize', 7);

% Visualisation du fill-in
B_sparse = spones(B);
BLU_sparse = spones(BLU);
FILL = BLU_sparse - B_sparse;
subplot(5,3,15);
spy(FILL);
title('Fill on colamd(A)', 'FontSize', 7);


