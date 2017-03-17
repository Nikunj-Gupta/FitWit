function X=getfeatures(accx,accy,accz)

X=zeros(40,6);
j=1;

for i=1:40,
    X(i,:)=feature_extraction(accx((j:(j+149)),:),accy((j:(j+149)),:),accz((j:(j+149)),:));
    j=j+150;
end

end