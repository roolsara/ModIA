clear all; close all; clc;

N = 256;
h = 1/N;
xi = h:h:1-h; xi = xi';
rhsf = -2 + 12*xi - 12*xi.^2;
usol = xi.^2 .* (1 - xi).^2;
Ah = getMatrixA(N);

omega = 2/3;
nu1 = 1; nu2 = 1;
maxit = 10;
v0 = zeros(N-1, 1);  

% Try different levels
maxL = floor(log2(N));  % max level possible
colors = lines(maxL);
figure; hold on;

finalErrors = zeros(maxL,1);
allRes = cell(maxL,1);

for L = 1:maxL
    v = v0;
    res = zeros(maxit+1,1);
    errorL2 = zeros(maxit+1,1);

    res(1) = norm(rhsf - Ah*v);
    errorL2(1) = compute_L2_error(N, usol, v);

    for i = 1:maxit
        v = V_cycle_L(Ah, rhsf, v, omega, nu1, nu2, N, L);
        res(i+1) = norm(rhsf - Ah*v);
        errorL2(i+1) = compute_L2_error(N, usol, v);
    end

    finalErrors(L) = errorL2(end);
    allRes{L} = res;

    % Plot residuals
    semilogy(0:maxit, res, '-o', 'Color', colors(L,:), 'DisplayName', ['L = ', num2str(L)]);
end

xlabel('Iteration'); ylabel('Residual (L2 norm)');
title('Residuals for Different Multigrid Levels (N = 256)');
legend show; grid on;

% Display converged L2 errors
disp('Converged Discretization Errors for Different L:')
for L = 1:maxL
    fprintf('L = %2d -> L2 Error = %.4e\n', L, finalErrors(L));
end
