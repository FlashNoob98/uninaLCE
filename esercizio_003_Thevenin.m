R1=1; R2 =2; R3 = 3; R4 =4; R5 =5; E6 = 6; J7 = 7; E8 = 8;

n=5;elle=8;


%matrice A
A = -[...
    1   0   0   0   0   -1  0   0
    -1  0   -1  0   1   0   1   0  
    0   0  0   -1  -1   0   -1  1
    0   -1  0   0   0   1   0   0];

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
  fprintf('%d) : %d \n',kk,i(kk));
end
fprintf('\n');

fprintf('Potenziali nodali: \n');
for (kk=1:(n-1))
  c = char(kk+64);
  fprintf('%c) : %d \n',c,v(kk));
end
fprintf('\n');


% potenziale tra A e C
PE6 = v(3)-v(1);
fprintf('Tensione equivalente di Thevenin tra i morsetti A e C = %d \n',PE6);


%grafico
figure
bar(v)
xlabel('Indice di lato')
ylabel('Potenziali nodali');
grid on

