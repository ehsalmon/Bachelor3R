function k= Deflection() 

% This solution utilizes the symbolic toolbox of Matlab to carry out the
% integration of the moment equation and to solve the equations with the
% boundary conditions for the integration constants.

g = 9.81;
% m1 = 7.9+14.0+3.8;
m1 = 6.6+6.7+3.8;
% m2 = 3.3 +  1.5 +1.6;
m2 = 2.2+1.5+1.6;
m3 = 2;
q1 = 19.49;
q2 = 9.93;
q3 = 5.93;
P1 = m1*g;
P2 = m2*g;
P3 = m3*g;
% P1 = 274.9;
% P2 = 86.4;
% P3 = 29.4;
% I1 = 2.6153e5;
% I2 = 8.8281e4;
% I3 = 2.29419e4;
I1 = 2.6153e-7;
I2 = 8.8281e-8;
I3 = 2.29419e-8;
L1 = 1.5;
L2 = 1.5;
L3 = 1.5;
E = 70e9;

M1 = -q1*L1^2/2 - P1*L1 -q2*L2*(L1 + L2/2) - P2*(L1 + L2) - q3*L3*(L1 + L2 + L3/2) - P3*(L1 + L2 + L3);
RAy = q1*L1 + q2*L2 + q3*L3 + P1 + P2 + P3;

N = 50;
xx = linspace(0,L1+L2+L3,N)';
M = zeros(N,1);
V = zeros(N,1);
for i=1:N
    X = xx(i,1);
    if (X < L1)
        M(i,1) = M1 -q1*X^2/2 + RAy*X;
        V(i,1) = RAy - q1*X;
    elseif (X >= L1 && X < L1+L2)
        M(i,1) = M1 - q1*L1*(X - L1/2) - q2*(X-L1)^2/2 - P1*(X-L1) + RAy*X;
        V(i,1) = - q1*L1 - q2*(X-L1) - P1 + RAy;
    elseif (X >= L1+L2 && X <= L1+L2+L3)
        M(i,1) = M1 - q1*L1*(X - L1/2) - q2*L2*(X-L1-L2/2) - q3*(X-L1-L2)^2/2 - P1*(X-L1) - P2*(X-L1-L2) + RAy*X;
        V(i,1) = - q1*L1 - q2*L2 - q3*(X-L1-L2) - P1 - P2 + RAy;
    end
end
    





syms x C1 C2 C3 C4 C5 C6

% M(i,1) = M1 -q1*X^2/2 + RAy*X;
% M(i,1) = M1 - q1*L1*(X - L1/2) - q2*(X-L1)^2/2 - P1*(X-L1) + RAy*X;
% M(i,1) = M1 - q1*L1*(X - L1/2) - q2*L2*(X-L1-L2/2) - q3*(X-L1-L2)^2/2 - P1*(X-L1) - P2*(X-L1-L2) + RAy*X;

M1_bend = M1 -q1*x^2/2 + RAy*x; % Expression for the bending moment for segment 1
M2_bend = M1 - q1*L1*(x - L1/2) - q2*(x-L1)^2/2 - P1*(x-L1) + RAy*x; % Expression for the bending moment for segment 1
M3_bend = M1 - q1*L1*(x - L1/2) - q2*L2*(x-L1-L2/2) - q3*(x-L1-L2)^2/2 - P1*(x-L1) - P2*(x-L1-L2) + RAy*x; % Expression for the bending moment for segment 1
M1_bend_1  = int(M1_bend,x) + C1;   % First integration of the expression for the bending moment for segment 1
M1_bend_11 = int(M1_bend_1,x) + C2; % Second integration of the expression for the bending moment for segment 1
M2_bend_1  = int(M2_bend,x) + C3;   % First integration of the expression for the bending moment for segment 1
M2_bend_11 = int(M2_bend_1,x) + C4; % Second integration of the expression for the bending moment for segment 1
M3_bend_1  = int(M3_bend,x) + C5;   % First integration of the expression for the bending moment for segment 1
M3_bend_11 = int(M3_bend_1,x) + C6; % Second integration of the expression for the bending moment for segment 1
vm1 = M1_bend_1/(E*I1);  % Isolating the deflection angle
v1  = M1_bend_11/(E*I1); % Isolating the deflection
vm2 = M2_bend_1/(E*I2);  % Isolating the deflection angle
v2  = M2_bend_11/(E*I2); % Isolating the deflection
vm3 = M3_bend_1/(E*I3);  % Isolating the deflection angle
v3  = M3_bend_11/(E*I3); % Isolating the deflection

