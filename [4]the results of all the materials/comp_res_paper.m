clc
clear 
close all

%% M400_50A data 
 
load par400 % this is the used parameters for M40050A from the M400_50_new
load B_measu_50d  
load H_measu_50d  
load B_simul_50d  
load H_simul_50d  
 
load p50n
load B_measu_50i  
load H_measu_50i  
load B_simul_50i  
load H_simul_50i  

    %% M400_56h data
      load pL77 % this is the used parameters for M40050A from the M400_65A_OPT
load B_measu_65d  
load H_measu_65d  
load B_simul_65d  
load H_simul_65d

load p65i
load B_measu_65i  
load H_measu_65i  
load B_simul_65i  
load H_simul_65i
    %% M400_35h data
     load p35gs% parameters using gs
load  B_measu_35d  
load H_measu_35d  
load  B_simul_35d  
load  H_simul_35d  
 
load p35gsi
load  B_measu_35i  
load H_measu_35i  
load  B_simul_35i  
load  H_simul_35i 
  
%%
       [Pm1,Ps1,Hmo1,Bmo1,Hso1,Bso1,error1]=all_material(H_measu_50d,B_measu_50d,H_simul_50d,B_simul_50d);
    [Pm2,Ps2,Hmo2,Bmo2,Hso2,Bso2,error2]=all_material(H_measu_65d,B_measu_65d,H_simul_65d,B_simul_65d);
 
  [Pm3,Ps3,Hmo3,Bmo3,Hso3,Bso3,error3]=all_material(H_measu_35d,B_measu_35d,H_simul_35d,B_simul_35d);
  
  %%
   [Pm1i,Ps1i,Hmo1i,Bmo1i,Hso1i,Bso1i,error1i]=all_material(H_measu_50i,B_measu_50i,H_simul_50i,B_simul_50i);
    [Pm2i,Ps2i,Hmo2i,Bmo2i,Hso2i,Bso2i,error2i]=all_material(H_measu_65i,B_measu_65i,H_simul_65i,B_simul_65i);
 
    [Pm3i,Ps3i,Hmo3i,Bmo3i,Hso3i,Bso3i,error3i]=all_material(H_measu_35i,B_measu_35i,H_simul_35i,B_simul_35i);
   
    
    %%
     %% comparison
   [x50m,y50m]=fit_int(max(B_measu_50i),Pm1i);
 [x50d,y50d]=fit_int((max(B_simul_50d)),Ps1);
 [x50i,y50i]=fit_int((max(B_simul_50i)),Ps1i);
 MSE50d=mse(Ps1-Pm1i);MSE50i=mse(Ps1i-Pm1i);
 Er_50dd=abs((Ps1-Pm1i)./(Pm1i));Er_50ii=abs((Ps1i-Pm1i)./(Pm1i));
 
[x65m,y65m]=fit_int(max(B_measu_65i),Pm2i);
 [x65d,y65d]=fit_int((max(B_simul_65d)),Ps2);
 [x65i,y65i]=fit_int((max(B_simul_65i)),Ps2i);
 
 Er_65dd=abs((Ps2-Pm2i)./(Pm2i));Er_65ii=abs((Ps2i-Pm2i)./(Pm2i));
  MSE65d=mse(Ps2-Pm2i);MSE65i=mse(Ps2i-Pm2i);
 [x35m,y35m]=fit_int(max(B_measu_35i),Pm3i);
 [x35d,y35d]=fit_int((max(abs(B_simul_35d))),Ps3);
 [x35i,y35i]=fit_int((max(B_simul_35i)),Ps3i);
 
 Er_35dd=abs((Ps3-Pm3i)./(Pm3i));Er_35ii=abs((Ps3i-Pm3i)./(Pm3i));
  MSE35d=mse(Ps3-Pm3i);MSE35i=mse(Ps3i-Pm3i);
 Mseyd=[1.5899,MSE50d,MSE65d];
Mseyi=[ 1.6517,MSE50i,MSE65i];
 x_axes1=["35H270","M400\_50A","M400\_65A"];
 C = categorical(x_axes1);
 figure()
 plot(C,Mseyd, 'ko-','LineWidth',2)
 hold on 
 plot(C,Mseyi, 'ko--','LineWidth',2)
 %  title( '(a) M400\_50A','fontweight','bold','fontsize',15);
 legend('DJAM','IJAM')
xlabel('Materials'),ylabel('MSE')
  set(gca,'FontSize',15,'fontweight','bold')
  box on

 return
