function [y] = cost_fun (x)
      muo=4*pi*10^-7;
    
        global Hm Bm  r n_points   RE  
       r = x;
   loops=7; % number of the loops for the measured data
    
  Hxpk=max(Hm(:,end)); % Peak values for scaling: x-component
     nloops=length(loops);
       [H,M,B]=loop_ALL(Hm,Bm);
 
     w1=0.50; w2=0.45; w3=1-w1-w2; % weight coefficients
      e1= mse(H(end-n_points:end)-Hm(end-n_points:end));
    Hspk=max(H);
    As=polyarea(H(end-n_points:end,:),Bm(end-n_points:end,:));
 Am=polyarea(Hm(end-n_points:end,:),Bm(end-n_points:end,:));
    e2=(1/nloops).*sum((Hspk-Hxpk).^2./(Hxpk).^2);
    e3=(1/nloops).*sum((As-Am).^2./(Am).^2);
       y=w1*e1+w2*e2+w3*e3;    
    
 ELDm=polyarea(Hm(end-n_points:end),Bm(end-n_points:end));
  ELDs=polyarea(H(end-n_points:end),Bm(end-n_points:end));
  RE=(ELDs-ELDm)/(ELDm)*100;% the releative error
plot(Hm(end-n_points:end,end),Bm(end-n_points:end,end),'r',...
        H(end-n_points:end,end),Bm(end-n_points:end,end),'k');
    drawnow;
   
end