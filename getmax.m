function [m,np]=getmax(mag)

ay=mag;
fs=1/0.005;
ft=1/fs;
l=size(ay,1);

y=fft(ay);
p21=abs(y/l);
p11=p21(1:l/2+1);
p11(2:end-1)=2*p11(2:end-1);


m=max(p11);
[v,l]=findpeaks(p11,'MINPEAKHEIGHT', 1);
np=size(v,1);

end