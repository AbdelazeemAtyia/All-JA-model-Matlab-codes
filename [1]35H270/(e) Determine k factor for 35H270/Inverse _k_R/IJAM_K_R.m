clc
clear 
close all

global Hm Bm n_points    PAR   RE

 
 mu0=4*pi*10^-7;
 load Hm_35h270;load Bm_35h270;
        
        load p35insf33
         
        PAR=p35insf33;
  L=input('no. of the loop=')
       Hm= Hm_35h270(:,	L);Bm=Bm_35h270(:,L);  
 
      x = [11 ,1];
       k=x(1);  
   r=x(2);
 
 
    Lbx=[11, 1]; % note that the value if k for loop 2
    % should be greater than loop 1 , as the Hc increases K increases
    % so for loop 2 the lower value should be greater than the k value 
    % for loop 1 ,and so on for other loops
    Ubx=[p35insf33(2),];
   PARA=[k,r];   
n_points = length(Hm);

  
nr=4;% the number of repeated loops of Hm,and Bm
   Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
 
  

  options=psoptimset('MaxIter',50,'Display','iter','CompletePoll','On', ...
      'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
 %  
 [PARA,fval,exit_flag] = fmincon(@cost_fun_minor,PARA,[],[],[],[],Lbx,Ubx,[],options);
 
 RE_K_I=[RE,PARA];
 %save REKI5_24_11 RE_K_I -ascii

