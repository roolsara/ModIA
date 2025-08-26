function I2hh = interpol(N)

Nc = N/2 - 1;
I2hh = zeros(N-1, Nc);
    %I2h_h = zeros(Nc, N-1);

for j = 1:Nc
    i = 2*j-1;
    I2hh(i:i+2,j) = [0.5,1,0.5]';
end