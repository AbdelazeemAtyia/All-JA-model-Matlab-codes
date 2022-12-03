function [y] = cost_fun (x);
  
    muo=4*pi*10^-7;
    
    %% OPTIMUM PARAMETERS %%
       global Hm Bm PAR n_points  
       PAR = x;
    %% EXTRACT LOOPS FROM EXPERIMENTAL DATA %%
    loops=[1,2,3,4,5,6,7];

 
    
 
    Bxpk=max(Bm(:,end)); Hxpk=max(Hm(:,end)); % Peak values for scaling: x-component
     nloops=length(loops);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [Hsx,m_simulx]=DJAM_new(Hm,Bm);
    
    %% SELECT LAST LOOP %% 
 
    Hsx=Hsx(end-n_points:end,:); 
    m_simulx=m_simulx(end-n_points:end,:);
    %% CLOSE LOOP %%
    m_simulx(end,:)=m_simulx(1,:);
    %% NORMALIZE NUMERICAL MAGNETIZATION %%
     SF=(Bxpk-muo.*Hxpk)/max(m_simulx(:,end)); % Scaling Factor: x-component
     
  Msx=SF.*m_simulx; % Magnetization in Tesla
    %% COMPUTE MAGNETIC INDUCTION %%
    Bsx=muo.*Hsx+Msx; % Compute magnetic induction
 
    %% COMPUTE COST FUNCTION %%
    w1=0.50; w2=0.45; w3=1-w1-w2; % weight coefficients
      e1= mse(Bsx(end-n_points:end)-Bm(end-n_points:end));
    Bspk=max(Bsx);
    As=polyarea(Hm(end-n_points:end,:),Bm(end-n_points:end,:));
 Am=polyarea(Hm(end-n_points:end,:),Bsx(end-n_points:end,:));
    e2=(1/nloops).*sum((Bspk-Bxpk).^2./(Bxpk).^2);
    e3=(1/nloops).*sum((As-Am).^2./(Am).^2);
     y=w1*e1+w2*e2+w3*e3;   
    plot(Hm(end-n_points:end,1:end),Bm(end-n_points:end,1:end),'r',Hm(end-n_points:end,1:end),Bsx(end-n_points:end,1:end),'k');
    drawnow;
  end