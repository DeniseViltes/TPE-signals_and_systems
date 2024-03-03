function [sonido_nuevo,f_nueva] = cambiar_frecuencia(sonido,Fs,atenuacion)
Ts = 1/Fs;
long_sonido = length(sonido);
[~,f0] = cepstrum(sonido,1024,Ts);
periodo_n = Fs/f0;
N = round(long_sonido/periodo_n);
% N = 200;

[~,I] = findpeaks(sonido,SortStr="descend",MinPeakDistance=periodo_n/2-10);
pitch_period= periodo_n;
picos= [];
for i = 1:N
    picos(i) = I(i);
end
picos = sort(picos);

picos_nuevos = picos(1);
j = 1;

sonido_final=zeros(long_sonido,1);
pos_pico_actual =0;
pos_pico_nueva = 0;
for i = 1:N-1
    if(i<=N-1)
        pitch_period = picos(i+1)- picos(i);
    end
    step = round(1*pitch_period); %mejorar step
    
    inicio = picos(i)-step;
    final = picos(i)+step;
        if(inicio<1)
            inicio = 1;
        end
        if(final>long_sonido)
            final = long_sonido-1;
        end
    segmento = sonido(inicio:final);


    pos_pico_actual = picos(i);
    pos_pico_nueva = picos_nuevos(j);

    pp_atenuado = round(pitch_period/(1+atenuacion));
    n_ventana = length(segmento);
    ventana = crear_ventana(n_ventana,round(pitch_period*0.6));

    ventaneo = segmento.*ventana;

    picos_nuevos(j+1)= picos_nuevos(j)+pp_atenuado;

    relleno_de_ceros = rellenar_con_ceros(ventaneo,picos_nuevos(j),long_sonido);


    if(atenuacion > 0 && abs(pos_pico_actual-pos_pico_nueva)>pitch_period)
        picos_nuevos(j+2)= picos_nuevos(j+1)+pp_atenuado;
        aux = rellenar_con_ceros (ventaneo,picos_nuevos(j+1),long_sonido);
        relleno_de_ceros = relleno_de_ceros + aux;
        pos_pico_nueva = picos_nuevos(j+1);
        n_ventana = length(ventaneo)*2;
        j=j+1;
    end
   
    if (pos_pico_nueva+n_ventana/2 <= length(sonido)-pp_atenuado/2)
        sonido_final = sonido_final + relleno_de_ceros;
    end
    j=j+1;
end

sonido_nuevo = sonido_final;
f_nueva = (1/pp_atenuado)*Fs;

end



function fun = rellenar_con_ceros(segmento,referencia,long_total)
    long_segmento = length(segmento);
    ceros_iniciales = referencia-round(long_segmento/2);
    if(ceros_iniciales<0)
       ceros_iniciales = 0;
    end
    ceros_finales = long_total-long_segmento - ceros_iniciales;
    if(ceros_finales<0)
           ceros_finales=0;
    end
    fun = cat(1,zeros(ceros_iniciales, 1),segmento,zeros(ceros_finales, 1));
end
