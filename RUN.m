function []=RUN(accx,accy,accz)

X=getfeatures(accx,accy,accz);

cluster(X,4)

end