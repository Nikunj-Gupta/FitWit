function x=feature_extraction(accx,accy,accz)


%Feature_1: The mean of magnitude data
mag_data=mag(accx,accy,accz);

f1=mean(mag_data);


% Feature_2: The sum of magnitude data below 25 percentile
pr25=prctile(mag_data,25);
pr75=prctile(mag_data,75);

b25=(mag_data < pr25);
b75=(mag_data < pr75);

f2=sum(b25);


% Feature_3: The sum of magnitude data below 75 percentile

f3=sum(b75);

% Feature_4: Peak frequency in spectrum of mag data below 5 Hz
% Feature_5: Number of peaks in spectrum of mag data below 5 Hz
% Feature_6: sum of spectrum of mag data from 0 to 5 Hz

[f4,f5,f6]=spectral(mag_data);


x=[f1 f2 f3 f4 f5 f6];   
end