% Boundary conditions
F(1) = subs(v1,x,0); % v=0 for x=0
F(2) = subs(vm1,x,0); % v'=0 for x=0
F(3) = subs(vm1,x,L1)==subs(vm2,x,L1); % Continuity condition for the deflection angle at x=L1
F(4) = subs(v1,x,L1)==subs(v2,x,L1); % Continuity condition for the deflection angle at x=L1
F(5) = subs(vm2,x,L1+L2)==subs(vm3,x,L1+L2); % Continuity condition for the deflection angle at x=L1
F(6) = subs(v2,x,L1+L2)==subs(v3,x,L1+L2); % Continuity condition for the deflection angle at x=L1


[k1, k2, k3, k4, k5, k6] = solve([F(1), F(2), F(3), F(4), F(5), F(6)],[C1,C2,C3,C4,C5,C6]); % Solving the equations from the boundary conditions for the integration constants
k1 = double(k1);
k2 = double(k2);
k3 = double(k3);
k4 = double(k4);
k5 = double(k5);
k6 = double(k6);
vm1 = subs(subs(vm1,C1,k1),C2,k2); % Substituting the values for the integrations constants into the expression for the deflection angle
v1  = subs(subs(v1,C1,k1),C2,k2); % Substituting the values for the integrations constants into the expression for the deflection
vm2 = subs(subs(vm2,C3,k3),C4,k4); % Substituting the values for the integrations constants into the expression for the deflection angle
v2  = subs(subs(v2,C3,k3),C4,k4); % Substituting the values for the integrations constants into the expression for the deflection
vm3 = subs(subs(vm3,C5,k5),C6,k6); % Substituting the values for the integrations constants into the expression for the deflection angle
v3  = subs(subs(v3,C5,k5),C6,k6); % Substituting the values for the integrations constants into the expression for the deflection



NN = 10; % Number of data points
xxx = linspace(0,L1+L2+L3,NN)';
% x = linspace(0,L,NN)'; % x-coordinates for data points

% Initialization
theta = zeros(NN,1); % Array for deflection angle
v = zeros(NN,1); % Array for deflection
for i=1:NN
    X = xxx(i,1);
    if (X < L1)
        theta(i,1) = subs(vm1, X); % Deflection angle
        v(i,1)     = subs(v1, X); % Deflection
    elseif (X >= L1 && X < L1+L2)
        theta(i,1) = subs(vm2, X); % Deflection angle
        v(i,1)     = subs(v2, X); % Deflection
    elseif (X >= L1+L2 && X <= L1+L2+L3)
        theta(i,1) = subs(vm3, X); % Deflection angle
        v(i,1)     = subs(v3, X); % Deflection
    end
end


%       PLOTTING

figure (2)

LW = 2; % Line width
subplot(2,1,1)
    plot(xxx,theta,'k-','LineWidth',LW)
grid on
box on
% axis([0 X(N,1) -0.004 0.003])
xlabel('x-coordinate [m]')
ylabel('Deflection angle \theta [rad]')
legend('Angle Deflection[Rad]', 'Location','Southwest')


subplot(2,1,2)
    plot(xxx,v,'k-','LineWidth',LW)
grid on
box on
legend('Deflection[m]','Location','Southwest')
xlabel('x-coordinate [m]')
ylabel('Deflection [m]')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Defection_b1.pdf';
saveas(gcf,[sti,filnavn],'pdf')   

end