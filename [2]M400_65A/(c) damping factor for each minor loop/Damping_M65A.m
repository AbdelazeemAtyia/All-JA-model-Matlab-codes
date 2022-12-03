clc
clear 
close all

global Hm Bm n_points    parafm_M65A  
 
    load Hm_65f;load Bm_65A; 
   Bt=max(Bm_65A(:,1:7));
 load pl77;% param of 65A
       parafm_M65A=pl77;
   L=input('L=')
  Hm=Hm_65f(:,L);Bm=Bm_65A(:,L);    
x = [1];
  
 r=x(1);   
    
n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
 
 perc_r =0.5;
% 
    Lbx=[1];
 Ubx=[5];

 %%%%%%%%%%%%%%%%
  PARA=[r];
options=psoptimset('MaxIter',50,'Display','iter','CompletePoll','On', ...
    'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
[PARA,fval,exit_flag] = fmincon(@cost_funm,PARA,[],[],[],[],Lbx,Ubx,[],options);
rr=PARA(end);
 



