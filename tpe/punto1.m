close all
clc

[y,Fs] = audioread('hh15.wav'); 

Ts = 1/Fs;
n = length(y);
time = 0:Ts:(n-1)*Ts;

palabra_segmentada={};
% Segmentacion

n1 = 0.864/Ts;
n2 = 0.976/Ts;
A = y (n1:n2);

palabra_segmentada{1} = {A,time(n1:n2),'a'};

n3 = 1.119/Ts;
L = y(n2: n3);
palabra_segmentada{2}= {L,time(n2:n3),'l'};
n4 = 1.3/Ts;
Z = y(n3:n4);
palabra_segmentada{3}= {Z,time(n3:n4),'s'};

n5 = 1.401/Ts;
O = y (n4:n5);
palabra_segmentada{4}= {O,time(n4:n5),'o'};

n6 = 1.465/Ts;
L2 = y(n5:n6);
palabra_segmentada{5}= {L2,time(n5:n6),'l'};

n7 = 1.581/Ts;
A2 = y(n6:n7);
palabra_segmentada{6}= {A2,time(n6:n7),'a'};

n8 = 1.681/Ts;
V = y(n7:n8);
palabra_segmentada{7}= {V,time(n7:n8),'b'};

n9 = 1.831/Ts;
O2 = y (n8:n9);
palabra_segmentada{8}= {O2,time(n8:n9),'o'};

n10 = 1.889/Ts;
Z2 = y(n9:n10);
palabra_segmentada{9}= {Z2,time(n9:n10),'s'};


% n11 = 1.984/Ts;
n11 = n10;
n12 = 2.008/Ts;
P1 = y(n11:n12);
palabra_segmentada{10}= {P1,time(n11:n12),'p'};


n13 = 2.092/Ts;
A3 = y(n12:n13);
palabra_segmentada{11}= {A3,time(n12:n13),'a'};



n14 = 2.156/Ts;
R1 = y(n13:n14);
palabra_segmentada{12}= {R1,time(n13:n14),'r'};



n15 = 2.263/Ts;
A4 = y(n14:n15);
palabra_segmentada{13}= {A4,time(n14:n15),'a'};




n16 =2.366/Ts;
A5 = y(n15:n16);
palabra_segmentada{14}= {A5,time(n15:n16),'a'};



n17 = 2.437/Ts;
U1 = y(n16:n17);
palabra_segmentada{15}= {U1,time(n16:n17),'u'};

n18 =2.532/Ts;
Y1 = y(n17:n18);
palabra_segmentada{16}= {Y1,time(n17:n18),'z'};



n19 =2.613/Ts;
E1 = y(n18:n19);
palabra_segmentada{17}= {E1,time(n18:n19),'e'};


n20=2.726/Ts;
N1 = y(n19:n20);
palabra_segmentada{18}= {N1,time(n19:n20),'n'};
 

n21 = 2.806/Ts;
T = y(n20:n21);
palabra_segmentada{19}= {T,time(n20:n21),'t'};


 
n22 = 2.932/Ts;
A6 = y(n21:n22);
palabra_segmentada{20}= {A6,time(n21:n22),'a'};
 
 
n23 = 2.993/Ts;
R2 = y(n22:n23);
palabra_segmentada{21}= {R2,time(n22:n23),'r'};


 
n24 = 3.06/Ts;
A7 = y(n23:n24);
palabra_segmentada{22}= {A7,time(n23:n24),'a'};



n25 = 3.115/Ts;
L3 = y(n24:n25);
palabra_segmentada{23}= {L3,time(n24:n25),'l'};



n26 = 3.160/Ts;
O3 = y(n25:n26);
palabra_segmentada{24}= {O3,time(n25:n26),'o'};



n27 = 3.217/Ts;
S = y(n26:n27);

palabra_segmentada{25}= {S,time(n26:n27),'h'};




n28 =3.351/Ts;
P2 = y(n27:n28 );
palabra_segmentada{26}= {P2,time(n27:n28),'p'};

n29 =3.351/Ts;
n30 =3.472/Ts;
E2 = y(n29:n30);
palabra_segmentada{27}= {E2,time(n29:n30),'e'};


n31 =3.609/Ts;
R3 = y(n30:n31);
palabra_segmentada{28}= {R3,time(n30:n31),'R'};


n32 =3.733/Ts;
O4 = y(n31 :n32);
palabra_segmentada{29}= {O4,time(n31 :n32),'o'};


n33 =3.910/Ts;
S1 = y(n32:n33);
palabra_segmentada{30}= {S1,time(n32:n33),'s'};



figure Color 'white'

subplot(2,1,1);
xlabel('Tiempo (s)')
hold on
time_prev = n1*Ts;
xlim([n1*Ts,n33*Ts]);
for i = 1:length(palabra_segmentada)
    tiempo = palabra_segmentada{i}{2};
    amplitud = palabra_segmentada{i}{1};
    letra = palabra_segmentada{i}{3};
    plot(tiempo,amplitud)
    xline(tiempo(end))
    text(((tiempo(end)-time_prev)/2)+time_prev,-0.5,letra)
    time_prev = tiempo(end);
end

subplot(2,1,2);
tf = abs(fft(y));
N = length(tf);
frec = 0:Fs/N:Fs*(1-1/N);
spectrogram(y,hamming(40),35,1000,Fs,'yaxis')
xlabel('Tiempo (s)')
ylabel('Frecuencia (kHz)')
xlim([n1*Ts,n33*Ts]);
time_prev = n1*Ts;
for i = 1:length(palabra_segmentada)
    tiempo = palabra_segmentada{i}{2};
    letra = palabra_segmentada{i}{3};
    xline(tiempo(end))
    text(((tiempo(end)-time_prev)/2)+time_prev,2,letra)
    time_prev = tiempo(end);
end


