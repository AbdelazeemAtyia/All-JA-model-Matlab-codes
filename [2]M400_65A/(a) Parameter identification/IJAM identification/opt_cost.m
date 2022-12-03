function [y] = opt_cost(x)
    % Load Experimental Data %
     %%%%%%%%%%%%%%%%%%%%%%%%%%
    muo=4*pi*10^-7;
    
    %% OPTIMUM PARAMETERS %%
       global Hm Bm PAR n_points  RE  
       PAR = x;
    %% EXTRACT LOOPS FROM EXPERIMENTAL DATA %%
    loops=[1,2,3,4,5,6,7];
  Hxpk=max(Hm(:,end)); % Peak values for scaling: x-component
     nloops=length(loops);
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      [H,M,B]=loop(Hm,Bm);
 
    %% COMPUTE COST FUNCTION %%
    w1=0.50; w2=0.45; w3=1-w1-w2; % weight coefficients
      e1= mse(H(end-n_points:end,end)-Hm(end-n_points:end,end));
    Hspk=max(H);
    As=polyarea(H(end-n_points:end,:),Bm(end-n_points:end,:));
 Am=polyarea(Hm(end-n_points:end,:),Bm(end-n_points:end,:));
    e2=(1/nloops).*sum((Hspk-Hxpk).^2./(Hxpk).^2);
    e3=(1/nloops).*sum((As-Am).^2./(Am).^2);
       y=w1*e1+w2*e2+w3*e3;  % y=e1 ; 
    
    plot(Hm(end-n_points:end,end),Bm(end-n_points:end,end),'r',...
        H(end-n_points:end,end),Bm(end-n_points:end,end),'k');
    drawnow;
    Bm1=Bm(end-n_points:end,:);Hm1=Hm(end-n_points:end,:);
    Bs1=B(end-n_points:end,:);Hs1=H(end-n_points:end,:);
   ELDm=Am;
  ELDs=As;
  RE=(ELDs-ELDm)./(ELDm)*100;

    dens=7650; % density in kg/m^3
f=1; % frequency in Hz
Ps=(1000*f/dens).*polyarea(Hs1,Bs1); 
Pm=(1000*f/dens).*polyarea(Hm1,Bm1);
  
end