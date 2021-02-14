fs = 44100;
recorder = audiorecorder(fs,16,1); 
while 1
    disp('Play one string!')
    recordblocking(recorder, 4);
    signal = getaudiodata(recorder);
    
    N = length(signal);
    Xk = abs(fft(signal));
    Xk = Xk(1:N/2);
    f = fs*(0:N/2-1)/N;
    [maxSig, maxF] = max(Xk);
    mainFreq = f(maxF);
    if abs(mainFreq - 82.41) < 10 || abs(mainFreq / 2 - 82.41) < 9
        disp('String played: E (Tone E2)');
        tuner(mainFreq, 82.41);

    elseif abs(mainFreq - 110.00) < 10
        disp('String played: A (Tone A2)');
        tuner(mainFreq, 110.00);

    elseif abs(mainFreq - 146.83) < 15
        disp('String played: D (Tone D3)');
        tuner(mainFreq, 146.83);

    elseif abs(mainFreq - 196.00) < 20
        disp('String played: G (Tone G3)');
        tuner(mainFreq, 196.00);

    elseif abs(mainFreq - 246.94) < 20
      disp('String played: B (Tone B3)');
      tuner(mainFreq, 246.94);
      
    elseif abs(mainFreq - 329.63) < 40
      disp('String played: E (Tone E4)');
      tuner(mainFreq, 329.63);
    else
      disp('Invalid frequency, try again.')
    end
    
end

function tuner(inputFreq, note)
    temp = [ 'Frequency: ', num2str(inputFreq) ];
    disp(temp);
    if abs(inputFreq - note) < 0.5
        disp('The string is tuned')
    elseif inputFreq < note
            disp('Strenghen the string');
    else
        disp(' Loosen the string');
    end
    disp('--------------');
end

