clc; close all; clear;
%This script will be calculating the inertia from the
%motor/gear/joint/link/payload on the robot. 
%Related to the first, second and third joint.
%first joint is the joint at the base, third joint is the joint closest to
%the end of the robot arm.

%Constants
LT1=1500; %Each arm  are 1.5 meters long
LT2=1500;
LT3=1500;
rho=2.7*(10^-6); %kg/mm^3Fi

% Motor og gear
JM1 = 13.4*(10^-4);   % Must be given in KG*M^2
JM2 = 4.75*(10^-4);
JM3 = 0.546*(10^-4);

n1 = 61;
n2 = 50;
n3 = 35;

JG1 = 8.79*10^-4; % Must be given in KG*M^2
JG2 = 1.92*10^-4;
JG3 = 1.6*10^-5;

%Motor and gear weight are collected form beckhoff dokumentation
%M = motor + gear + joint.
MJ2 = 6.6 + 6.7 + 3.8;  %6.6 + 6.7 + 3.8;  %KG
MJ3 = 2.2 + 1.5 + 1.6;  %2.2 + 1.5 + 1.6; %KG
MPL = 2; %KG

%PROFIL3 [30X30]
L3=30;
B3=30;
t3=2;

A3=B3*L3;
a3=(B3-2*t3)*(L3-2*t3);
M3=LT3*A3*rho; %kg
m3=LT3*a3*rho; %kg

%PROFIL2 [40X40]
L2=40;
B2=40;
t2=2.5;

A2=B2*L2;
a2=(B2-2*t2)*(L2-2*t2);
M2=LT2*A2*rho; %kg
m2=LT2*a2*rho; %kg

%PROFIL1 [50X50]
L1=50;
B1=50;
t1=4;

A1=B1*L1;
a1=(B1-2*t1)*(L1-2*t1);
M1=LT1*A1*rho; %kg
m1=LT1*a1*rho; %kg

%Inertia from the links
I31 = (M3*(L3^2 + LT3^2)/12 - m3*((L3-2*t3)^2 + LT3^2)/12);
I21 = (M2*(L2^2 + LT2^2)/12 - m2*((L2-2*t2)^2 + LT2^2)/12);
I11 = (M1*(L1^2 + LT1^2)/12 - m1*((L1-2*t1)^2 + LT1^2)/12); %KG*mm^2

% Inertia from the links, moved to the first joint
IA1 = (I11 + (A1-a1)*LT1*rho*(LT1/2)^2)*10^-6;
IA2 = (I21 + (A2-a2)*LT2*rho*(LT1+LT2/2)^2)*10^-6;
IA3 = (I31 + (A3-a3)*LT3*rho*(LT1+LT2+LT3/2)^2)*10^-6; %KG*M^2


% Inertia fom the links, moved to the second joint
IB2 = (I21 + (A2-a2)*LT2*rho*(LT2/2)^2)*10^-6;
IB3 = (I31 + (A3-a3)*LT3*rho*(LT2+LT3/2)^2)*10^-6; %KG*M^2

% Inertia from the links, moved to the third joint
IC3 = (I31 + (A3-a3)*LT3*rho*(LT3/2)^2)*10^-6; %KG*M^2


%Inertia from motors, gear joint and payload 2kg related to first joint.
IJA2 = MJ2*(LT1*10^-3)^2;
IJA3 = MJ3*((LT1+LT2)*10^-3)^2;
IP1 = MPL*((LT1+LT2+LT3)*10^-3)^2; %KG*M^2

%Inertia from motors, gear joint and payload 2kg related to second joint.
IJB3 = MJ3*((LT2)*10^-3)^2;
IP2 = MPL*((LT2+LT3)*10^-3)^2; %KG*M^2

%Inertia from motors, gear joint and payload 2kg related to third joint.
IP3 = MPL*((LT3)*10^-3)^2; %KG*M^2


%Total inertia = Joints + links + payload.
IL1 = IA1 + IA2 + IA3 + IJA2 + IJA3 + IP1   %KG*M^2
IL2 = IB2 + IB3 + IJB3 + IP2                %KG*M^2
IL3 = IC3 + IP3                             %KG*M^2


% Motor inertia - ratio1
Jlm1= JG1 + IL1/(n1^2);
Ratio1 = Jlm1/JM1 %inertia ratio motor 1

% Motor inertia - ratio2
Jlm2= JG2 + IL2/(n2^2);
Ratio2 = Jlm2/JM2

% Motor inertia - ratio3
Jlm3= JG3 + IL3/(n3^2);
Ratio3 = Jlm3/JM3