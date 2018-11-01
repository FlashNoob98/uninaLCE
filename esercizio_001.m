R1=1;
R2=2;
E3=3;
J4=4;
n=3;elle=4;

A=[...
-1 0 1 0
1 1 0 -1];

B=[...
    1 0 1 1
    0 1 0 1];

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

%tableau
T = [
    A zeros(n-1,elle)
    zeros(elle-n+1,elle) B
    M N ];
    
c=[...
    zeros(n-1,1)
    zeros(elle-(n-1),1)
    b];
   
x=T\c;

%separa nel vettore delle incognite correnti e tensioni

i=x(1:elle);
v=x(elle+1:end);

% potenze
P=v.*i;
Ptot1=v.'*i;
Ptot2=sum(P);

% stampe e postprocessing
fprintf('Potenze assorbite dai bipoli:\n');
for kk=1:elle
    fprintf('P%d = %d\n',kk,P(kk))
end
fprintf('potenza totale = %d \n',Ptot2);


