R1=1;R2=2;R3=3;R4=4;R5=5;R6=6;J7=7;J8=8;

n=4;elle=8;


%%%%%%%%%%%%%
% tableau
%%%%%%%%%%%%%


A=[...
    1 -1 0 0 0 0 -1 -1
    0 1 1 1 0 0 0 0
    0 0 0 -1 1 -1 1 0
    ];

B=[...
    1 0 0 0 0 1 1 0
    1 0 0 0 0 0 0 1
    1 1 -1 0 0 0 0 0
    0 0 -1 1 0 -1 0 0
    0 0 0 0 1 1 0 0
];

M=[...
    -R1 0 0 0 0 0 0 0 
    0 -R2 0 0 0 0 0 0
    0 0 -R3 0 0 0 0 0
    0 0 0 -R4 0 0 0 0
    0 0 0 0 -R5 0 0 0
    0 0 0 0 0 -R6 0 0
    0 0 0 0 0 0 1 0 
    0 0 0 0 0 0 0 1
    ];

N=[...
    eye(6) zeros(6,2)
    zeros(2,6) zeros(2,2)
    ];

b=[...
    zeros(6,1)
    J7
    J8
    ];

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


x=T\c;

i=x(1:elle);
v=x(elle+1:end);

%%%%%%%%%%%%%
% potenziali nodali
%%%%%%%%%%%%%

Y=-inv(M)*N;
d=inv(M)*b;

Yn=A*Y*A.';
f=-A*d;

e=inv(Yn)*f;


%%%%%%%%%%%%%
% potenziali nodali
%%%%%%%%%%%%%

vtest=A'*e;
itest=Y*vtest+d;

figure
plot(1:elle,v,'x',1:elle,vtest,'o');
xlabel('Indice di lato')
ylabel('Tensione [V]')
legend('Tableau','Potenziali nodali');

figure
plot(1:elle,i,'x',1:elle,itest,'o');
xlabel('Indice di lato')
ylabel('Corrente [V]')
legend('Tableau','Potenziali nodali');

Ptot=v'*i;

fprintf('Somma delle potenze assorbite Ptot=%d W\n',Ptot)








