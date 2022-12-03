clc
clear 
close all
% this code is using to comare between the two modifcations 
% Liete's and Sajid's modofcation using DJAM and IJAM 
load H_35% the simulated using origional JAM determined from IJAM folder (a)
 
% for the minor loop using IJAM
load Hm_35h270;load Bm_35h270; 
  %% the direct minor
 load Bsd % the origional results of DJAM 
 
 %% thee data have been determined from folder b for loop 2 only with Bmax=0.4T
 load sf35_acc;% this is the scaling fctor of 35 inverse using the parameters p35insf33
 load BmR35;load HmR35;load BsR35;load BmR235;load HmR235;load BsR235;
 %res35 direct R factor loop 1,2
load HmiR135;load HsiR135;load BmiR135;load HmiR235;load HsiR235;load BmiR235;
% res35 loop 1,2 inverse R factor
load BmRk1;load BsRk1;load HRk1;load BmRk2;load BsRk2;load HRk2;% res35 direct incase of R and K opto
load BmRK1i35;load HmRK1i35;load HsRK1i35 ;load BmRK2i35;load HmRK2i35;load HsRK2i35 ;% res3 inv incase of R and K opto
 %%

 Br=max(Bm_35h270(:,1:7));
   
Hm= Hm_35h270(:,1:7);Bm=Bm_35h270(:,1:7);
out=[Hm,Bm];
n_points = length(Hm);
nr=4;% the number of repeated loops of Hm,and Bm
  Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
  
    figure()
   subplot(1,2,1)
  hold on 
  plot(Hm(end-n_points:end,2),Bm(end-n_points:end,2),'k','LineWidth',3)
  plot(Hm(end-n_points:end,2),Bsd(end-n_points:end,2),'K--','LineWidth',3)
   plot(HmR235,BsR235,'K:','LineWidth',3)
  plot(HRk2,BsRk2,'K-.','LineWidth',3)
%   title('(a) The measured and computed loop at 0.4 T using DJAM ')
title('(a)')
   legend('Meas','DJAM','Leite MDJAM ','Sajid MDJAM')
  xlabel('H[A/m]'),ylabel('B[T]')
  set(gca,'FontSize',15,'fontweight','bold')
 box on 
  subplot(1,2,2)
  hold on 
  plot(Hm(end-n_points:end,2),Bm(end-n_points:end,2),'k','LineWidth',3)
  plot(H_35(end-n_points:end,2),Bm(end-n_points:end,2),'k--','LineWidth',1.5)
  plot(HsiR235.*sf35_acc,BmiR235,'K:','LineWidth',3)
  plot(HsRK2i35.*sf35_acc,BmRK2i35,'K-.','LineWidth',3)
 legend('Meas','IJAM','Leite MIJAM ','Sajid MIJAM')
  xlabel('H[A/m]'),ylabel('B[T]')
%   title('(b) The measured and computed loop at 0.4 T using IJAM ')
title('(b)')
set(gca,'FontSize',15,'fontweight','bold') 
 box on
 