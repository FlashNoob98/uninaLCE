function [y]=s(x,n)
y=zeros(1,length(x));
for i=1:n
if mod(i ,2)==1
y=y+2*sin(i*x)/(i);
else
y=y-2*sin(i*x)/(i);
end
end
end