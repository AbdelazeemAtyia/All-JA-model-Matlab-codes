function res=Loss_inv(Hm,Bm,Hs,Bs);
H_measu_50d=Hm;B_measu_50d=Bm;
H_simul_50d=Hs;B_simul_50d=Bs;
  Bm1=B_measu_50d(:,end);
    Hm1=H_measu_50d(:,end);
    Hs1=H_simul_50d(:,end);
    Bsx1=B_simul_50d(:,end);
    Bmo=Bm1(Bm1>0);
     Bso=Bsx1(Bsx1>0);
     Hmo=Hm1(Bm1>0);
   Hso=Hs1(Bsx1>0);

    dens=7650; % density in kg/m^3
f=1; % frequency in Hz
Ps=(1000*f/dens).*polyarea(H_simul_50d,B_simul_50d); 
Pm=(1000*f/dens).*polyarea(H_measu_50d,B_measu_50d);
error=(abs(Ps-Pm)./Pm)*100

figure()
 plot(H_measu_50d(:,end),B_measu_50d(:,end) ,'r','LineWidth',1.5);
hold on
 plot( H_simul_50d(:,end),B_simul_50d(:,end) ,'k','LineWidth',1.5);
 hold off
 legend('Meas','Simu','Location','northwest')
title(['JA Res at B = ', num2str(max(B_measu_50d(:,end))),'T'],'fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 


figure();
plot(max(B_measu_50d),Ps,'b--sq','LineWidth',3)
hold on
plot(max(B_measu_50d),Pm,'r--sq','LineWidth',3)
  xlabel('B\_max [T]','fontweight','bold','fontsize',15),...
 ylabel('Power [mj/kg]','fontweight','bold','fontsize',15)
set(gca,'FontSize',15,'fontweight','bold')
title('Power loss','fontweight','bold','fontsize',15);
legend('Meas','Simu')
hold off

figure()
plot(Hmo(1:end),Bmo(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso(1:end),Bso(1:end),'k','LineWidth',1.5)
legend('Meas','Simu','Location','northwest')
title(['JA Res at B = ', num2str(max(B_measu_50d(:,end))),'T'],'fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
% xlim([-100 max(Hmo)])
  ylim([0.08 1.5])

   figure()
l=1:6;
str=cellstr(num2str(error.','%%%5.2f'));
plot(max(B_measu_50d),Pm,'r--sq',max(B_measu_50d),Ps,'k--sq','LineWidth',1.5)
legend('Measu','Simu')
xlabel('Hyst. loops'),ylabel('losses')
 text(max(B_measu_50d),Ps,str);
 set(gca,'FontSize',15,'fontweight','bold')
 res=1;
 end