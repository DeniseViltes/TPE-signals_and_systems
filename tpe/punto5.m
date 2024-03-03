clear
clc
close all

[y,Fs] = audioread('hh15.wav'); 

Ts = 1/Fs;
n = length(y);
time = 0:Ts:(n-1)*Ts;


n23 = 2.993/Ts;
n24 = 3.06/Ts;
A = y(n23:n24);

n8 = 1.3/Ts;
n9 = 1.4/Ts;
O = y (n8:n9);


n18 =2.532/Ts;
n19 =2.613/Ts;
E = y(n18:n19);

figure Color 'white'

subplot(1,3,1);

xlabel('Tiempo (s)')
ylabel('')

spectrogram(A,hamming(1000),999,1000,Fs,'yaxis')
title('A');
subplot(1,3,2)
spectrogram(E,hamming(1200),1000,1000,Fs,'yaxis')
title('E')

subplot(1,3,3)
spectrogram(O,hamming(1000),999,1000,Fs,'yaxis')
title('O')

