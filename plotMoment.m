function []=plotMoment(x1,mx_snittc,mx_snittb,mx_snitta, mx_snitt, von_m)
    %     PLOTTING AV MOMENT PÅ PROFILER

%     %   PLOTTING FIGURE 1(PROFILE 3)
% 
%     figure(1);
%     plot(x1,mx_snittc,'k-','linewidth',2);
%     hold on;
% %     plot(x2,Mx_snitt2c,'k-','linewidth',2);
% %     plot([x1(end),x2(1)],[Mx_snitt1c(end),Mx_snitt2c(1)],'k-', 'linewidth',2); %Line between LS and RS
%     grid on;
%     box on;
%     ylabel('Bending moment M(x), [Nm]');
%     xlabel('Length, [m]');
%     title('Aluminum Profile 3');
% 
%     %   PLOTTING FIGURE 2 (PROFILE 2)
% 
%     figure(2);
%     plot(x1,mx_snittb,'k-','linewidth',2);
%     hold on;
% %     plot(x2,Mx_snitt2b,'k-','linewidth',2);
% %     plot([x1(end),x2(1)],[Mx_snitt1b(end),Mx_snitt2b(1)],'k-', 'linewidth',2); %Line between LS and RS
%     grid on;
%     box on;
%     ylabel('Bending moment M(x), [Nm]');
%     xlabel('Length, [m]');
%     title('Aluminum Profile 2');
% 
%     %   PLOTTING PROFILE 1
%     figure(3);
%     plot(x1,mx_snitta,'k-','linewidth',2);
%     hold on;
% %     plot(x2,Mx_snitt2a,'k-','linewidth',2);
% %     plot([x1(end),x2(1)],[Mx_snitt1a(end),Mx_snitt2a(1)],'k-', 'linewidth',2); %Line between LS and RS
%     grid on;
%     box on;
%     ylabel('Bending moment M(x), [Nm]');
%     xlabel('Length, [m]');
%     title('Aluminum Profile 1');
%     
%     
%   PLOTTING PROFILE 1
%     xtot=(0:0.01:4.5);
% %     figure(7);
%     plot(xtot,mx_snitt,'k-','linewidth',2);
%     hold on;
%     grid on;
%     box on;
%     ylabel('Bending moment M(x), [Nm]');
%     xlabel('Length, [m]');
%     title('Robot arm');
%     
%     sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
%     filnavn = 'Moment_1.pdf';
%     % saveas(gcf,[sti,filnavn], 'psc2')   % gcf står vist nok for "get current figure"
%     saveas(gcf,[sti,filnavn],'pdf')   % gcf står vist nok for "get current figure"

    xtot=(0:0.01:4.5);
    figure(8);
    plot(xtot,von_m,'k-','linewidth',2);
    hold on;
    grid on;
    box on;
    ylabel('von Mises [MPa]');
    xlabel('Length, [m]');
    title('Robot arm');
    
    sti = 'D:\Skrivebord\Utdanning\Bachelor\LateX\Matlab\';
    filnavn = 'Von_mises.pdf';
    saveas(gcf,[sti,filnavn],'pdf')   % gcf står vist nok for "get current figure"

end