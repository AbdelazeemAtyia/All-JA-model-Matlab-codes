function [y] = cost_fun (x)
      muo=4*pi*10^-7;
    
        global Hm Bm PAR n_points  
       PAR = x;
   loops=7; % number of the loops for the measured data
    
  Hxpk=max(Hm(:,end)); % Peak values for scaling: x-component
     nloops=length(loops);
       [H,M,B]=loop_ALL(Hm,Bm);
 
     w1=0.50; w2=0.45; w3=1-w1-w2; % weight coefficients
      e1= mse(H(end-n_points:end,end)-Hm(end-n_points:end,end));
     Hspk=max(H);
    As=polyarea(H(end-n_points:end,:),Bm(end-n_points:end,:));
 Am=polyarea(Hm(end-n_points:end,:),Bm(end-n_points:end,:));
    e2=(1/nloops).*sum((Hspk-Hxpk).^2./(Hxpk).^2);
    e3=(1/nloops).*sum((As-Am).^2./(Am).^2);
       y=w1*e1+w2*e2+w3*e3;   
    plot(Hm(end-n_points:end,end),Bm(end-n_points:end,end),'r',...
        H(end-n_points:end,end),Bm(end-n_points:end,end),'k');
    drawnow;
    %ELD is the energy loss density
     ELDm=Am;
     ELDs=As;
  RE=(ELDs-ELDm)./(ELDm)*100; % RE is the releative error
          dens=7650; % density in kg/m^3
f=1; % frequency in Hz
Ps=(1000*f/dens).*ELDs; 
Pm=(1000*f/dens).*ELDm;
 
    
end