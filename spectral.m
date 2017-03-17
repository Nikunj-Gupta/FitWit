function [f1,f2,f3]=spectral(mag_data)

fs = 200;

%% feature in Freq domain

%Normalize
mag_data = mag_data - mean(mag_data);

% apply fast fourier transformation to the signal

NFFT = 2 ^ nextpow2(length(mag_data)); 
freqAccel = fft(mag_data, NFFT) / length(mag_data);
f = fs / 2 * linspace(0, 1, NFFT / 2 + 1);

% amplitude of spectrum
amplitudeSpectrum = 2 * abs(freqAccel(1:NFFT / 2 + 1)); 

% Freq. feature 1, single sideed bandwidth is uniformSampleRate / 2, we are
% interested in 5Hz out of uniformSampleRate / 2.
sum5Hz = sum(amplitudeSpectrum(1:ceil(NFFT*5/(fs/2))));


[maxVal, maxIndx] = max(amplitudeSpectrum); % Find peak
maxFreq = f(maxIndx); %Freq. feature 2

% We are interested in single sided 0-5Hz data.
dataLength = ceil(length(f) * (5 / (fs / 2)));
dataOfInterest = amplitudeSpectrum(1:dataLength);
minDistance = ceil(length(f)/fs);

[vals, loc] = findpeaks(2*abs(dataOfInterest), 'MINPEAKHEIGHT', 1,'MINPEAKDISTANCE', minDistance, 'SORTSTR', 'descend');


numPeaks = length(vals); % Freq. feature 3 number of peaks

f1=maxFreq;
f2=sum5Hz;
f3=numPeaks;

end
