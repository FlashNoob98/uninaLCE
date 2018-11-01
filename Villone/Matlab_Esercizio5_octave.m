% =========================================================================
%  LABORATORIO DI CIRCUITI ELETTRICI
%                                             Lezione 5
% -------------------------------------------------------------------------
% Inserimento dei dati
R = 1:3; L = 4e-3; C = 500e-6; w = 1000;
% Calcolo Reattanze
Xc = -1i/w/C; Xl = 1i*w*L;
% Fasori dei correnti dei generatori
J = [6*exp(1i*pi/6);7*exp(-1i*pi/4)];

% Topologia del circuito --------------------------------------------------
% Matrice di incidenza
A = [ 1 -1  0  1  0 -1 -1 ;
      0  1  1  0  1  0  1 ];
% Matrice di Maglia
B = [ 1  0  0  0  0  1  0 ;
      1  0  0 -1  0  0  0 ;
      0  1  0  1 -1  0  0 ;
      0  0 -1  0  1  0  0 ;
      0  1  0  0  0  0 -1 ];

% Equazioni Caratteristiche -----------------------------------------------
M = diag([-R -Xl -Xc 1 1]);
N = diag([ones(1,5) 0 0]);
b = [zeros(5,1);J]; 

% -------------------------------------------------------------------------
% Risoluzione
% -------------------------------------------------------------------------
% Metodo Tableau
T = [A zeros(2,7);zeros(5,7) B;M N];
x = T\[zeros(7,1);b];

v = x(8:14); i = x(1:7);

% Display dei risultati -------------------------
disp(' Tensioni sui componenti (Modulo e fase)');
disp([abs(v) arg(v)]);
pause
disp(' Correnti nei componenti (Modulo e fase)');
disp([abs(i) arg(i)]);
pause

% Metodo dei potenziali nodali --------------------------------------------
Yn = A*(M\N)*A';
f = A/M*b;
e = Yn\f;

% Display dei risultati -------------------------
disp('Potenziali Nodali :');
disp(['  Ampl.   ' num2str(abs(e'))]);
disp(['  arg ' num2str(arg(e'))]);
pause

% -------------------------------------------------------------------------
%  Verifiche dei risultati e potenze assorbite
% -------------------------------------------------------------------------
% Verifica uguaglianza dei risultati --------------------------------------
disp('Differenza tra le soluzioni');
disp('    Tensioni             Correnti');
disp([v-A'*e   i+M\(N*A'*e-b)]);
pause
disp(' ')
% Potenze assorbite dagli elementi ----------------------------------------
disp('Potenze assorbite dai componenti');
disp(v.*conj(i));
disp(['Potenza totale : ' num2str(i'*v)]);
pause

% ========================================================  FINE  =========
