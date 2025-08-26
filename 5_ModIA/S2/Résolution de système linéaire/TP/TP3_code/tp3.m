close all;
clear all;

N = 3;

A = getMatrixA(N)

rhsf(1:N-1,1) = 2;

sol_ref = A \ rhsf;

full(sol_ref)

mat_i2hh = I2hh(8)

mat_ih2h = I2hh(8)'/2