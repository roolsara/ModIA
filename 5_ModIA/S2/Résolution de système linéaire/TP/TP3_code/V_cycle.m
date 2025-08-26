function v = V_cycle(Ah,rhsf,u0,omega,nu1,nu2,N)

I2hh = interpol(N);
Ih2h = I2hh'/2;

v = weighted_jacobi(Ah,u0,rhsf,omega,nu1);
res_h = rhsf - Ah*v;
res_2h = Ih2h*res_h;

A2h = Ih2h*Ah*I2hh;

e_2h = A2h \ res_2h;
e_h = I2hh * e_2h;

v = v + e_h;

v = weighted_jacobi(Ah, v, rhsf, omega, nu2);