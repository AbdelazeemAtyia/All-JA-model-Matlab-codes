function [H,Bs,M]=dcbias_test3(Hm,Bm)
    global p5hz 
    mu0=4*pi*10^-7;
    Ms = p5hz(1); 
    k  = p5hz(2);
    c  = p5hz(3);
    alpha=p5hz(4);
    a = p5hz(5);
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
%      k=k*(1-0.96*(M(i-1)/Mss)^2);
dMdH=(((1-c)*(Man-M(i-1))+c*delta*k*dMandH)/(delta*k-alpha*(1-c)*(Man-M(i-1))));
  M(i)=M(i-1)+dMdH*dH;
  Bs(i)=mu0*(Hm(i)+M(i));
     
    
    end
     Bs=Bs(1:end);H=Hm(1:end);M=M(1:end);
end