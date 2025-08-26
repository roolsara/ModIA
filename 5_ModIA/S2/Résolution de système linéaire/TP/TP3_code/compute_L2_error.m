function err = compute_L2_error(N,u,uh)
% 1. Get mesh size h
h = 1/N;
% 2. Error vector
em = u-uh;
% 3. Compute the error with the formula above
err = sqrt(h*(em')*em);