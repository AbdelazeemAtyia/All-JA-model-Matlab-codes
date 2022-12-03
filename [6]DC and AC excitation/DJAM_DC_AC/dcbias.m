function [H,Bs,M]=dcbias(Hm,Bm)
    global PAR 
    mu0=4*pi*10^-7;
    Ms = PAR(1); 
    k  = PAR(2);
    c  = PAR(3);
    alpha=PAR(4);
    a = PAR(5);
    Mss=Bm/mu0-(Hm);Mss=max(Mss);
    Bs=zeros(size(Hm));
    M=zeros(size(Hm));
    M(1)=(Bs(1)/mu0)-(Hm(1));
     n=length(Hm);
    for i=2:n
        dH=Hm(i)-Hm(i-1);
        if(dH>0)
            delta=1;
        else
            delta=-1;
        end
    He=Hm(i-1)+alpha*M(i-1);
     Man=Ms*(coth((He)/a)-a/(He));
    dMandH=Ms*(1-(coth((He)/a)^2)+(a/(He))^2)/a;
        if (Man-M(i-1))>0&dH<0
      deltaM=0;
  elseif (Man-M(i-1))<0&dH>0
      deltaM=0;
  else
      deltaM=1;  
     end
    F=@(Hm,M,delta)(((1-c)*deltaM*(Man-M)+c*delta*k*dMandH)/(delta*k-alpha*(1-c)*deltaM*(Man-M)));
    F1=dH*(F(Hm(i-1),M(i-1),delta));
    F2=dH*F((Hm(i-1)+dH/2),(M(i-1)+F1/2),delta);
    F3=dH*F((Hm(i-1)+dH/2),(M(i-1)+F2/2),delta);
    F4=dH*F((Hm(i-1)+dH),(M(i-1)+F3),delta);
    M(i)=M(i-1)+(1/6)*(F1+2*F2+2*F3+F4);
    Bs(i)= mu0*(Hm(i)+M(i));
%       k=k*(1-0.96*(M(i)/Ms)^2);
    
    end
     Bs=Bs(1:end);H=Hm(1:end);M=M(1:end);
end