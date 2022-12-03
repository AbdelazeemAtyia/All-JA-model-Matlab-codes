function [y] = cost_funm(x)
    global Hm Bm PAR n_points   RE  y
    
    mu0=4*pi*10^-7;
    PAR = x;
    [H,M,Bs]=DJAM(Hm,Bm);
      
    plot(Hm(end-n_points:end),Bm(end-n_points:end),'r','LineWidth',1.5);
hold on
 plot(Hm(end-n_points:end),Bs(end-n_points:end),'b','LineWidth',1.5);
 hold on
  hold off
legend('Meas','Simu','Location','northwest')
title(['JA Res at B = ', num2str(max(Bm)),'T'],'fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
   
drawnow;
  y = mse(Bs(end-n_points:end)-Bm(end-n_points:end));
  Hmeas=Hm(end-n_points:end);
 Bmeas=Bm(end-n_points:end);
 Bsim=Bs(end-n_points:end);
%  save HRk2  Hmeas  -ascii
%  save BmRk2  Bmeas -ascii
%   save BsRK2 Bsim -ascii
 ELDm=polyarea(Hm(end-n_points:end),Bm(end-n_points:end));
  ELDs=polyarea(Hm(end-n_points:end),Bs(end-n_points:end));
  RE=(ELDs-ELDm)/(ELDm)*100;
end