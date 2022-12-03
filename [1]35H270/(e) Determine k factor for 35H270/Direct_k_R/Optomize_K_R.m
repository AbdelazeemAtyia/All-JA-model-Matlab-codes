clc
clear 
close all

global Hm Bm n_points  Para_OJAM    RE  
 load Hm_35h270;load Bm_35h270; % the measured loops of 35H270
 load p35gs % the parameters of the major loop, it were determined from file (a)
  L=input('the value of L=')
  Hm=Hm_35h270(:,L);Bm=Bm_35h270(:,L);   
mu0=4*pi*10^-7;
 Para_OJAM= p35gs; % the parameter of the major loop
 n_points = length(Hm);
% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
 c=Para_OJAM(3);
       
  x = [11,1]; % initial values
  k=x(1);  r=x(2);  
 
Lbx=[11,1];
Ubx=[ p35gs(2),4];
 %%%%%%%%%%%%%%%%
PARA=[ k,r];

  options=psoptimset('MaxIter',50,'Display','iter','CompletePoll','On', ...
      'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
  [PARA,fval,exit_flag] = fmincon(@cost_funm,PARA,[],[],[],[],Lbx,Ubx,[],options);
 PR=[RE,PARA];
  

  
 %RE is the releative error for each minor loop

