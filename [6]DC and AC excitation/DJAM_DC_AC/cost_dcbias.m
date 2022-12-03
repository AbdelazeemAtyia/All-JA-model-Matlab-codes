function [y] = cost_dcbias(x)
    global Hm Bm PAR n_points
    
    mu0=4*pi*10^-7;
       
    PAR = x;
   [H,Bs,M]=dcbias(Hm,Bm);
     plot(Hm(end-n_points:end),Bm(end-n_points:end),'r',Hm(end-n_points:end),Bs(end-n_points:end),'b.');


    legend('Meas','Simu','Location','northwest')
title('Major hystresis loop of 5Hz ','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
drawnow;

    y = mse(Bs(end-n_points:end)-Bm(end-n_points:end));
end