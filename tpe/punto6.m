clear
close all
clc


f0 = 200;
T = 1/f0;
Fs = 16000;
Ts = 1/Fs;
p0 = 1;

t_p = 0.4*T;
t_n = 0.16*T;

tmax = 10*T;

time = 0:Ts:T-Ts;

p = [];
i = 1;
for t = time
    if (t>= 0 && t<= t_p)
       p(i) =  p0/2.*(1-cos(t* pi /t_p));
    elseif (t> t_p && t<= (t_p+t_n))
        p(i) = p0 * cos((t-t_p)/t_n.*pi/2);
    else
        p(i)= 0;
    end
        i = i+1;
end


diez_pulsos= repmat(p,1,10);
tren= repmat(p,1,200);
dos_pulsos= repmat(p,1,2);


tf_un_pulso = fft (p,Fs);
N1 = length(tf_un_pulso);
frec1 = 0:Fs/N1:Fs*(1-1/N1);

tf_diez = fft(diez_pulsos,Fs);
N10 = length(tf_diez);
frec10 = 0:Fs/N10:Fs*(1-1/N10);


tf_dos = fft(dos_pulsos,Fs);
N2 = length(tf_dos);
frec2 = 0:Fs/N2:Fs*(1-1/N2);

figure Color white
grid on
hold on
plot (0:Ts:(length(diez_pulsos)-1)*Ts,diez_pulsos)
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Tren de pulsos glóticos')



figure Color white
grid on
legend on
hold on
plot ( frec10,abs(tf_diez)/length(diez_pulsos),'DisplayName','Diez pulsos')
plot ( frec2,abs(tf_dos)/length(dos_pulsos),'DisplayName','Dos pulsos','LineWidth',2)
plot(frec1,abs(tf_un_pulso)/length(p),'DisplayName','Un pulso', 'LineWidth',2)
xlabel('Tiempo (s)')
ylabel('Frecuencia [kHz]')
title('Transformada de fourier de los pulsos glóticos')



