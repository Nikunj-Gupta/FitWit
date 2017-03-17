a=dlmread('allcombined2.csv',',',[1 0 1000 0]);
ay=a;
fs=1/0.005;
ft=1/fs;
l=size(a,1);
t = (0:l-1)*ft;
y=fft(ay);
p21=abs(y/l);
p11=p21(1:l/2+1);
p11(2:end-1)=2*p11(2:end-1);
f1=fs*(0:(l/2))/l;
%subplot(1,2,1);
%graph1=plot(f,p1);

a=dlmread('allcombined2.csv',',',[5000 0 6000 0]);
by=b;
fs=1/0.005;
ft=1/fs;
l=size(b,1);
t = (0:l-1)*ft;
y=fft(by);
p22=abs(y/l);
p12=p22(1:l/2+1);
p12(2:end-1)=2*p12(2:end-1);
f2=fs*(0:(l/2))/l;
%subplot(1,2,2);
%graph2=plot(f,p1);

figure, hold on 
graph1=plot(f1,p11);
graph2=plot(f2,p12);
hold off
set(graph1,'Color','r');
set(graph2,'Color','b');

max(p11)
max(p12)

x=findpeaks(p11)
y=findpeaks(p12)


%legend(graph1,graph2, {'walk','run'})