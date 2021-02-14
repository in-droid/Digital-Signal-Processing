[man_talk, fs1] = audioread("5.data/danced_with_devil.wav");
[man_scream, fs2] = audioread("5.data/Man_scream.wav");

[woman_talk, fs3] = audioread("5.data/born_yesterday.wav");
[woman_scream, fs4] = audioread("5.data/Female_scream.wav");


f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

%SETUP 1
%R = 256;
%N = 512;
%L = 35;
%window = hamming(R);


%SETUP 2
R = 512;
window = hamming(R);
N = 1024;
L = 500;

overlap = R - L;
%f1 = figure;
figure(f1);
[B, f, t] = specgram(man_talk, N, fs1, window, overlap);
imagesc(t, f, log10(abs(B)));
colormap('jet');
axis xy;
xlabel('time');
ylabel('frequencies');
title("Man talk");

[B, f, t] = specgram(man_scream, N, fs2, window, overlap);
figure(f2);
imagesc(t, f, log10(abs(B)));
colormap('jet');
axis xy;
xlabel('time');
ylabel('frequencies');
title("Man scream");


[B, f, t] = specgram(woman_talk, N, fs3, window, overlap);
figure(f3);
imagesc(t, f, log10(abs(B)));
colormap('jet');
axis xy;
xlabel('time');
ylabel('frequencies');
title("Female talk");


[B, f, t] = specgram(woman_scream, N, fs4, window, overlap);
figure(f4);
imagesc(t, f, log10(abs(B)));
colormap('jet');
axis xy;
xlabel('time');
ylabel('frequencies');
title("Female scream");















