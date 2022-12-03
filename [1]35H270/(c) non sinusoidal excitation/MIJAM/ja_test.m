clear all
close all
clc
 
global  nr Bm  Hm
 load p35insf3 % the parameters of the major loop
 
 load B_hr;load H_hr;
 
  Hm =  (H_hr(:,4));
  Bm  =  (B_hr(:,4));
  
phr=p35insf3;
nr=2;
 n_points = length(Hm);
mu0=4*pi*10^-7;
 Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
   [Hs, dbdh] = jabfunc(phr, Bm);
%   sf1=max(Hm)/max(Hs);
%   Hs=sf1.*(Hs);
  figure()
plot(Hm(end-n_points:end),Bm(end-n_points:end),'r','LineWidth',1.5);
hold on
 plot(Hs(end-n_points:end),Bm(end-n_points:end),'b','LineWidth',1.5);
 hold on
  hold off
legend('Meas','Simu','Location','northwest')
title('IJAM' );
 xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 Hs35iRhr=Hs(end-n_points:end);
 Bs35iRhr=Bm(end-n_points:end);
 
 
 
