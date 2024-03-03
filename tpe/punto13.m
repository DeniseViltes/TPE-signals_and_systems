clear
run punto1.m
close all
clc


n = length(y);
atenuacion = 0.3;
sonido_final = [];
%atenuacion > 0 aumenta frecuencia, atenuacion < 0 disminuye frecuencia


fonemas_sonoros = ['a','e','i','o','u','b','d','g','m','n','j','w','l'];

for i=1:length(palabra_segmentada)
    sonido = palabra_segmentada{i}{1};
    fonema = palabra_segmentada{i}{3};

    validacion = sum(fonema == fonemas_sonoros);
    if validacion == 1
        [segmento_final,~] = cambiar_frecuencia(sonido,Fs,atenuacion);
        sonido_final = cat(1,sonido_final,segmento_final);
    else
        sonido_final = cat(1,sonido_final,sonido);
    end
end
% sound(y,Fs)
% pause(2)
% sound(sonido_final,Fs)
audiowrite('psola_expansion_30.wav', sonido_final, Fs);
% 
accion = 'Expansión';
if atenuacion <0
    accion = 'Atenuación';
end
tiempo = (0:Ts:(length(y)-1)*Ts);
t2 =0:Ts:(length(sonido_final)-1)*Ts;
figure Color white
hold on
legend on
plot(tiempo(n1:n33),y(n1:n33),'DisplayName','sonido original') %(n1:n33)
plot(t2+n1 * Ts,sonido_final,'DisplayName','sonido modificado')
title(sprintf('%s del %d %% en \n frecuencia del archivo de audio',accion,abs(atenuacion)*100))
xlabel('Tiempo (s)')
ylabel('Amplitud')
