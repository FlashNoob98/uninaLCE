%risoluzione esercizio 8 trifase

omega = 314;
C = 300e-6; 
L=zeros(3,1);
L(1)=0.01; L(2)=0.02; L(3)=0.04;
R =5;
E=zeros(3,1);
E(1)=220; E(2)=220*exp(2j*pi/3); E(3)=220*exp(-2j*pi/3);
XC=-1j/(omega*C);

XL=zeros(3,1);

for kk=1:3 %impedenze L
  XL(kk)=j*omega*L(kk);
end

Z=zeros(3,1);
for kk=1:3 %impedenze trifase
  Z(kk)=((R+XL(kk))*XC)/(R+XL(kk)+XC);
end

I=zeros(3,1);
for kk=1:3  %correnti nelle 3 linee
  I(kk)=E(kk)/Z(kk);
end

%formula di Millmann trifase
numeratore=0;
for kk=1:3
  numeratore=numeratore+E(kk)/Z(kk);
end

conduttanza=0;
for kk=1:3
  conduttanza=conduttanza + 1/Z(kk);
end

%spostamento centri stella
V = numeratore/conduttanza;
fprintf('Differenza di potenziale tra i centri stella:\n');
fprintf('% 3.3f % 3.3fi V\n',real(V),imag(V));
fprintf('In Forma polare:\n');
fprintf(' Modulo    Fase\n');
fprintf('% 3.3f   %3.3fº\n',abs(V),angle(V)*180/pi);
 