val=max(B_simul_35d);
xi=linspace(val(1),val(end),1000);
xii=max(B_measu_35d);
[~,idx] = ismembertol(xii,xi,0.001);
   yi = interp1(val,Ps3,xi,'linear');
     yy=yi(idx);
    Er_35dy=abs((yy-Pm3i)./(Pm3i));
  figure()
  subplot(1,3,1)
  hold on
   plot(x50m,y50m,'K','LineWidth',2);
  plot(x50d,y50d,'k--','LineWidth',2);
   plot(x50i,y50i,'K:','LineWidth',2);
   Er_50d=(y50d-y50m)./(y50m);Er_50i=(y50i-y50m)./(y50m);
   title( '(a) M400\_50A','fontweight','bold','fontsize',15);
 legend('Measu','DJAM','IJAM')
xlabel('B[T]'),ylabel('P [mW/kg]')
  set(gca,'FontSize',15,'fontweight','bold')
  box on
     subplot(1,3,2)
     hold on
   plot(x65m,y65m,'K','LineWidth',2);
  plot(x65d,y65d,'k--','LineWidth',2);
   plot(x65i,y65i,'K:','LineWidth',2);
   Er_65d=(y65d-y65m)./(y65m);Er_65i=(y65i-y65m)./(y65m);
   title( '(b) M400\_65A','fontweight','bold','fontsize',15);
 xlabel('B[T]'),ylabel('P[mW/kg]')
   set(gca,'FontSize',15,'fontweight','bold')
   box on
    subplot(1,3,3)
  hold on
   plot(x35m,y35m,'K','LineWidth',2);
   plot(xi(idx),yi(idx),'k--','LineWidth',2)
   plot(x35i,y35i,'K:','LineWidth',2);
   Er_35d=(y35d-y35m)./(y35m);Er_35i=(y35i-y35m)./(y35m);
  
   xlim([0.19,1.4])
       title( '(c) 35H270','fontweight','bold','fontsize',15);
 xlabel('B[T]'),ylabel('P[mW/kg]')
   set(gca,'FontSize',15,'fontweight','bold')
   box on
  %%
  figure()
  subplot(1,2,1)
  hold on 
  plot(max(B_simul_50d),Er_50dd,'k--','LineWidth',2)
  plot(max(B_simul_65d),Er_65dd,'r--','LineWidth',2)
 plot(xi(idx),Er_35dy,'b--','LineWidth',2)
  title( '(a) DJAM','fontweight','bold','fontsize',15);
 legend('M400\_50A','M400\_65A','M35H270')
xlabel('B[T]'),ylabel('Err')
  set(gca,'FontSize',15,'fontweight','bold')
  box on 
   subplot(1,2,2)
  hold on 
  plot(max(B_simul_50i),Er_50ii,'k--','LineWidth',2)
  plot(max(B_simul_65i),Er_65ii,'r--','LineWidth',2)
  plot(max(B_simul_35i),Er_35ii,'b--','LineWidth',2)
  title( '(b) IJAM','fontweight','bold','fontsize',15);
 legend('M400\_50A','M400\_65A','M35H270')
xlabel('B[T]'),ylabel('Err')
  set(gca,'FontSize',15,'fontweight','bold')
  box on 
  
  figure()
   subplot(1,3,1)
   hold on
 plot(max(B_measu_50i),Pm1i,'K-o','LineWidth',2)
 plot((max(B_simul_50d)),Ps1,'k--sq','LineWidth',2)
 plot( (max(B_simul_50i)),Ps1i,'K:*','LineWidth',2)
title( '(a) M400\_50A','fontweight','bold','fontsize',15);
 legend('Measu','DJAM','IJAM')
xlabel('B[T]'),ylabel('P [mW/kg]')
  set(gca,'FontSize',15,'fontweight','bold')
  box on
   subplot(1,3,2)
   hold on 
 plot(max(B_measu_65i),Pm2i,'K-o','LineWidth',2)
 plot((max(B_simul_65d)),Ps2,'k--sq','LineWidth',2)
 plot((max(B_simul_65i)),Ps2i,'K:*','LineWidth',2)
title( '(b) M400\_65A','fontweight','bold','fontsize',15);
 xlabel('B[T]'),ylabel('P[mW/kg]')
   set(gca,'FontSize',15,'fontweight','bold')
   box on
  subplot(1,3,3)
  hold on 
