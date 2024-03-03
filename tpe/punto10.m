clear
run punto9.m
clc
close all



diez_pulsos_a = lsim(h_A,diez_pulsos);
diez_pulsos_e = lsim(h_E,diez_pulsos);
diez_pulsos_i = lsim(h_I,diez_pulsos);
diez_pulsos_o = lsim(h_O,diez_pulsos);
diez_pulsos_u = lsim(h_U,diez_pulsos);


n = length(diez_pulsos_a);
time = 0:Ts:(n-1)*Ts;
sonidos = {};


sonidos{1} = {sonido_a,sonido_filtrado_a,'A',diez_pulsos_a};
sonidos{2} = {sonido_e,sonido_filtrado_e,'E',diez_pulsos_e};
sonidos{3} = {sonido_i,sonido_filtrado_i,'I',diez_pulsos_i};
sonidos{4} = {sonido_o,sonido_filtrado_o,'O',diez_pulsos_o};
sonidos{5} = {sonido_u,sonido_filtrado_u,'U',diez_pulsos_u};



% figure Color white
for i = 1:5

figure Color white
% subplot(2,5,i)
subplot(2,1,1)
legend on
[c1,f0] = cepstrum(sonidos{i}{4},1024,Ts);
N= 1024;
t = 0:Ts:N*Ts-Ts;

sprintf('F0 de %s %3.2f Hz.\n',sonidos{i}{3},f0)
plot(t,c1)
xlabel('Tiempo (s)')
ylabel('c')
title(sprintf('Cepstrum vocal %s',sonidos{i}{3}))


tracto = c1(1:(1/f0)/Ts-10);
subplot(2,1,2)
% subplot(2,5,i+5)
grid on
N = length(tracto);
frec = 0:Fs/N:Fs*(1-1/N);
plot(frec,abs(fft(tracto)))
ylabel('|X|')
xlabel('Frecuencia [kHz]')
title(sprintf('Tracto vocal %s',sonidos{i}{3}))
end





