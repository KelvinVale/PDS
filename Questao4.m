clear
clc

fs = 44100;
nbits = 16;

%Definindo Audio_teste como objeto de áudio
%dataIn = audiorecorder(fs, nbits, 1);


%Lendo arquivo de audio:
[dataIn, fs] = audioread('Assobios_Kelvin_Raphael_Amiga.wav');

%Para ouvir o audio basta usar a função :  
soundsc (dataIn, fs);


Fft_Audio = fft(dataIn);
sFft_Audio = fftshift(Fft_Audio);

N = length(dataIn)-1;
f = -fs/2:fs/N:fs/2;
ind = 1:floor(N/2);
Xa = abs(sFft_Audio);

plot(f, Xa),
axis ([-0 5000 0 2000])
grid on
title('abs(fft(x))')
xlabel('f, Hz')

%%
% Filtro projetado com base na fft da primeira parte do código.
% Assobio de Kelvin

d1 = designfilt('bandpassiir','FilterOrder',20, ...
    'PassbandFrequency1',1500,'PassbandFrequency2',2500, ...
    'PassbandRipple',3,'SampleRate',fs);


dataOut = filter(d1,dataIn);


figure()
subplot(211)
plot(dataIn)
title('Antes(in)')

subplot(212)
plot(dataOut)
title('Depois(out)')



soundsc (dataOut, fs);



%%
% Filtro projetado com base na fft da primeira parte do código.
% Assobio de Raphael


d2 = designfilt('bandpassiir','FilterOrder',20, ...
    'PassbandFrequency1',500,'PassbandFrequency2',1000, ...
    'PassbandRipple',3,'SampleRate',fs);


dataOut = filter(d2,dataIn);


figure()
subplot(211)
plot(dataIn)
title('Antes(in)')

subplot(212)
plot(dataOut)
title('Depois(out)')



soundsc (dataOut, fs);



%%
% Filtro projetado com base na fft da primeira parte do código.
% Assobio de Nina (Amiga fora de elétrica)


d3 = designfilt('highpassiir','StopbandFrequency',2750/(fs/2), ...
         'PassbandFrequency',3000/(fs/2),'PassbandRipple',0.5, ...
         'StopbandAttenuation',65);


dataOut = filter(d3,dataIn);


figure()
subplot(211)
plot(dataIn)
title('Antes(in)')

subplot(212)
plot(dataOut)
title('Depois(out)')



soundsc (dataOut, fs);



%%
% Filtro projetado com base na fft da primeira parte do código.
% Som de fundo


d4 = designfilt('lowpassiir','PassbandFrequency',400/(fs/2), ...
         'StopbandFrequency',500/(fs/2),'PassbandRipple',0.5, ...
         'StopbandAttenuation',65); 



dataOut = filter(d4,dataIn);


figure()
subplot(211)
plot(dataIn)
title('Antes(in)')

subplot(212)
plot(dataOut)
title('Depois(out)')


soundsc (dataOut, fs);

































