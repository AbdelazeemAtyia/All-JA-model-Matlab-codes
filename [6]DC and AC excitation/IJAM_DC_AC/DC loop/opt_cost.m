function [y] = opt_cost(x)
     global Hm Bm PAR n_points  B_aci H_aci y
  PAR = x;
     mu0=4*pi*10^-7;
    [H,M,B]=loop(Hm,Bm);
   plot(Hm(end-n_points:end),Bm(end-n_points:end),'r',H(end-n_points:end),Bm(end-n_points:end),'b','Linewidth',1.5);
   legend('Meas','Simu','Location','northwest')
 xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold')
drawnow;
H_aci=H(end-n_points:end);B_aci=Bm(end-n_points:end);
Hmaci=Hm(end-n_points:end);
  y = mse(H(end-n_points:end)-Hm(end-n_points:end));
  save Haci H_aci -ascii
  save Baci B_aci -ascii
  save Hmaci Hmaci -ascii
  
end