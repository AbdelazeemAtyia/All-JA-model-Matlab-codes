% this  code is used to find the parameters of the DC major loop using IJAM
clc
clear 
close all

global Hm Bm n_points  y
 
   load dc_5Hz;  % the DC loop measured data 
   load dcb5hz; % the AC=DC measured data
   load par_ini;  %inititial prameter
    
    Hm=dc_5Hz(:,1);Bm=dc_5Hz(:,2);% DC major loop  at 5 Hz
  x=par_ini;
   
 Ms=x(1); 
k=x(2);
c=x(3);
alpha=x(4);
a=x(5); 
   
    
n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
  
perc_Ms = 0.9;
 perc_k = 1.2;
 perc_c = 0.3;
perc_alpha = 1.5;
perc_a = 1.5;

 Lbx=0.99*[Ms-Ms*perc_Ms k-k*perc_k c-c*perc_c 10^-5 a-a*perc_a];
Ubx=[Ms+Ms*perc_Ms k+k*perc_k c+c*perc_c 10^-3 a+a*perc_a];
 
  %%%%%%%%%%%%%%%%
PARA=[Ms, k, c, alpha, a];
tic
  options=psoptimset('MaxIter',200,'Display','iter','CompletePoll','On', ...
     'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
  [PARA,fval,exit_flag] = fmincon(@opt_cost,PARA,[],[],[],[],Lbx,Ubx,[],options);
   toc
 
