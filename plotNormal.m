function []=plotNormal(SIG1,SIG2,SIG3,SIG)
   %%  PLOTTE NORMALSPENNINGER

    xplot=(0:0.01:4.5);
    
        figure(11);
    plot(xplot,SIG,'k-','linewidth',2);
    box on;
    ylabel('NORMALSPENNING');
    xlabel('Length, [m]');
    title('Aluminum Profile 1');
    
%     
%     figure(4);
%     plot(xplot,SIG1,'k-','linewidth',2);
%     box on;
%     ylabel('NORMALSPENNING');
%     xlabel('Length, [m]');
%     title('Aluminum Profile 1');
% 
%     figure(5);
%     plot(xplot,SIG2,'k-','linewidth',2);
%     grid on;
%     box on;
%     ylabel('NORMALSPENNING');
%     xlabel('Length, [m]');
%     title('Aluminum Profile 2');
% 
%     figure(6);
%     plot(xplot,SIG3,'k-','linewidth',2);
%     grid on;
%     box on;
%     ylabel('NORMALSPENNING');
%     xlabel('Length, [m]');
%     title('Aluminum Profile 3');
% 

end