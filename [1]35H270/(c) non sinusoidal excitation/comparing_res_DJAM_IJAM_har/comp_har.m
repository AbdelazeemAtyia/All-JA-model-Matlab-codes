% the results of the IJAM, DJAM, MDJAM, and MIJAM have been used to comapre
clc
clear
close all
 
load Bs_hr_dir 
load Hs_hr_dir  
load H_hr;load B_hr;
load Hso;load Bso;
load Bs35ihr;load Hs35ihr; % the simu results for 35 h using IJAM or harmonic measu
% this is the last data
load Hs35iRhr;load Bs35iRhr;% the simu results for 35 h using modified (Liete)
%IJAM or harmonic measu  this is the last data
 
Hm=H_hr(:,4);Bm=B_hr(:,4);


  figure()
 subplot(2,2,1)
 hold on
 
 plot( Hm   ,Bm ,'k:','LineWidth',2)
 plot( Hso   ,Bso ,'k','LineWidth',1.5)
 legend('Meas','DJAM')
  xlabel('H[A/m]'),ylabel('B[T]')
  title(' (a) DJAM')
set(gca,'FontSize',15,'fontweight','bold')
xlim([-100 350]) 
ylim([0.4 1.4])
box on
subplot(2,2,2)
 
  plot( Hm   ,Bm ,'k:','LineWidth',2)
    hold on 
 plot( Hs35ihr  ,Bs35ihr ,'k ','LineWidth',1.5)
    legend('Meas','IJAM')
  xlabel('H[A/m]'),ylabel('B[T]')
  title(' (b) IJAM')
set(gca,'FontSize',15,'fontweight','bold') 
xlim([-100 350]) 
ylim([0.4 1.4])
subplot(2,2,3)
 
plot( Hm   ,Bm ,'k:','LineWidth',2)
    hold on 
         plot( Hs_hr_dir  , Bs_hr_dir  ,'K','LineWidth',1.5)
 legend('Meas','MDJAM')
  xlabel('H[A/m]'),ylabel('B[T]')
  title(' (c) Modified DJAM')
set(gca,'FontSize',15,'fontweight','bold')
xlim([-100 350]) 
ylim([0.4 1.4])
subplot(2,2,4)
 
plot( Hm   ,Bm ,'k:','LineWidth',2)
    hold on 
%         plot(Hsinv2,Bsinv2 ,'K','LineWidth',1.5)
plot(Hs35iRhr,Bs35iRhr ,'K','LineWidth',1.5)

legend('Meas','MIJAM')
  xlabel('H[A/m]'),ylabel('B[T]')
  title(' (d) Modified IJAM')
set(gca,'FontSize',15,'fontweight','bold')
xlim([-100 350]) 
ylim([0.4 1.4])
box on

 