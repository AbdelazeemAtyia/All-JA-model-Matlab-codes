function [y] = cost_fun_minor (x);
     
        global Hm Bm Rf n_points     k  RE
          k = x(1); 
      Rf = x(2);
     loops=[1,2,3,4,5,6,7];
      Hxpk=max(Hm(:,end)); % Peak values for scaling: x-component
     nloops=length(loops);
        [H,M,B]=loop_ALL_minor(Hm,Bm);
        w1=0.50; w2=0.45; w3=1-w1-w2; % weight coefficients
        e1= mse(H(end-n_points:end)-Hm(end-n_points:end));
    Hspk=max(H);
    As=polyarea(H(end-n_points:end,:),Bm(end-n_points:end,:));
 Am=polyarea(Hm(end-n_points:end,:),Bm(end-n_points:end,:));
 Hspk=max(H);
     e2=(1/nloops).*sum((Hspk-Hxpk).^2./(Hxpk).^2);
    e3=(1/nloops).*sum((As-Am).^2./(Am).^2);
       y=w1*e1+w2*e2+w3*e3;   % y=e1 
      plot(Hm(end-n_points:end,:),Bm(end-n_points:end,:),'r',H(end-n_points:end,:),Bm(end-n_points:end,:),'k');
    drawnow;
    Bm1=Bm(end-n_points:end,:);Hm1=Hm(end-n_points:end,:);
    Bs1=Bm(end-n_points:end,:);Hs1=H(end-n_points:end,:);
 
    
          
   ELDm=polyarea(Hm1,Bm1);
   ELDs=polyarea(Hs1,Bs1);
    RE=(ELDs-ELDm)/(ELDm)*100; 
 
 
end