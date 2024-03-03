close all
clc

Fs = 16000;
Ts = 1/(Fs);

A = [830 110; 1400 160;  2890 210; 3930 230];
E = [500 80; 2000 156; 3130 190; 4150 220];
I = [330 70; 2765 130; 3740 178; 4366 200];
O = [546 97; 934 130; 2966 185; 3930 240];
U = [382 74; 740 150; 2760 210; 3380 180];

ceros = zeros(1,8); 
gain = 1;

poles_A =[];
poles_A = cargar_polos(poles_A,A,Fs);
h_A = zpk(ceros, poles_A, gain,Ts);




poles_E = [];
poles_E = cargar_polos(poles_E,E,Fs);
h_E = zpk(ceros, poles_E, gain,Ts);

poles_I = [];
poles_I = cargar_polos(poles_I,I,Fs);
h_I = zpk(ceros, poles_I, gain,Ts);

poles_O = [];
poles_O = cargar_polos(poles_O,O,Fs);
h_O = zpk(ceros, poles_O, gain,Ts);

poles_U = [];
poles_U = cargar_polos(poles_U,U,Fs);
h_U = zpk(ceros, poles_U, gain, Ts);

tractos_vocales={};

tractos_vocales{1} = {'A',h_A};
tractos_vocales{2} = {'E',h_E};
tractos_vocales{3} = {'I',h_I};
tractos_vocales{4} = {'O',h_O};
tractos_vocales{5} = {'U',h_U};

for i= 1:5
figure Color white
subplot (1,2,1)
pzmap(tractos_vocales{i}{2})
subplot(1,2,2)
[h,t]=impulse(tractos_vocales{i}{2});
h=h/Fs;
plot(abs(fft(h,Fs))/Fs)
ylabel('|X|')
xlabel('Frecuencia [kHz]')
sgtitle(sprintf('Vocal %s',tractos_vocales{i}{1}))
end


function fun = cargar_polos(poles,letra,Fs)
    j = 1;
    for i = 1:4
        poles(j) = P_n(letra(i,1), letra(i,2), Fs);
        poles(j+1)= conj(poles(j));
        j = j+2;
    end
    fun = poles;
end

function fun = P_n(F, B, Fs)
    fun = exp(-2 * pi * B / Fs) * exp(1i * 2 * pi * F / Fs);   
end