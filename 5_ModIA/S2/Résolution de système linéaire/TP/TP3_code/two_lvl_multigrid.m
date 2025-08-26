clear all;
% Setup maillage
N = 64;
h = 1/N;
% Setup Jacobi
omega = 2/3;
% Setup of the fine and coarse grid matrix
% and the right-hand side
Ah = getMatrixA(N);
A2h = getMatrixA(N/2);
rhsf = 2*ones(N-1,1);
% Compute direct solution of linear system
sol_ref = Ah \ rhsf;

% Setup interpolation matrix
I2hh = I2hh(N);
Ih2h = I2hh'/2;


% Initial vector
v(1:N-1,1) = 0;
% Vector to store the error at each iteration.
% We do 10 iterations.
err(1:10) = 0;
% Multigrid iterations with 2 pre-smoothing steps
for i=1:10
v = weighted_jacobi(Ah,v,rhsf,omega,2);
% residual on fine grid
res_h = rhsf - Ah*v;

% Restriction of residual to coarser grid
res_2h = Ih2h*res_h;
% Solve the coarse grid error equation
e_2h = A2h \ res_2h;
% Interpolate the coarse grid error to the fine grid
e_h = I2hh * e_2h;
% Update the approximate fine grid solution
v = v + e_h;
% Compute the error with respect to the direct
% solution of the linear system
err(i) = norm(sol_ref-v);
end

% Affichage de l'évolution de l'erreur
figure;
semilogy(1:10, err, '-o', 'LineWidth', 2);
xlabel('Itérations');
ylabel('Norme de l''erreur');
title('Convergence de la méthode Multigrid');
grid on;