clear
run punto1.m
close all
clc

len_segmentos = length(palabra_segmentada);

n = length(y);
time = 0:Ts:(n-1)*Ts;

figure Color White
subplot(2,1,1)
plot(time,y)
xlabel('Tiempo (s)')
ylabel('Amplitud')
xlim([0.7,4])
subplot(2,1,2)
xlim([0.7,4])
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
step = 510;
hold on
f_promedio=0;
j = 0;
for i = n1:round(step/5):n33
    pos_siguiente = i+step;
    segmentito = y(i:pos_siguiente);
    N = length(segmentito);
    [~,f0] = cepstrum(segmentito,1024,Ts);
    j = j+1;
    f_promedio = f_promedio +f0;
    if(f0>0)
        frecuencias(i:pos_siguiente) = f0;
        plot(time(i:pos_siguiente),frecuencias(i:pos_siguiente),'*');
    end
end
f_promedio = f_promedio/j;
title(sprintf('Frecuencia promedio = %.1f',f_promedio))