function [y] = M35H_cost_fun(x)
%The cost function for the simulation of 35H279
    global Hm Bm PAR n_points  
  PAR = x;
     mu0=4*pi*10^-7;
    [H,M,Bs]=M35H_optimiz(Hm,Bm);
  plot(Hm(end-n_points:end,:),Bm(end-n_points:end,:),'r',Hm(end-n_points:end,:),Bs(end-n_points:end,:),'k');
  
drawnow;
  y = mse(Bs(end-n_points:end,end)-Bm(end-n_points:end,end));
  end