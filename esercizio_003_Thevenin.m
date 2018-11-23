R1=1; R2 =2; R3 = 3; R4 =4; R5 =5; E6 = 6; J7 = 7; E8 = 8;

n=5;elle=8;


%matrice A
A = [...
   -1   0   0   0   0   1   0   0
    1   0   1   0  -1   0  -1   0  
    0   0   0   1   1   0   1  -1
    0   1   0   0   0  -1   0   0];

%matrice M
M = diag([-R1 -R2 -R3 -R4 -R5 0 1 0]);

%matrice N
N = diag([1 1 1 1 1 1 0 1]);

%vettore termini noti b
b = [...
    zeros(n-1,1)
    zeros(5,1)
    E6
    J7
    E8];

%Matrice tableau
T = [ A zeros(n-1,n-1)
    M N*A'];

x=T\b;

i=x(1:elle);
v=x(elle+1:end);

%output
fprintf('Correnti nei lati: \n');
for kk=1:elle
  fprintf('%d)% 3.3f  A\n',kk,i(kk)); % 3.3f specifica dimensione e formato del numero
end
fprintf('\n');

fprintf('Potenziali nodali: \n');
for (kk=1:(n-1))
  c = char(kk+64);
  fprintf('%c)% 3.3f  V\n',c,v(kk));
end
fprintf('\n');


% potenziale tra A e C
PE6 = v(3)-v(1);
fprintf('Tensione equivalente di Thevenin tra i morsetti A e C = % 3.3f \n',PE6);

%%%%%%%%%%%%%
% Resistenza equivalente
%%%%%%%%%%%%%

i_hat=1;  %generatore  di prova da 1A

%matrice resistori per metodo delle maglie
Zm=[...
    R1+R2+R3 -R3
    -R3 R3+R5
    ];

%vettore tensioni maglia del generatore
bm=[-R1*i_hat -R5*i_hat].';

Jm=Zm\bm;  %calcolo correnti nelle due maglie

v_hat=R1*Jm(1)+R5*Jm(2)+(R1+R5)*i_hat;  %tensione equivalente di thevenin 
%(la somma è algebrica, il verso delle correnti è già calcolato nel vettore Jm)


fprintf('Resistenza equivalente R_eq =% 3.3f Ohm\n',v_hat/i_hat)


%grafico
figure
bar(v)
xlabel('Indice di lato')
ylabel('Potenziali nodali');
grid on

