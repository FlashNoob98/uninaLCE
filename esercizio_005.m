%calcola la differenza di potenziale ai capi del condensatore C2
%convertito generatore di tensione in generatore di corrente equivalente

%dati
omega=1000; R1=1; R2=2; R3=3; R4=4; R5=5; C1=200E-6;  C2=400E-6;
%impedenze C1 C2
Z7=-1i/(omega*C1);  Z6=-1i/(omega*C2);
%generatore di corrente
J8=5*exp(1i*pi/4);
%nodi e lati
n=5; elle=8;

%matrice di incidenza A
A=[...
1  0  1  0  0  1  0 -1
0  1  0  0  0 -1  0  0
0 -1 -1  1  0  0  1  0
0  0  0  0  1  0 -1  0];

%matrice delle caratteristiche M
M=diag([-R1 -R2 -R3 -R4 -R5 -Z6 -Z7  1]);

N=diag([ 1   1   1   1   1   1   1   0]);

%vettore termini noti
b=[...
zeros(n-1,1)
zeros(7,1)
J8];

%Matrice tableau
T = [ A zeros(n-1,n-1)
    M N*A'];

%soluzione del sistema
x=T\b;
%vettore corrente e potenziali nodali
i=x(1:elle);
v=x(elle+1:end);
%vettore ddp
V=A'*v;

fprintf('\nDifferenza di potenziale ai capi di C2:\n');
fprintf('% 3.3f  % 3.3fi   \n',real(V(6)),imag(V(6)));
fprintf('Nel dominio del tempo:\n');
fprintf('% 3.3fsin(%dt% 3.3f)\n',abs(V(6)),omega,angle(V(6)));

%trasformazione e output soluzioni
X=zeros(elle,2);  %vettore correnti in modulo e angolo
for kk=1:(elle)
  X(kk,1)=abs(i(kk));          %modulo
  X(kk,2)=angle(i(kk))*180/pi;   %angolo
end

Y=zeros(elle,2);  %vettore ddp in modulo e angolo
for kk=1:(elle)
  Y(kk,1)=abs(V(kk));          %modulo
  Y(kk,2)=angle(V(kk))*180/pi;   %angolo
end

%%%separazione vettori
%%I=zeros(elle,2);
%%Vb=zeros(elle,2);
%%for kk=1:elle
%%  I(kk,1)=X(kk,1);
%%  I(kk,2)=X(kk,2);
%%end

%correnti nei lati
fprintf('\nCorrenti nei bipoli\n');
fprintf('    Modulo  Angolo');
for kk=1:elle
  fprintf('\n%d) % 3.3f  % 3.2f°',kk,X(kk,1),X(kk,2));
end

fprintf('\n\nTensioni ai bipoli:\n');
fprintf('    Modulo  Angolo');
for kk=1:elle
  fprintf('\n%d) % 3.3f  % 3.2f°',kk,Y(kk,1),Y(kk,2));
end
fprintf('\n');
