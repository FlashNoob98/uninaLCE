%esercizio 2 versione ridotta
%definisco le variabili
R1=1;
R2=2;
E3=3;
J4=4;
n=3;elle=4;

A=[...
-1 0 1 0
1 1 0 -1];

M=[...
    -R1 0 0 0
    0 -R2 0 0
    0 0 0 0
    0 0 0 1];

N=[...
    1 0 0 0
    0 1 0 0
    0 0 1 0
    0 0 0 0];
    
b=[...
    0
    0
    E3
    J4];
    
%I = eye(5);

T = [...
A zeros(n-1,n-1)
M N*A']

c=[...
    zeros(n-1,1)
    b]

x=inv(T)*c

%separa nel vettore delle incognite correnti e tensioni

i=x(1:elle)
v=x(elle+1:end)

