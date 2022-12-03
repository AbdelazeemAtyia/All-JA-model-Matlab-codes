function [y] = M400_65A_cost_fun(x)
    global Hm Bm PAR n_points  
 
    mu0=4*pi*10^-7;
 PAR = x;
     [H,M,Bs]=M400_65A_optimiz(Hm,Bm);
     
   plot(Hm(end-n_points:end,:),Bm(end-n_points:end,:),'r','LineWidth',1.5);
hold on
 plot(Hm(end-n_points:end,:),Bs(end-n_points:end,:),'b','LineWidth',1.5);
 hold off
 legend('Meas','Simu','Location','northwest')
 xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
drawnow;
   y = mse(Bs(end-n_points:end)-Bm(end-n_points:end));
    end