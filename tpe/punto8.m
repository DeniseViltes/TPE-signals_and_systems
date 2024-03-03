run punto6.m 
run punto7.m
close all
clc

% Para escuchar las vocales, descomentar la linea 23

n = length(tren);

%sonidos
sonido_a = lsim(h_A,tren);

sonido_e = lsim(h_E,tren);

sonido_i = lsim(h_I,tren);

sonido_o = lsim(h_O,tren);

sonido_u = lsim(h_U,tren);


todas_las_vocales = cat(1,sonido_a,sonido_e,sonido_i,sonido_o,sonido_u);
audiowrite('punto8.wav',todas_las_vocales,Fs);
% sound(todas_las_vocales,Fs)
% figure
% plot(0:Ts:(length(todas_las_vocales)-1)*Ts,todas_las_vocales)

%A


figure Color White
N = 1600;
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(3,1,1)
plot(0:Ts:(N-1)*Ts,sonido_a(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('100ms de la vocal obtenida')
subplot(3,1,2)
plot(abs(fft(sonido_a,Fs))/Fs)
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title('Transformada de la vocal')
subplot(3,1,3)
spectrogram(sonido_a,1000,900,1000,Fs, 'yaxis')
ylim([0 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
sgtitle('Vocal A')



figure Color White
subplot(3,1,1)
plot(0:Ts:(N-1)*Ts,sonido_e(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('100ms de la vocal obtenida')
subplot(3,1,2)
plot(abs(fft(sonido_e,Fs))/Fs)
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title('Transformada de la vocal')
subplot(3,1,3)
spectrogram(sonido_e,1000,900,1000,Fs, 'yaxis')
ylim([0 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
sgtitle('Vocal E')


figure Color White
subplot(3,1,1)
plot(0:Ts:(N-1)*Ts,sonido_i(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('100ms de la vocal obtenida')
subplot(3,1,2)
plot(abs(fft(sonido_i,Fs))/Fs)
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title('Transformada de la vocal')
subplot(3,1,3)
spectrogram(sonido_i,1000,900,1000,Fs, 'yaxis')
ylim([0 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
sgtitle('Vocal I')




figure Color White
subplot(3,1,1)
plot(0:Ts:(N-1)*Ts,sonido_o(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('100ms de la vocal obtenida')
subplot(3,1,2)
plot(abs(fft(sonido_o,Fs))/Fs)
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title('Transformada de la vocal')
subplot(3,1,3)
spectrogram(sonido_o,1000,900,1000,Fs, 'yaxis')
ylim([0 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
sgtitle('Vocal O')



figure Color White
subplot(3,1,1)
plot(0:Ts:(N-1)*Ts,sonido_u(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('100ms de la vocal obtenida')
subplot(3,1,2)
plot(abs(fft(sonido_u,Fs))/Fs)
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title('Transformada de la vocal')
subplot(3,1,3)
spectrogram(sonido_u,1000,900,1000,Fs, 'yaxis')
ylim([0 4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
sgtitle('Vocal U')

