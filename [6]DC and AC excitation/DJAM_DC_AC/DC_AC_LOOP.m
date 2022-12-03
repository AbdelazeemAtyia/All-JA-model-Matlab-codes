% this program is used to simulate the AC+DC loop using the parameters of
% the DC loop , these parameters have been determined from (DC_BIAS_major.m)
clc
clear all
close all

global Hm Bm n_points Ms p5hz
 mu0=4*pi*10^-7;
   load dcb5hz; % measured loop of dc and ac 
  load p5hz;% parameter of dc major loop
  
   
   
    Hm=dcb5hz(:,1);Bm=dcb5hz(:,2); %dc bias and ac
   n_points = length(Hm);
 % Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm];
 Mm=Bm/mu0-Hm;
 [H,Bs,M]=dcbias_test3(Hm,Bm);
 
     figure('Name','Simu')
     plot(Hm(end-n_points:end),Bm(end-n_points:end),'r','LineWidth',1.5)
     hold on
     plot(Hm(end-n_points:end),Bs(end-n_points:end),'b.','LineWidth',1.5);
    hold off
    legend('Meas','Simu','Location','northwest')
title('Major hystresis loop of 5Hz ','fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 

 

 
 
 