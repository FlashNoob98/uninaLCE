function [y]=q(x,n)
y=zeros(1,length(x));
for i=1:n
if mod(i ,2)==1
y=y+4*sin(i*x)/(pi*i);
end
end
end