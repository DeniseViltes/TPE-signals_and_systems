clear 
close all
clc

[y,Fs] = audioread('hh15.wav'); 

Ts = 1/Fs;
n = length(y);
time = 0:Ts:(n-1)*Ts;


%punto2
n1 = 0.864/Ts;
n2 = 0.976/Ts;

A = y(n1:n2); %A completa (de 'Alzó')

time_A = time(n1:n2);
n3 = 0.917/Ts;
n4 = 0.923/Ts;
un_periodo_A = y(n3:n4);
time1 = time(n3:n4);

cinco_periodos_A = y(n3:0.945/Ts);
time5 = time(n3:0.945/Ts);

tf3 = fft(cinco_periodos_A,Fs);
N3 = length(tf3);


tf2 = fft(un_periodo_A,Fs); 

N2= length(tf2);


tf = fft(A,Fs); %Transformada de Fourier del fono A completo
N1 = length(tf);
frec = 0:Fs/N1:Fs*(1-1/N1);




%Grafico de comparación de transformadas 
figure Color White
subplot(3,1,1);
plot(frec,abs(tf)) %todo el fonema
xlabel('Frecuencia [Hz]')
ylabel('|X|')
title('Fonema [a]')
subplot(3,1,2);
plot(frec,abs(tf2))%un periodo
xlabel('Frecuencia [Hz]')
ylabel('|X|')
title('Un periodo del fonema [a]')
subplot(3,1,3);
plot(frec,abs(tf3))%cinco periodos
xlabel('Frecuencia [Hz]')
ylabel('|X|')
title('Cinco periodos del fonema [a]')
sgtitle('Transformadas de Fourier')



% Fonema a en el tiempo con sus respectivos recortes de periodo
figure Color White
subplot(3,1,1);
plot(0:Ts:(length(A)-1)*Ts,A)
xlabel('Tiempo [s]')
ylabel('Señal')
title('Fonema [a]')
subplot(3,1,2);
plot(0:Ts:(length(un_periodo_A)-1)*Ts,un_periodo_A)
xlabel('Tiempo [s]')
ylabel('Señal')
title('Un periodo del fonema [a]')
subplot(3,1,3);
plot(0:Ts:(length(cinco_periodos_A)-1)*Ts,cinco_periodos_A)
xlabel('Tiempo [s]')
ylabel('Señal')
title('Cinco periodos del fonema [a]')
sgtitle('Representación en el tiempo')





% Ahora con la A de 5 periodos

f_de_corte = 8000;
tf3(f_de_corte:N3-f_de_corte) = 0;

figure Color White
subplot(2,1,1)
title('Señal de un periodo reconstruida')
legend on
senial = real(ifft(tf2,Fs));
hold on
xlabel('Tiempo [s]')
ylabel('Señal')
plot(0:99,senial(1:100),'DisplayName','Reconstruida')
plot(un_periodo_A,'DisplayName','Original')
subplot(2,1,2)
% 
title('Señal de 5 periodos reconstruida')
legend on
senial = real(ifft(tf3,Fs));
hold on
xlabel('Tiempo [s]')
ylabel('Señal')
plot(0:Ts:Ts*97*5,senial(1:97*5+1),'DisplayName','Reconstruida')
plot(0:Ts:Ts*(length(cinco_periodos_A)-1),cinco_periodos_A,'DisplayName','Original')

senial2 = repmat(senial(50:300),100,1);
audiowrite('cinco_periodos_A.wav',senial2,Fs)
% sound(senial2,Fs)



%Reconstruccion de un periodo


figure Color White
time = 0:Ts:Ts*(length(un_periodo_A)-1);
subplot(3,1,1)
coef = N2/Fs;
frec_formante = 4000;
tf2(frec_formante:N2-frec_formante) = 0;
legend on
senial = real(ifft(tf2,Fs));
hold on
xlabel('Tiempo [s]')
ylabel('Señal')
plot(0:Ts:99*Ts,senial(1:100),'DisplayName','Reconstruida')
plot(time,un_periodo_A,'DisplayName','Original')
title('Frecuencia de corte en 4000 Hz')

senial2 = repmat(senial(1:70),200,1);
% sound(senial2,Fs)
audiowrite('un_periodos_A.wav',senial2,Fs)

subplot(3,1,2)
frec_formante = 2000;
tf2(frec_formante:N2-frec_formante) = 0;
legend on
senial = real(ifft(tf2,Fs));
hold on
xlabel('Tiempo [s]')
ylabel('Señal')
plot(0:Ts:99*Ts,senial(1:100),'DisplayName','Reconstruida')
plot(time,un_periodo_A,'DisplayName','Original')
title('Frecuencia de corte en 2000 Hz')


subplot(3,1,3)
frec_formante = 1000;
tf2(frec_formante:N2-frec_formante) = 0;
legend on
senial = real(ifft(tf2,Fs));
hold on
xlabel('Tiempo [s]')
ylabel('Señal')
plot(0:Ts:99*Ts,senial(1:100),'DisplayName','Reconstruida')
plot(time,un_periodo_A,'DisplayName','Original')
title('Frecuencia de corte en 1000 Hz')

sgtitle('Reconstrucción de un periodo del fonema')


figure Color White
subplot(2,1,1)
title('5 periodos')
plot(frec, abs(tf3))
xlabel('Frecuencia [Hz]')
ylabel('|X|')

subplot(2,1,2)
title('1 periodo')
plot(frec,abs(tf2))
xlabel('Frecuencia [Hz]')
ylabel('|X|')

sgtitle('Transformadas manteniendo los primeros coeficientes')

