run punto8.m
load ventana.mat
close all
clc

% Para escuchar las vocales, descomentar la linea 89
Nmax = 1000;
time = 0:Ts:(Nmax-1)*Ts;

figure Color White
subplot(2,3,1)
hold on
plot(time,sonido_a(1:Nmax),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_a = filter(Hd,sonido_a);
plot(time,sonido_filtrado_a(1:Nmax),'Color',[0.4940 0.1840 0.5560]);
xlabel('Tiempo (s)')
ylabel('Amplitud')


title('Vocal A')

subplot(2,3,2)
hold on
plot(time,sonido_e(1:Nmax),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_e = filter(Hd,sonido_e);
plot(time,sonido_filtrado_e(1:Nmax),'Color',[0.4940 0.1840 0.5560]);
title('Vocal E')
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(2,3,3)
hold on
plot(time,sonido_i(1:Nmax),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_i = filter(Hd,sonido_i);
plot(time,sonido_filtrado_i(1:Nmax),'Color',[0.4940 0.1840 0.5560]);
title('Vocal I')
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(2,3,4)
hold on
plot(time,sonido_o(1:Nmax),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_o = filter(Hd,sonido_o);
plot(time,sonido_filtrado_o(1:Nmax),'Color',[0.4940 0.1840 0.5560]);
title('Vocal O')
xlabel('Tiempo (s)')
ylabel('Amplitud')
subplot(2,3,5)
legend on
hold on
plot(time,sonido_u(1:Nmax),'Color',[0.8500 0.3250 0.0980],'DisplayName','Sonido original')
sonido_filtrado_u = filter(Hd,sonido_u);sonido_a(1:900);
plot(time,sonido_filtrado_u(1:Nmax),'Color',[0.4940 0.1840 0.5560],'DisplayName','Sonido filtrado');
title('Vocal U')
xlabel('Tiempo (s)')
ylabel('Amplitud')

figure Color White
subplot(2,3,1)
hold on
plot(abs(fft(sonido_a,Fs)/Fs),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_a = filter(Hd,sonido_a);
plot(abs(fft(sonido_filtrado_a,Fs)/Fs),'Color',[0.4940 0.1840 0.5560]);
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title('Vocal A')

subplot(2,3,2)
hold on
plot(abs(fft(sonido_e,Fs)/Fs),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_e = filter(Hd,sonido_e);
plot(abs(fft(sonido_filtrado_e,Fs)/Fs),'Color',[0.4940 0.1840 0.5560]);
title('Vocal E')
ylabel('|X|')
xlabel('Frecuencia [kHz]')
subplot(2,3,3)
hold on
plot(abs(fft(sonido_i,Fs)/Fs),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_i = filter(Hd,sonido_i);
plot(abs(fft(sonido_filtrado_i,Fs)/Fs),'Color',[0.4940 0.1840 0.5560]);
title('Vocal I')
ylabel('|X|')
xlabel('Frecuencia [kHz]')
subplot(2,3,4)
hold on
plot(abs(fft(sonido_o,Fs)/Fs),'Color',[0.8500 0.3250 0.0980])
sonido_filtrado_o = filter(Hd,sonido_o);
plot(abs(fft(sonido_filtrado_o,Fs)/Fs),'Color',[0.4940 0.1840 0.5560]);
title('Vocal O')
ylabel('|X|')
xlabel('Frecuencia [kHz]')
subplot(2,3,5)
legend on
hold on
plot(abs(fft(sonido_u,Fs)/Fs),'Color',[0.8500 0.3250 0.0980],'DisplayName','Sonido original')
sonido_filtrado_u = filter(Hd,sonido_u);
plot(abs(fft(sonido_filtrado_u,Fs)/Fs),'Color',[0.4940 0.1840 0.5560],'DisplayName','Sonido filtrado');
title('Vocal U')
ylabel('|X|')
xlabel('Frecuencia [kHz]')

% sound(todas_las_vocales,Fs)
% pause(6)
filtradas= cat(1,sonido_filtrado_a,sonido_filtrado_e,sonido_filtrado_i,sonido_filtrado_o,sonido_filtrado_u);
% sound(filtradas,Fs)

audiowrite('punto9.wav',filtradas,Fs);

