clc
clear 
close all
% this code is using to determine the percenage of Mirr 
global Hm Bm n_points  parafm_M65A
mu0=4*pi*10^-7;
       load Hm_35h270;load Bm_35h270;
       load p35gs
 Hm= Hm_35h270(:,1:7);Bm=Bm_35h270(:,1:7);
  n=length(Hm);Hmm=Hm;Bmm=Bm;
  Mm=max(Bm/mu0)-Hm;Mm=max(Mm);
   
   parafm_M65A=p35gs; % these parameters have been determined from the global serach ,35H_OPT
n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
   Ms=parafm_M65A(1);
k=parafm_M65A(2);
c=parafm_M65A(3);
alpha=parafm_M65A(4);
a=parafm_M65A(5); 
R=1; % for the maijor loop
 [H,Bs,M,Mrev,Mirr]=TEST_35H2(Hm,Bm);
H=Hm(end-n_points:end,:);
B=Bs(end-n_points:end,:);
M=M(end-n_points:end,:);
Mirr=Mirr(end-n_points:end,:);
Mrev=Mrev(end-n_points:end,:);
figure()
hold on 
plot(Mrev(:,end),'b','LineWidth',1.5)
plot(Mirr(:,end),'k','LineWidth',1.5)
plot(M(:,end),'r','LineWidth',1.5)
legend('Mrev','Mirr','M','Location','northwest')
ylabel('M[A/m]'),xlabel('samples')
set(gca,'FontSize',15,'fontweight','bold')
box on 

% per1=(Mrev(:,end)./M(:,end))*100
% per2=(Mirr(:,end)./M(:,end))*100

% percent_Mrev=(max(Mrev(:,end))./max(M(:,end)))*100
% percent_Mirr=(max(Mirr(:,end))./max(M(:,end)))*100


 
