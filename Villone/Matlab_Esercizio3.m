%%%%%%%%%%%%%
% Tensione a vuoto
%%%%%%%%%%%%%


R1=1;R2=2;R3=3;R4=4;R5=5;E6=6;J7=7;E8=8;

n=5;elle=8;


%%%%%%%%%%%%%
% Matrice di incidenza ridotta
%%%%%%%%%%%%%


A=[...
-1 0 0 0 0 1 0 0
1 0 1 0 -1 0 -1 0
0 0 0 1 1 0 1 -1
0 1 0 0 0 -1 0 0
];

alfa=[1 2 3 4 5 7];
beta=[6 8];
n_alfa=length(alfa);
n_beta=length(beta);

A_alfa=A(:,alfa);
A_beta=A(:,beta);


%%%%%%%%%%%%%
% Caratteristiche
%%%%%%%%%%%%%

Y_alfa=[...
1/R1 0 0 0 0 0
0 1/R2 0 0 0 0
0 0 1/R3 0 0 0
0 0 0 1/R4 0 0
0 0 0 0 1/R5 0
0 0 0 0 0 0
];

d_alfa=[0 0 0 0 0 J7].';

E_beta=[E6 E8].';

%%%%%%%%%%%%%
% Sistema di equazioni
%%%%%%%%%%%%%

Yn_alfa=A_alfa*Y_alfa*A_alfa.';
f_alfa=-A_alfa*d_alfa;

YA=[...
    Yn_alfa A_beta
    A_beta' zeros(n_beta,n_beta)
    ];

fA=[...
    f_alfa
    E_beta
    ];

%%%%%%%%%%%%%
% Soluzione
%%%%%%%%%%%%%

x=(YA)\fA;
e=x(1:n-1);

v_eq=e(1)-e(3);

fprintf('Tensione a vuoto v_eq =% 3.3f V\n',v_eq)




%%%%%%%%%%%%%
% Resistenza equivalente
%%%%%%%%%%%%%

i_hat=1;

Zm=[...
    R1+R2+R3 -R3
    -R3 R3+R5
    ];

bm=[-R1*i_hat -R5*i_hat].';

Jm=inv(Zm)*bm;

v_hat=R1*Jm(1)+R5*Jm(2)+(R1+R5)*i_hat;

fprintf('Resistenza equivalente R_eq =% 3.3f Ohm\n',v_hat/i_hat)






