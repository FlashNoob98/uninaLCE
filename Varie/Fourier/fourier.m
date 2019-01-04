clc
clear
close  all
n=input('Fino a che  grado  si  desidera  disegnare?   ');
choice=menu("scegli  la  funzione  onda ",'Quadra ','Dente di sega ');
punti =200;
h=2*pi/punti;
for i=1: punti
ascisse(i)=-pi+(i-1)*h;
end
for i=1:n
xS(:,i)= ascisse;
z(:,i)=i*ones(1,punti);
end
if  choice ==1;
for i=1:n
ygibbs(:,i)=q(ascisse ,i);
end
else
for i=1:n
ygibbs(:,i)=s(ascisse ,i);
end
end
box=ygibbs;
yfej=ygibbs;
for i=2:n
for j=1:i-1
yfej(:,i)=yfej(:,i)+ ygibbs(:,j);
end
yfej(:,i)=yfej(:,i)./i;
end
%grafico
figure (1)
subplot(1, 2, 1)
plot3(z,xS ,ygibbs ,'b','LineWidth',1);
xlabel("grado  del  polinomio ");
ylabel("x");
zlabel("y");
grid on;
subplot(1, 2, 2)
plot3(z,xS ,yfej ,'b','LineWidth',1);
xlabel('grado  del  polinomio ');
ylabel('x');
zlabel('y');
grid on;










