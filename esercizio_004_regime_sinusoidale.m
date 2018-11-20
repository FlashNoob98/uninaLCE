omega=1000; R1=1; R2=2; R3=3; L4= 4e-3; Z4 = 1i*(omega*L4); C5= 500e-6; Z5 = -1i/(omega*C5); J6 = 6*exp(1i*pi/6); J7 = 7*exp(-1i*pi/4); 
n=3; elle = 7;

%matrice A dei collegamenti

A=[...
    1   -1  0   1   0   -1  -1
    0   1   1   0   1   0   1];


%matrice caratteristiche M

M=diag([ -R1 -R2 -R3 -Z4 -Z5 1 1]);

%matrice N
N=diag([1 1 1 1 1 0 0]);

%termini noti b

b=[...
    zeros(n-1,1)
    zeros(5,1)
    J6
    J7];

%Matrice tableau
T = [ A zeros(n-1,n-1)
    M N*A'];

x=T\b;

i=x(1:elle);
v=x(elle+1:end);


%output
fprintf('Correnti nei lati: \n');
for kk=1:elle
  fprintf('%d)% 3.3f  % 3.3f j  A\n',kk,real(i(kk)),imag(i(kk))); % 3.3f specifica dimensione e formato del numero
end
fprintf('\n');

fprintf('Potenziali nodali: \n');
for (kk=1:(n-1))
  c = char(kk+64);
  fprintf('%c)% 3.3f  % 3.3f j  V\n',c,real(v(kk)), imag(v(kk)));
end
fprintf('\n');


V=A'*v; %Potenziali ai lati

fprintf('d.d.p. ai capi dei bipoli: \n');
for kk=1:elle
  fprintf('%d)% 3.3f  % 3.3f j  V\n',kk,real(V(kk)),imag(V(kk)));
end
fprintf('\n');
