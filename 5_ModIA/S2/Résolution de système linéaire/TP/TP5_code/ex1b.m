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
    
end



figure;
bar(log(condition_numbers), [cg_iters])
xlabel('log(Cond(A))');ylabel('Number of  iterations');
legend('CG');
title('Number of CG vs PCG iterations');
grid on;

% before the CN, correlation between CN and nb of iterations. 
%increase the resolution the problem is growoing and the cn is growing
%now the cn is growing and standart method requires more iterations to converge
%correlation between the cn and the convergence
%larger the cn more iteration is needed to converge