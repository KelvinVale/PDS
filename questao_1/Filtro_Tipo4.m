clear all
clc

M = 51; 
N = M+1;

Omega_p = 2.8; 
Omega_r = 3; 
Omega_s = 8;

kp = floor(N*Omega_p/Omega_s);
kr = floor(N*Omega_r/Omega_s);

k = 1:(M-1)/2;  
A = [zeros(1,N/2-kr) ones(1,kp+1)];

for n=0:M
    h(n+1) = (-1).^(N/2 + n).*A(N/2) + 2*sum((-1).^k.*A(k).*sin(pi.*k*(1+2*n)/N));
end;
h = h./N;

stem(h);

a = 1;
fvtool(h,a)