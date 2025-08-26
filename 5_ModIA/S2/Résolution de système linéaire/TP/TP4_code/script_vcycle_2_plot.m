clear all; close all; clc;

Ns = [32, 64, 128, 256];       
omega = 2/3;                   
nu1 = 1; nu2 = 1;               
maxit = 10;                     

colors = lines(length(Ns));     % For plotting
figure; hold on;

finalErrors = zeros(length(Ns),1);  % To store converged L2 errors
errorL2_all = cell(length(Ns),1);   % To store errorL2 for each N

for k = 1:length(Ns)
    N = Ns(k);
    h = 1/N;
    
    xi = h:h:1-h; xi = xi';
    
    rhsf = -2 + 12*xi - 12*xi.^2;
    usol = xi.^2 .* (1 - xi).^2;
    
    Ah = getMatrixA(N);
    v = zeros(N-1, 1);
    
    % Arrays to store residual and L2 error
    res = zeros(maxit+1,1);
    errorL2 = zeros(maxit+1,1);
    
    res(1) = norm(rhsf - Ah*v);
    errorL2(1) = compute_L2_error(N, usol, v);
    
    for i = 1:maxit
        v = V_cycle(Ah, rhsf, v, omega, nu1, nu2, N);
        res(i+1) = norm(rhsf - Ah*v);
        errorL2(i+1) = compute_L2_error(N, usol, v);
    end
    
    % Store final error for analysis
    finalErrors(k) = errorL2(end);
    errorL2_all{k} = errorL2;  % Store the full error evolution for plotting
    
    % Plot residuals
    semilogy(0:maxit, res, '-o', 'Color', colors(k,:), 'DisplayName', ['N = ', num2str(N)]);
end

xlabel('Iteration'); ylabel('Residual (L2 norm)');
title('Residuals over V-cycles');
legend show; grid on;

% Display converged errors and ratios
disp('Converged L2 Errors and Ratios:')
for k = 1:length(Ns)
    fprintf('N = %3d -> L2 Error = %.4e\n', Ns(k), finalErrors(k));
    if k > 1
        ratio = finalErrors(k-1) / finalErrors(k);
        fprintf('    Ratio to previous = %.2f\n', ratio);
    end
end

% Plot L2 Discretization Error Evolution
figure; hold on;
colors = lines(length(Ns));
for k = 1:length(Ns)
    semilogy(1:maxit, errorL2_all{k}(2:end), '-o', ...
        'Color', colors(k,:), 'DisplayName', ['N = ', num2str(Ns(k))]);
end
xlabel('Iteration'); ylabel('L2 Discretization Error');
title('Comparison of Discretization Errors for Different N');
legend show; grid on;
