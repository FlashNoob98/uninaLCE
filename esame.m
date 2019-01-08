%esercizio prova esame regime
J=4*exp(-pi*j/4);
R=1:4;
L=2e-3;
omega=1000;
n=2; elle=3;
ZL=j*omega*L;

Zeq=R(2)+R(3)+ZL;

A=[...
-1  1 1]; %nodo A

M=diag([1 -R(4) -Zeq]); %matrice caratteristiche

N=diag([0 1 1]);

%termini noti
b=[...
  zeros(n-1,1)
  J
  zeros(2,1)
  ];

  
  %tableau
T = [ A zeros(n-1,n-1)
    M N*A'];
x=inv(T)*b;
i=x(1:elle);
v=x(elle+1:end);

fprintf("Corrente nell'induttore a regime\n");
fprintf("% 3.2fsin(%dt% 3.2f)\n",abs(i(3)*sqrt(2)),omega,angle(i(3)));

