function [fun,f0] = cepstrum(sonido,res,Ts)
    x = abs(fft(sonido,res));
    x = log10(x);
    fun = ifft(x,res);

    N = length(fun);
    t = 0:Ts:N*Ts-Ts;
    trng= t(t>=2e-3 & t<=20e-3);
    crng1 = fun(t>=2e-3 & t<=20e-3);
    [~,I1] = max(crng1);
    f0 = 1/trng(I1);
end