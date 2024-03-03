clear 
close all
clc

[z, Fs1] = audioread('grabacion.ogg');

[y, Fs2] = audioread('hh15.wav');

Ts1 = 1/Fs1;
Ts2 = 1/Fs2;
n_1 = length(z);
n_2 = length(y);
time1 = 0:Ts1:(n_1-1)*Ts1;
time2 = 0:Ts2:(n_2-1)*Ts2;

figure Color White

subplot(2, 1, 1)
plot(time2, y)
xlim([0.8 4])
xlabel('Tiempo')
ylabel('Señal')
title('Audio locutora')
subplot(2, 1, 2)
plot(time1, z)
xlabel('Tiempo (s)')
ylabel('Señal')
xlim([0.5 3.5])
title('Audio grabado')


figure Color White

subplot(2, 1, 1)
spectrogram(y, 1000, 800, 1000,Fs1, 'yaxis')
xlim([0.8 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
title('Espectograma locutora')
subplot(2, 1, 2)
spectrogram(z,1000, 900,6000, Fs2, 'yaxis')
xlim([0.5 3.5])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
title('Espectograma grabado')

sgtitle('Espectrograma de banda angosta')


figure Color White

subplot(2, 1, 1)
spectrogram(y, 40, 35, 1000,Fs1, 'yaxis')
xlim([0.8 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
title('Espectograma locutora')
subplot(2, 1, 2)
spectrogram(z,40, 35,6000, Fs2, 'yaxis')
xlim([0.5 3.5])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
title('Espectograma grabado')

sgtitle('Espectrograma de banda ancha')

