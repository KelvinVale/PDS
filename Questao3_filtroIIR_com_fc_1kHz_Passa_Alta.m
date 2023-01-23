clear
clc

% C�digo de cria��o de um filtro IIR do tipo Butterworth com frequencia de
% corte de 1kHz e ordem N.
N = 6;
fc = 1000;
fs = 50000;

[b,a] = butter(N,fc/(fs/2), 'high'); 
% 'fc/(fs/2)' � para limitar o fc entre 0 e pi radianos.

figure()
freqz(b,a)



%% Aplica��o do filtro em uma soma de cossenos de frequ�ncias diferentes.
%Obs: Para melhor visualizar o cosseno foi necess�rio elevar o fs, por�m
%para melhor visualiza��o do passo anterior � recomendado um menor fs


fcosseno1 = 700;
fcosseno2 = 1400;

t = 0:1/fs:10/fcosseno1;

Cosseno1 = 10*cos(2*pi*fcosseno1.*t);
Cosseno2 = 10*cos(2*pi*fcosseno2.*t);

dataIn = Cosseno1 + Cosseno2;

dataOut = filter(b,a,dataIn);

figure()
subplot(211)
plot(t,dataIn)
title('Antes do filtro')
xlabel('t(s)')
ylabel('Amplitude')

subplot(212)
plot(t,dataOut)
title('Depois do filtro')
xlabel('t(s)')
ylabel('Amplitude')






















