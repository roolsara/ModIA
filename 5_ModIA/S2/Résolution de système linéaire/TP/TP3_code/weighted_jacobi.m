function ump1 = weighted_jacobi(A,um,f,omega,m)

    D = diag(diag(A)); 
    D_inv = inv(D); 
    Id = speye(size(A,1));

    %lambda_max = max(eig(D_inv * A));
    %omega_max = 2 / lambda_max; 
    
    %if omega < 0 || omega > omega_max
    %    error('Omega doit être dans l''intervalle [0, %.4f]', omega_max);
    %end

    for k = 1:m
        um = (Id - omega * D_inv * A) * um + omega * (D_inv * f);
    end
    
    ump1 = um;
