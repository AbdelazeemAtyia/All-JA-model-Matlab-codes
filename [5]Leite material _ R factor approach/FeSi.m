clc
clear 
close all

global Hm Bm n_points    p_nh2  
   load Fe_Si_main;% the extracted data from paper [1] for the main loop
  load Fe_Si_har; % the extracted data from paper [1] with harmonics
   load RR; % the damping factor determined from [1]
%[1] Accurate minor loops calculation with a modified Jiles?Atherton hysteresis model
     Hm=Fe_Si_har(:,1);Bm=Fe_Si_har(:,2);

n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
p_nh2=[1.58e6,5.73e1,2.70e-1,2e-4,1.05e2,1];% the major loop parameters [1]
  Ms=p_nh2(1);
k=p_nh2(2);
c=p_nh2(3);
alpha=p_nh2(4);
a=p_nh2(5); 
R=1; % for the maijor loop
[H,M,Bs,Rb]=All_fn3(Hm,Bm,Ms,k,c,alpha,a,R);
  figure(1)
plot(Hm(end-n_points:end),Bm(end-n_points:end),'r','LineWidth',1.5);
hold on
 plot(Hm(end-n_points:end),Bs(end-n_points:end),'b','LineWidth',1.5);
 hold on
  hold off
legend('Meas','Simu','Location','northwest')
title(['JA Res at B = ', num2str(max(Bm)),'T'],'fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 
 
