plot(max(B_measu_35i),Pm3i,'K-o','LineWidth',2)
plot(xi(idx),yi(idx),'k--sq','LineWidth',2)
plot((max(B_simul_35i)),Ps3i,'K:*','LineWidth',2)
    title( '(c) M35H270','fontweight','bold','fontsize',15);
 xlabel('B[T]'),ylabel('P[mW/kg]')
   set(gca,'FontSize',15,'fontweight','bold')
   box on
   %return
 
  figure()
h65=max(H_measu_65d);b65=max(B_measu_65d);
h50=max(H_measu_50d);b50=max(B_measu_50d);
h35=max(H_measu_35d);b35=max(B_measu_35d);
xq65=linspace(min(h65),max(h65),1000);vq65 = interp1(h65, b65,xq65,'pchipinterp');
xq50=linspace(min(h50),max(h50),1000);vq50 = interp1(h50, b50,xq50,'pchipinterp');
xq35=linspace(min(h35),max(h35),1000);vq35 = interp1(h35, b35,xq35,'pchipinterp');
    hold on
    plot(xq65,vq65 ,'k','LineWidth',2)
     plot(xq50,vq50,'k--','LineWidth',2)
      plot(xq35,vq35,'k:','LineWidth',2)
   legend('M400\_65A','M400\_50A','M400\_35A','Location','northwest')
  xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
box on
      hold off
 

figure()
subplot(1,3,1)
hold on 
plot(Hmo1(1:end),Bmo1(1:end),'k','LineWidth',2)
plot(Hso1(1:end),Bso1(1:end),'k--','LineWidth',2)
plot(Hso1i(1:end),Bso1i(1:end),'k:','LineWidth',2)
legend('Meas','DJAM','IJAM','Location','northwest')
 title( '(a) M400\_50A','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo1)+30])
 ylim([0.06 1.5])
 box on
subplot(1,3,2)
hold on 
plot(Hmo2(1:end),Bmo2(1:end),'k','LineWidth',2)
plot(Hso2(1:end),Bso2(1:end),'k--','LineWidth',2)
plot(Hso2i(1:end),Bso2i(1:end),'k:','LineWidth',2)
  title( '(b) M400\_65A','fontweight','bold','fontsize',15);

xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo2)+30])
 ylim([0.06 1.5])
 box on
