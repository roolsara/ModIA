function v = V_cycle_L(Ah,rhsf,u0,omega,nu1,nu2,N, L)
% 1. Setup of intergrid transfer operators
I2hh = interpol(N);
Ih2h = I2hh'/2;
% 2. nu1 steps of weighted Jacobi smoothing
v = weighted_jacobi(Ah,u0,rhsf,omega,nu1);

% 3. Computation of residual
res_h = rhsf - Ah*v;

% 4. Restriction of residual
res_2h = Ih2h*res_h;

% 5. Construction of coarse grid matrix via Galerkin projection
A2h = Ih2h*Ah*I2hh;

% 6. coarse level solve
if L==1
    e_2h = A2h \ res_2h;
else
    e_2h = V_cycle_L(A2h,res_2h,zeros(N/2 -1, 1),omega,nu1,nu2,N/2, L-1);
end

% 7. Interpolation of coarse grid error
e_h = I2hh*e_2h;

% 8. Update of solution
v = v+e_h;

% 9. nu2 steps of weighted Jacobi smoothing
v = weighted_jacobi(Ah, v, rhsf, omega, nu2);