 clc; close all;clear all;

[q1,q2,q3,MA,MB,MC,rcy,rby,ray,FL1,FL2,FL3,...
    I1,I2,I3,h1,h2,h3,A1,A2,A3]=Setup();
E=70e3; %Mpa
x1 =(0:0.01:1.5);
% q1=q1;
% q2=q2;
% q3=q3;
mx_snittc=zeros(1,151);
mx_snittb=zeros(1,151);
mx_snitta=zeros(1,151);

%   MAKING ARRAYS FOR MOMENTS IN ARMS
for i=1:length(x1)
    
    mx_snittc(1,i)=rcy*x1(1,i)-MC-q3*((x1(i)^2)/2); %ARM 3
    v_c(1,i)=-q3*x1(i)+rcy;
    
    mx_snittb(1,i)=rby*x1(1,i)-MB-q2*((x1(i)^2)/2); %ARM 2
    v_b(1,i)=rby-q2*x1(i);
    
    mx_snitta(1,i)=ray*x1(1,i)-MA-q1*((x1(i)^2)/2); %ARM 1
    v_a(1,i)=ray-q1*x1(i);
end

v=zeros(1,451);
mx_snitt=zeros(1,451);
for i=1:3*length(x1)
    
    if i<=length(x1)
        mx_snitt(i)=mx_snitta(1,i);
        v(i)=v_a(1,i);
    elseif i<=2*length(x1)
        mx_snitt(i-1)=mx_snittb(1,i-length(x1));
        v(i-1)=v_b(1,i-length(x1));
    else
        mx_snitt(i-2)=mx_snittc(1,i-2*length(x1));
        v(i-2)=v_c(1,i-2*length(x1));
    end
end

%%  UTREGNINGER NORMALSPENNINGER FRA BØYMOMENT


SIG1=zeros(1,151);
SIG2=zeros(1,151);
SIG3=zeros(1,151);

for i=1:length(x1)
    
    SIG1(i)=(-(h1/2)*mx_snitta(1,i))*10^3/I1; %ARM 1
    
    SIG2(i)=(-(h2/2)*mx_snittb(1,i))*10^3/I2; %ARM 2
    
    SIG3(i)=(-(h3/2)*mx_snittc(1,i))*10^3/I3; %ARM 3
end

SIG=zeros(1,451);
v_x=zeros(1,451);
von_m=zeros(1,451);
for i=1:3*length(x1)
    
    if i<=length(x1)
        SIG(i)=SIG1(1,i);
        v_x(i)=v(i)/A1;
    elseif i<=2*length(x1)
        SIG(i-1)=SIG2(1,i-length(x1));
        v_x(i-1)=v(i-1)/A2;
    else
        SIG(i-2)=SIG3(1,i-2*length(x1));
        v_x(i-2)=v(i-2)/A3;
    end
end

for i=1:length(von_m)
    von_m(i)=sqrt(SIG(i)^2 + 3*v_x(i)^2);
end


%%  DYNAMISK BØYSPENNING

fprintf("NORSK STAAL: T6-6082 YIELD STRENGTH-255 MPa \n");
fprintf(" NORSK STAAL: T6-6060 YIELD STRENGTH-170 MPa\n \n");
% OUR WORST-CASE MOMENTUM FROM THE SIMULATION IS AS FOLLOWING:
% JOINT 1: 1316Nm   Joint 2: 316Nm  Joint 3: 39Nm
% DYNAMISK SPENNING

Dynsig1=(1316*(h1/2)*10^3)/I1;
Dynsig2=(316*(h2/2)*10^3)/I2;
Dynsig3=(39*(h3/2)*10^3)/I3;

fprintf('Dynamisk bøyspenning-- profil 1: %.3f MPa \n ',Dynsig1)
fprintf('Dynamisk bøyspenning-- profil 2: %.3f MPa \n ',Dynsig2)
fprintf('Dynamisk bøyspenning-- profil 2: %.3f MPa \n ',Dynsig3)

%% PLOT MOMENT
plotMoment(x1,mx_snittc,mx_snittb,mx_snitta,mx_snitt,von_m) %PLOT MOMENT

% %% PLOT NORMALSPENNING
% plotNormal(SIG1,SIG2,SIG3,SIG); %PLOT NORMALSPENNINGER
% 
% %%  UTBØYNING
% 
% Deflection();
