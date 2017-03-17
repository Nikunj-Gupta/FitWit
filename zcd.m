function n=zcd(a,b,c)

v=mag(a,b,c);

v=v-mean(v);

s=size(v,1);
count=0;

for i=1:(s-1),
    if((v(i)>0 && v(i+1)<0) || (v(i)<0 && v(i+1)>0))
        count=count+1;
    end
end
n=count;

n=floor(n/4);   %heuristically found

end