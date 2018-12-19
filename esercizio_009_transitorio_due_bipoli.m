%transitorio con due bipoli dinamici
R=1:6; %vettore delle resistenze
L=6e-3; C=500e-6; %bipoli dinamici
omega=500;  %pulsazione
XL=j*omega*L; XC=-j/(omega*C);  %impedenze

%parallelo L,R2,R5
Z2=R(5)*(XL+R(2))/(R(5)+R(2)+XL);

%parallelo C R4 R6
Z4=(R(4)+XC)*R(6)/(R(4)+R(6)+XC);

%generatori di corrente
J1=5*exp(j*pi/6);
J2=exp(-j*pi/4);
%nodi e lati rete equivalente
n=3; elle = 6;

%matrice di incidenza A
A=[...
-1  1  1  0 0 0         %nodo A
0   0   -1  1 1 -1];    %nodo B

%matrice delle caratteristiche M
M = diag([1 -R(1) -Z2 -Z4 -R(3) 1]);

%
N=diag([0 1 1 1 1 0]);

%termini noti
b=[...
  zeros(n-1,1)
  J1
  zeros(4,1)
  J2
  ];

%tableau
T = [ A zeros(n-1,n-1)
    M N*A'];

x=T\b;
i=x(1:elle);
v=x(elle+1:end);
%tensioni
V=A'*v;

%potenze
P_totreal=0;
P_totimag=0;
Patt=zeros(elle,1);
Preat=zeros(elle,1);
Pcomp=zeros(elle,1);

fprintf('d.d.p. ai capi dei bipoli: \n');
for kk=1:elle
  fprintf('%d)% 3.3f  % 3.3f j  V\n',kk,real(V(kk)),imag(V(kk))); 
  Pcomp(kk)= V(kk)*conj(i((kk)));
  P_totreal=P_totreal+real(Pcomp(kk));  %potenza attiva
  P_totimag=P_totimag+imag(Pcomp(kk));  %potenza reattiva
  Patt(kk)=real(Pcomp(kk));
  Preat(kk)=imag(Pcomp(kk));
end

fprintf('\nPotenze complesse nei lati:\n')
for kk=1:elle
  fprintf('%d)% 3.3f  % 3.3f j  W\n',kk,Patt(kk),Preat(kk));
end

fprintf('\nFasori delle correnti\n');
fprintf('  Modulo   Fase\n');
for kk=1:elle
    fprintf('%d)% 3.3f  % 3.2f° \n',kk,abs(i(kk)),angle(i(kk))*180/pi);
end
fprintf('\n');

##
%corrente in L1
IL=i(3)*R(5)/(R(5)+XL+R(2));
%tensioni condensatore
VC=v(2)*XC/(XC+R(4));


