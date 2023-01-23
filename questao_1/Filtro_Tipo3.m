clear all

M = 52; 
N = M+1;

Omega_p1 = 2; 
Omega_p2 = 4; 
Omega_r1 = 1.8; 
Omega_r2 = 4.2; 
Omega_s = 10;

kp1 = floor(N*Omega_p1/Omega_s);
kr1 = floor(N*Omega_r1/Omega_s);
kp2 = floor(N*Omega_p2/Omega_s);
kr2 = floor(N*Omega_r2/Omega_s);

k = 1:M/2;  
A = [zeros(1,kr1+1) ones(1,kp2-kp1+1) zeros(1,M/2 - kr2+1)];

for n=0:M
    h(n+1) = 2*sum((-1).^(k+1).*A(k+1).*sin(pi.*k*(1+2*n)/N));
end;
h = h./N;

stem(h);

a = 1;
fvtool(h,a)