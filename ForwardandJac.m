clc; close; clear;


syms th1 th2 th3 'real'; % Angles
L=[1.5 ; 1.5 ; 1.5]; % Lengths

%           DH - Table
% ---------------------------------
% RotZ | TransZ | Transx |  RotX  
% ---------------------------------
% q1    | 0     | L1      | 0           T1=RotZ*TransX
% ---------------------------------
% q2    | 0     | L2      | 0           T2=RotZ*TransX
% ---------------------------------
% q3    | 0     | L3      | 0           T3=RotZ*TransX
% ---------------------------------

%Forward kinematics
T1=RotZ(q1)*TransX(L(1));
T2=RotZ(q2)*TransX(L(2));
T3=RotZ(q3)*TransX(L(3));
T=T1*T2*T3;

%Making p and q matrix
xpos=T(1,4);
ypos=T(2,4);
p=simplify([xpos ; ypos]);
q=[q1 ; q2 ; q3];


%Jacobian and velocity
J = simplify(jacobian(p,q));

matlabFunction(p, 'File', 'forward', 'Vars', {q});
matlabFunction(J, 'File', 'Jacobian', 'Vars', {q});
