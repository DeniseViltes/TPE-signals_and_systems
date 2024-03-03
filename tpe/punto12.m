clear
run punto10.m
close all
clc


atenuacion = 0.3;
%atenuacion > 0 aumenta frecuencia, atenuacion < 0 disminuye frecuencia



for i = 1:length(sonidos)
sonido = sonidos{i}{1};
N = 1600;
long_sonido = length(sonido);
figure Color White
subplot(3,1,1)
hold on
plot(0:Ts:Ts*(N-1),sonido(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title(sprintf('Sonido original con frecuencia %d Hz',200))

subplot(3,1,2)
[sonido_final,frecuencia_final] = cambiar_frecuencia(sonido,Fs,atenuacion);
plot(0:Ts:Ts*(N-1),sonido_final(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title(sprintf('Aumento de frecuencia a %d Hz',round(frecuencia_final)))


subplot(3,1,3)
k = atenuacion;
[sonido_final,frecuencia_final] = cambiar_frecuencia(sonido,Fs,atenuacion*(-1));
plot(0:Ts:Ts*(N-1),sonido_final(1:N))
xlabel('Tiempo (s)')
ylabel('Amplitud')
title(sprintf('Disminución de frecuencia a %d Hz',round(frecuencia_final)))


accion = 'Expansión';
if atenuacion <0
    accion = 'Atenuación';
end
sgtitle(sprintf('%d %% de variación en \n frecuencia de la vocal %s',atenuacion*100,sonidos{i}{3}))

end


