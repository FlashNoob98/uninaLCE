

R=1:6;
L1=6e-3;
C1=500e-6;
omega=500;
XL=j*omega*L1;
XC=-j/(omega*C1);

A=[...
1 0 1 0 0
0 0 -1 1 1
0 1 0 0 -1];

M=