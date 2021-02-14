[signal, fs] = audioread("1.danes_je_lep_dan_klarinet_22050.wav");

N = length(signal);
f = fs*(0:N-1)/ N;
ftx  = fft(signal);


tiledlayout(2,1);

nexttile;
plot(f, abs(ftx), 'r');
xlim([0 fs/2]);
title('Sound record frequencies');

w = 2*pi*438.5/fs;
n = (0:N-1);

%clarinet equation
x = cos(w * n) + 0.375 * cos(3*w*n) + 0.581 * cos(5*w*n) + 0.382 * cos(7*w*n)... 
    + 0.141*cos(9*w*n) +0.028*cos(11*w*n)+ 0.009 *cos(13*w*n);

ftklarinet = fft(x);

nexttile;
plot(f, abs(ftklarinet), 'k');
xlim([0 fs/2]);
title('Clarinet frequencies');


bnds = bandstop(signal, [415 465], fs);

bnds = bandstop(bnds, [1295 1345], fs);
bnds = bandstop(bnds, [2174 2224], fs);
bnds = bandstop(bnds, [3055 3105], fs);
bnds = bandstop(bnds, [3935 3985], fs);
bnds = bandstop(bnds, [4815 4865], fs);
bnds = bandstop(bnds, [5675 5725], fs);
soundsc(bnds, fs);
ftb = fft(bnds);
plot(f, abs(ftb));
title('Signal frequencies after filtering');

xlim([0 fs/2]);

audiowrite("filtered.wav", bnds, fs);
