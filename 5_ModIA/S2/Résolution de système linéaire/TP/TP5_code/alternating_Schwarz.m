function [error, residual, iter, u_global] =  alternating_Schwarz(params, problem_global, u_global_exact, problem_subdomain1, problem_subdomain2, u1, u2, overlap_size)

iter=0;
converged=false;
error=zeros(params.maxiter,1);
residual=zeros(params.maxiter,1);

u_global = 0*u_global_exact;

% Additive Schwarz solver
while converged==false
    
    iter = iter+1;
    
    %% Solve on the first subdomain
    % TODO:: Assign correct BC conditions for the first subdomain
    problem_subdomain1.gr = u2(:, overlap_size+1); %find the proper offset
    
    % TODO:: Solve the first subproblem
    u1 = problem_subdomain1.solve_direct();
    
    
    %% Solve on the second subdomain
    % TODO:: Assign correct BC conditions for the second subdomain
    problem_subdomain2.gl = u1(:, end - overlap_size);
    
    % Solve the second subproblem
    u2 = problem_subdomain2.solve_direct();
    
    
    % Merge the two contributions to form global solution
    % Pay attention to the overlapping part, where the solution has to be
    % averaged
    a = problem_subdomain1.Nx-overlap_size+1;
    u_global = [u1(:, 1:a),(u1(:, a+1:a+overlap_size+1) + u2(:, 1:overlap_size+1))/2, u2(:, overlap_size +2 :end) ];
    
    
    % compute error and residual between iterate and exact solution
    error(iter+1)=problem_global.compute_error(u_global_exact, u_global);
    residual(iter)=problem_global.compute_residual(u_global);
    
    % plot subdomain solutions
    if params.plt==1
        if(iter==1)
            figure(3);
        end
        problem_subdomain1.plot_solution(u1);
        hold on
        problem_subdomain2.plot_solution(u2);
        hold off
        xlabel('x');ylabel('y');zlabel('Schwarz iterates ');
        title(sprintf('Iteration: %d', iter));
        disp('Press Enter to continue to the next iteration ...');
        input('', 's'); % Wait for Enter key
    end
    
    fprintf('it:     %d       || r ||  %d      || e ||  %d  \n', iter, residual(iter), error(iter));
    
    if(iter > params.maxiter || residual(iter) < params.atol)
        converged=true;
    end
    
    
end
end

%solve sp 1 extract the BC et use it to specify the value OF BC of pb2 and
%so on w
% extract the appropriate value,  BC on the right (for sb1) that change every iteration