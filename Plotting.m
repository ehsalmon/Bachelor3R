% figure(2)
% subplot(1,1,1)
% plot(out.t1,'-')
% ylim([0 1320])
% xlim([0 10])
% xlabel('Time')
% ylabel('Torque')
% legend('T2')
% 
% sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
% filnavn = 'Torque1_2.pdf';
% saveas(figure(2),[sti,filnavn],'pdf')   



%%  PLOTTING TORQUES
% 
figure(1)
subplot(1,1,1)
plot(out.t1,'-')
grid on
ylim([0 1800])
xlim([0 10])
xlabel('Time[s]')
ylabel('Torque[Nm]')
legend('T1')

sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Torque1_1.pdf';
saveas(figure(1),[sti,filnavn],'pdf')  

figure(2)
subplot(1,1,1)
plot(out.t2,'-')
grid on
ylim([50 400])
xlim([0 10])
xlabel('Time[s]')
ylabel('Torque[Nm]')
legend('T2')

sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Torque2_1.pdf';
saveas(figure(2),[sti,filnavn],'pdf')   

figure(3)
subplot(1,1,1)
plot(out.t3,'-')
grid on
ylim([10 45])
xlim([0 10])
xlabel('Time[s]')
ylabel('Torque[Nm]')
legend('T3')

sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Torque3_1.pdf';
saveas(figure(3),[sti,filnavn],'pdf')   


figure(4)
subplot(1,1,1)
plot(out.T,'-')
grid on
ylim([0 1500])
xlim([0 10])
xlabel('Time[s]')
ylabel('Torque[Nm]')
legend('T1','T2','T3')

sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Torque_1.pdf';
saveas(figure(1),[sti,filnavn],'pdf')  
% 


%% PLOTTING RPM'S WITH GEAR RATIO 61-50-35

figure(5)
plot(out.rpm1,'-')
grid on
ylim([-800 500])
xlabel('Time[s]')
ylabel('Angular velocity [RPM]')
legend('The inner motor')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'rpm1_1.pdf';
saveas(figure(5),[sti,filnavn],'pdf')  


figure(6)
plot(out.rpm2,'-')
grid on
ylim([-550 400])
xlabel('Time[s]')
ylabel('Angular velocity [RPM]')
legend('The second motor')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'rpm2_1.pdf';
saveas(figure(6),[sti,filnavn],'pdf')  


figure(7)
plot(out.rpm3,'-')
grid on
ylim([-600 650])
xlabel('Time[s]')
ylabel('Angular velocity [RPM]')
legend('The outer motor')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'rpm3_1.pdf';
saveas(figure(7),[sti,filnavn],'pdf')  

figure(8)
subplot(2,2,1);
grid on
plot(out.rpm1)
subplot(2,2,2);
plot(out.rpm2)
subplot(2,2,3);
plot(out.rpm3)
ylim([-800 700])
xlabel('Time')
ylabel('Angular velocity [RPM]')
legend('RPM motor1','RPM motor 2','RPM motor 3')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'RPM_sub_1.pdf';
saveas(figure(8),[sti,filnavn],'pdf')  

%%
% 
% figure(10)
% plot(out.Poserror, 'Linewidth',2)
% grid on
% xlabel('Time [s]')
% ylabel('Error [m]')
% legend('Position error X-direction','Position error Y-direction')
% sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
% filnavn = 'Pos_error.pdf';
% saveas(figure(10),[sti,filnavn],'pdf')  
% 
% %%
% % 
% figure(11)
% plot(out.endspeed, 'k-',  'Linewidth',2)
% grid on
% ylim([-10 10])
% xlabel('Time [s]')
% ylabel('Velocity [m/s]')
% legend('Endeffector velocity')
% sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
% filnavn = 'endspeed.pdf';
% saveas(figure(11),[sti,filnavn],'pdf')  
% 
%% PLOTTING CIRCLE POSITION  - END EFFECTOR POSITION

for i=1:1600
    
K(i)=out.circle(i,1);
D(i)=out.circle(i,2);

end

for i=1:1600
    
X(i)=out.endpos(i,1);
Y(i)=out.endpos(i,2);

end

figure1=figure('Position', [100, 100, 600, 800]);
subplot(3,1,1)
plot(K,D, 'k-','LineWidth',2)
xlabel('X-position[m]')
ylabel('Y-position[m]')
ylim([-6 6])
xlim([-6 6])
grid on
legend('Circle position')
subplot(3,1,2)
plot(X,Y, 'k-','LineWidth',2)
grid on
ylim([-6 6])
xlim([-6 6])
xlabel('X-position[m]')
ylabel('Y-position[m]')
legend('End effector position')
subplot(3,1,3)
plot(out.Poserror, 'Linewidth',2)
grid on
xlabel('Time [s]')
ylabel('Error [m]')
legend('Position error X-direction','Position error Y-direction')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Position_ce_1.pdf';
saveas(figure1,[sti,filnavn],'pdf') 


 %% PLOTTING END EFFECTOR POSITION
% 
% for i=1:1900
%     
% X(i)=out.endpos(i,1);
% Y(i)=out.endpos(i,2);
% 
% end
% 
% figure(13)
% plot(X,Y, 'k-','LineWidth',2)
% grid on
% ylim([-6 6])
% xlim([-6 6])
% xlabel('X-position')
% ylabel('Y-position')
% legend('End effector position')
% sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
% filnavn = 'End_effector_pos.pdf';
% saveas(figure(13),[sti,filnavn],'pdf') 
% %%
% 
figure2=figure('Position', [100, 100, 600, 800]);
subplot(3,1,2)
plot(out.endspeed, 'k-',  'Linewidth',2)
grid on
ylim([0 4])
xlabel('Time [s]')
ylabel('Velocity [m/s]')
legend('Endeffector velocity')
subplot(3,1,1)
plot(out.circlespeed, 'k-', 'Linewidth',2)
grid on
ylim([0 4])
xlabel('Time[s]')
ylabel('Velocity [m/s]')
legend('Circle trajectory velocity')
subplot(3,1,3)
plot(out.speederror,'k-',  'Linewidth',2)
grid on
ylim([-2 2])
xlabel('Time [s]')
ylabel('Error [m/s]')
legend('Velocity error')
sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
filnavn = 'Vel_ce_1.pdf';
saveas(figure2,[sti,filnavn],'pdf')  
% 
% figure(13)
% subplot(3,1,1)
% plot(out.circlespeed, 'k-', 'Linewidth',2)
% grid on
% ylim([0 4])
% xlabel('Time[s]')
% ylabel('Velocity [m/s]')
% legend('Circle trajectory')
% sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
% filnavn = 'circlespeed.pdf';
% saveas(figure(13),[sti,filnavn],'pdf')  
% 
% 
% 
% figure(14)
% plot(out.speederror,'k-',  'Linewidth',2)
% grid on
% ylim([-2 2])
% xlabel('Time [s]')
% ylabel('Error [m/s]')
% legend('Velocity error')
% sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
% filnavn = 'Speederror.pdf';
% saveas(figure(14),[sti,filnavn],'pdf')  