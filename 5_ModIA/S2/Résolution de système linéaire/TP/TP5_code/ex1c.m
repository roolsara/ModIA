clc; clear;
clear all;
close all;

%% Define the model problem
global_domain_start = 0;
global_domain_end   = 1;

% Select number of discretization points in each direction
N=40;

% Assemble the problem
problem = Problem(N, N, global_domain_start, global_domain_end);
u_global = problem.solve_direct();
problem.plot_solution(u_global);



Ns = [10, 25, 50, 100, 200];


for i = 1: size(Ns, 2)
    N = Ns(i);
    problem_global = Problem(N, N, global_domain_start, global_domain_end);
    
     % Compute condition number
    condition_numbers(i) = condest(problem_global.A);
    
    % Solve problem using CG method
    [~, iter] = problem_global.solve_cg();
    cg_iters(i) = iter;
    
    % Solve problem using PCG method
    [~, iter] = problem_global.solve_pcg();
    pcg_iters(i) = iter;
end

% we dont solve the system directly but the predoditionner 
% if good preconditionner then the nb of iteration should be lower that
% without the preconditionner 


figure;
bar(log(condition_numbers), [cg_iters; pcg_iters])
xlabel('log(Cond(A))');ylabel('Number of  iterations');
legend('CG','PCG');
title('Number of CG vs PCG iterations');
grid on;

% Ax = f
% M-1 Ax = M-1f
%chol preconditionner maybe not the most accurate but good enough to solve
%the problem
% demanding in term of memory to check
%precondionner problem have a lower CN donc less iteration faster converge
% chol is just a example,