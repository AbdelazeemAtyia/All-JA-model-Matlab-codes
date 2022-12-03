clc
clear 
close all
% This code is used to determine the damping factor (R) for each minor
% loop using the direct Jiles Atherton model
% the input is the lop number and the output is 
global Hm Bm n_points  Para_OJAM y ELDm ELDs RE BsR35 BmR35 HmR35
 load Bm_35h270;load Hm_35h270;
 load p35gs
Para_OJAM= p35gs; % the parameters of th major loop 
     L=input('the value of L=')
    Hm=Hm_35h270(:,L);Bm=Bm_35h270(:,L);
   
x = [1];
  
 r=x(1);   
    
n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 



 

perc_r = 2;
 
Lbx=[  1];
Ubx=[  4];

 %%%%%%%%%%%%%%%%
PARA=[ r];

options=psoptimset('MaxIter',25,'Display','iter','CompletePoll','On', ...
    'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
[PARA,fval,exit_flag] = fmincon(@cost_funm,PARA,[],[],[],[],Lbx,Ubx,[],options);
 
% the output of this program is th  damping factor and the releative error (RE)at each loop
% for example RE_R_d1 contains the values of releative error (RE), and the 
% damping factor R using DJAM (d )for loop 1 and so on 




