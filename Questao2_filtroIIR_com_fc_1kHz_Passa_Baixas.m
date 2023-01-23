clear
clc

% Código de criação de um filtro IIR do tipo Butterworth com frequencia de
% corte de 1kHz e ordem N.
N = 6;
fc = 1000;
fs = 50000;

[b,a] = butter(N,fc/(fs/2)); % 'fc/(fs/2)' é para limitar o fc entre 0 e pi radianos.

figure()
freqz(b,a)



%% Aplicação do filtro em um cosseno com ruído.
%Obs: Para melhor visualizar o cosseno foi necessário elevar o fs, porém
%para melhor visualização do passo anterior é recomendado um menor fs


fcosseno = 800;
t = 0:1/fs:10/fcosseno;

Cosseno = 10*cos(2*pi*fcosseno.*t);

%figure()
%plot(Cosseno)


dataIn = randn(1,length(t)) + Cosseno;

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






















