function [q1,q2,q3,MA,MB,MC,rcy,rby,ray,FL1,FL2,FL3,I1,I2,I3,h1,h2,h3,A1,A2,A3]= Setup()

    g=9.81;     %Tyngdeakselerasjon
    L=1.5;     %Total lengde av profilene
    D=2700; %Kg/M^3 DENSITY

    %DIMENSIONS

    t1=4; %mm
    t2=2.5; %mm
    t3=2; %mm
    b1=50; %mm
    b2=40; %mm
    b3=30; %mm
    h1=50; %mm
    h2=40; %mm
    h3=30; %mm

    %AREA
    A1=h1*b1-(h1-2*t1)*(b1-2*t1); %mm^2
    A2=h2*b2-(h2-2*t2)*(b2-2*t2); %mm^2
    A3=h3*b3-(h3-2*t3)*(b3-2*t3); %mm^2

    %VOLUME
    V1=(A1*10^-6)*L; %M^3
    V2=(A2*10^-6)*L; %M^3
    V3=(A3*10^-6)*L; %M^3

    %MASSES
    M1=V1*D; %kg
    M2=V2*D; %kg
    M3=V3*D; %kg

    %N/M
    q1=M1*g/L;
    q2=M2*g/L;
    q3=M3*g/L;
    
    % AREA INERTIA
    I1=1/12*((b1*h1^3)-(b1-2*t1)*(h1-2*t1)^3); %mm^4
    I2=1/12*((b2*h2^3)-(b2-2*t2)*(h2-2*t2)^3); %mm^4
    I3=1/12*((b3*h3^3)-(b3-2*t3)*(h3-2*t3)^3); %mm^4

    %  ARM 3:
    %Krefter Arm 3

    ML3=2;      %Masse lastvekt

    FL3=g*ML3;
    FM3=q3*L;

    rcy= FM3+FL3;
    MC=q3*((L^2)/2)+FL3*L;

    
    % ARM 2:
    %Krefter arm 2

    ML2= 2.2+1.5+1.6;% Vekt motor, gir og ledd.   3.3 +  1.5 +1.6;

    FM2=q2*L;  
    FL2=rcy+(ML2*g);  

    MB=q2*((L^2)/2)+FL2*L+MC;
    rby=FM2+FL2;


    % Arm 1:

    ML1= 6.6+6.7+3.8;    %Vekt motor, gir og ledd   7.9+14.0+3.8;

    FM1=q1*L;
    FL1=ML1*g+rby;

    MA=MB+(q1*(L^2)/2)+FL1*L;
    ray=FM1+FL1;

end