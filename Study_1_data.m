%% System Variables
M = 1; B = 4; K = 3; %mass spring and damper constants
Kg = 0.8; %K gain

%% Root locus Method
s = tf('s');                    %independent variable s
integ = 1/s;                    %integrator
G = 1/(M*(s^2)+B*s+K);          %plant transfer function
G_ol = G*integ*Kg;              %openloop transfer function
G_cl = G_ol/(1+G_ol);           %closed loop transfer function
rlocus(G);                      
%stepinfo(G_cl)

%% Lead Compensator
M = 1; B = 1; K = 1; %mass spring and damper constants
Kg = 0.8; %K gain

Lz = 1.6474; Lp = 6.95;   %lead compensator parameters

s = tf('s');
integ = 1/s;
G = 1/(M*(s^2)+B*s+K);

lead = (s+Lz)/(s+Lp);
rlocus(G*lead)

%% Lag Compsenator
lagz = 0.01; lagp = 0.0022;
lagtf = (s+lagz)/(s+lagp);
Glag_OL = G*lagtf;
rlocus(Glag_OL);