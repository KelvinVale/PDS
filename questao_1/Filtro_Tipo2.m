clear all
clc

M = 51; 
N = M+1;

Omega_p = 3; 
Omega_r = 3.2; 
Omega_s = 8;

kp = floor(N*Omega_p/Omega_s);
kr = floor(N*Omega_r/Omega_s);

k = 1:(M-1)/2;  
A = [ones(1,kp+1) zeros(1,N/2-kr)];
A(N/2) = 0;

for n=0:M
    h(n+1) = A(1) + 2*sum((-1).^k.*A(k+1).*cos(pi.*k*(1+2*n)/N));
end;
h = h./N;

stem(h);

a = 1;
fvtool(h,a)