subplot(1,3,3)
hold on 
plot(Hmo3(1:end),Bmo3(1:end),'k','LineWidth',2)
plot(Hso3(1:end),Bso3(1:end),'k--','LineWidth',2)
plot(Hso3i(1:end),Bso3i(1:end),'k:','LineWidth',2)

 title( '(c) 35H270','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo3)+30])
 ylim([0.075 1.5])
 box on
 

figure()
subplot(1,3,1)
plot(Hmo1(1:end),Bmo1(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso1(1:end),Bso1(1:end),'k--','LineWidth',1.5)
legend('Meas','Simu','Location','northwest')
 title( '(a) M400\_50A','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo1)+30])
 ylim([0.06 1.5])
subplot(1,3,2)
plot(Hmo2(1:end),Bmo2(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso2(1:end),Bso2(1:end),'k--','LineWidth',1.5)
  title( '(b) M400\_65A','fontweight','bold','fontsize',15);

xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo2)+30])
 ylim([0.06 1.5])
subplot(1,3,3)
plot(Hmo3(1:end),Bmo3(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso3(1:end),Bso3(1:end),'k--','LineWidth',1.5)
  title( '(c) M35H270','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo3)+30])
 ylim([0.075 1.5])
  
  
   figure()
   subplot(1,3,1)
 plot(max(B_measu_50d),Pm1,'r--sq',(max(B_simul_50d)),Ps1,'k-*','LineWidth',1.5)
 legend('Measu','Simu')
xlabel('B\_max [T]'),ylabel('Power [mW/kg]')
 
 set(gca,'FontSize',15,'fontweight','bold')
 
   subplot(1,3,2)
str2=cellstr(num2str(error2.',' %2.0f%%'));
plot(max(B_measu_65d),Pm2,'r--sq',abs(max(B_simul_65d)),Ps2,'k-*','LineWidth',1.5)
title( '(b) M400\_65A','fontweight','bold','fontsize',15);
 xlabel('B\_max [T]'),ylabel('Power [mW/kg]')
   text( 0.5,25,'19.78%'); % the mean error
 set(gca,'FontSize',15,'fontweight','bold')
  
  subplot(1,3,3)
  val=max(B_simul_35d);
   xi=linspace(val(1),val(end),1000);
     xii=max(B_measu_35d);
[~,idx] = ismembertol(xii,xi,0.001);
   yi = interp1(val,Ps3,xi,'linear');
 str3=cellstr(num2str(error3.',' %2.0f%%'));
 plot(max(B_measu_35d),Pm3,'r--sq',xi(idx),yi(idx),'k-*','LineWidth',1.5)
  title( '(c) M35H270','fontweight','bold','fontsize',15);

 xlabel('B\_max [T]'),ylabel('Power [mW/kg]')
    text( 0.5,19,'13.93%'); % the mean error
 set(gca,'FontSize',15,'fontweight','bold')
 
 %%
 
 figure()
subplot(1,3,1)
plot(Hmo1i(1:end),Bmo1i(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso1i(1:end),Bso1i(1:end),'b--','LineWidth',1.5)
legend('Meas','Simu','Location','northwest')
%title(['JA Res at B = ', num2str(max(B_measu_50d(:,end))),'T'],'fontweight','bold','fontsize',15);
title( '(a) M400\_50A','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo1)+30])
 ylim([0.06 1.5])
subplot(1,3,2)
plot(Hmo2i(1:end),Bmo2i(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso2i(1:end),Bso2i(1:end),'b--','LineWidth',1.5)
 title( '(b) M400\_65A','fontweight','bold','fontsize',15);

xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo2i)+30])
 ylim([0.06 1.5])
subplot(1,3,3)
plot(Hmo3i(1:end),Bmo3i(1:end),'r','LineWidth',1.5)
hold on 
plot(Hso3i(1:end),Bso3i(1:end),'b--','LineWidth',1.5)
 title( '(c) M35H270','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 xlim([-100 max(Hmo3i)+30])
 ylim([0.075 1.5])

 %% the power loss
 
  figure()
   subplot(1,3,1)
 str1=cellstr(num2str(error1i.',' %2.0f%%'));
plot(max(B_measu_50i),Pm1i,'r--sq',(max(B_simul_50i)),Ps1i,'b-*','LineWidth',1.5)
title( '(a) M400\_50A','fontweight','bold','fontsize',15);
legend('Measu','Simu')
xlabel('B\_max [T]'),ylabel('Power [mW/kg]')
  
 set(gca,'FontSize',15,'fontweight','bold')
 box on
   subplot(1,3,2)
str2=cellstr(num2str(error2i.',' %2.0f%%'));
plot(max(B_measu_65i),Pm2i,'r--sq',(max(B_simul_65i)),Ps2i,'b-*','LineWidth',1.5)
title( '(b) M400\_65A','fontweight','bold','fontsize',15);
 xlabel('B\_max [T]'),ylabel('Power [mW/kg]')
   set(gca,'FontSize',15,'fontweight','bold')
  box on
  subplot(1,3,3)
  vali=max(B_simul_35i);
   xii=linspace(vali(1),vali(end),1000);
     xiii=max(B_measu_35i);
[~,idxii] = ismembertol(xiii,xii,0.001);
   yii = interp1(vali,Ps3i,xii,'linear');
 str3=cellstr(num2str(error3i.',' %2.0f%%'));
 plot(max(B_measu_35i),Pm3i,'r--sq',(max(B_simul_35i)),Ps3i,'b-sq','LineWidth',1.5)
 
title( '(c) M35H270','fontweight','bold','fontsize',15);

 
xlabel('B\_max [T]'),ylabel('Power [mW/kg]')
  
 set(gca,'FontSize',15,'fontweight','bold')
 box on

%%
figure()
hold on

 
  h1=plot(H_measu_35d(:,2:5),B_measu_35d(:,2:5) ,'r-','LineWidth',1.5);
 h2=plot( H_simul_35d(:,2:5),B_simul_35d(:,2:5) ,'k--','LineWidth',1.5);
 hold off
  
 legend([h1(1),h2(1),],'Meas','Simu'  )
 xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 

%%
figure()
hold on

   h1=plot(H_measu_35i(:,2:5),B_measu_35i(:,2:5) ,'r-','LineWidth',1.5);
 h2=plot( H_simul_35i(:,2:5),B_simul_35i(:,2:5) ,'b--','LineWidth',1.5);
 hold off
  
 legend([h1(1),h2(1),],'Meas','Simu'  )
 xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold')
%%