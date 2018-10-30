% Laboratorio di circuiti elettrici
% Esercizio 1
% Fabio Villone 15/3/2018

R1=1;R2=2;E3=3;J4=4; % dati dei bipoli
n=3; elle=4; % parametri topologici

% matrice di incidenza ridotta
A=[...
    -1 0 1 0
    1 1 0 -1];

% matrice di incidenza maglia-lato
B=[...
    1 0 1 1
    0 1 0 1];

% caratteristica
M=[...
    -R1 0 0 0
    0 -R2 0 0
    0 0 0 0
    0 0 0 1
    ];

N=[...
    1 0 0 0
    0 1 0 0
    0 0 1 0
    0 0 0 0
    ];

b=[...
    0
    0
    E3
    J4
];


% matrice di tableau e termine noto
T=[...
    A zeros(n-1,elle)
    zeros(elle-(n-1),elle) B
    M N
    ];

c=[...
    zeros(n-1,1)
    zeros(elle-(n-1),1)
    b
    ];

% soluzione
x=T\c;

i=x(1:elle);
v=x(elle+1:end);

% potenze
P=v.*i;
Ptot1=v.'*i;
Ptot2=sum(P);

% stampe e postprocessing
fprintf('Potenze assorbite dai bipoli:\n');
for kk=1:elle
    fprintf('P%d = %d\n',kk,P(kk));
end

figure
bar(P)
xlabel('Indice di lato')
ylabel('Potenza assorbita [W]');
grid on

figure
plot(1:elle,v,'x',1:elle,i,'o')
xlabel('Indice di lato')
ylabel('Grandezze cicuitali');
legend('Tensioni [V]','Correnti [A]');
grid on

fprintf('Somma delle potenze assorbite Ptot1=%d W\n',Ptot1)
fprintf('Somma delle potenze assorbite Ptot2=%d W\n',Ptot2)

