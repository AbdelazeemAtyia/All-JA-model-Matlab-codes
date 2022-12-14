function [H,M,B,Rb]=All_fn3(Hm,Bm,Ms,k,c,alpha,a,R,RR);
mu0=4*pi*10^-7;
Rb=1;
B=zeros(size(Hm));
jj=0;nl=length(Hm)/6;
M=zeros(size(Hm));
M(1)=(B(1)/mu0)-(Hm(1));
for(j=1:size(Hm,2))
    for i=2:size(Hm,1)
        dH=Hm(i,j)-Hm(i-1,j);dB=Bm(i,j)-Bm(i-1,j);
        if(dH>0)
            delta=1;
        else
            delta=-1;
        end
        He=Hm(i-1,j)+alpha*M(i-1,j);
        Man=Ms*(coth((He)/a)-a/(He));
        dMandHe=Ms*(1-(coth((He)/a)^2)+(a/(He))^2)/a;
        Mirr=(M(i-1,j)-c*Man)/(1-c);%   if i>=2 & i<=50
        if i==(nl+1)+jj
            jj=jj+nl;
        end
        dH=Hm(i)-Hm(i-1);dB=Bm(i)-Bm(i-1);
        if(dH>0)
            delta=1;
        else
            delta=-1;
        end
        
        if i>=2+jj & i<=46+jj
            RR=1;
        elseif i>=47+jj & i<=76+jj
            RR=1.3021*abs(Bm(i))^5 - 2.5*Bm(i)^4 - 1.4063*abs(Bm(i))^3 + 6.125*Bm(i)^2 - 4.8458*abs(Bm(i)) + 2.369;
            RR=1.2;
        elseif i>=133+jj & i<=156+jj
            RR=1.3021*abs(Bm(i))^5 - 2.5*Bm(i)^4 - 1.4063*abs(Bm(i))^3 + 6.125*Bm(i)^2 - 4.8458*abs(Bm(i)) + 2.369;
            RR=1.2;
        else
            RR=1;
        end
        
        deltaM=1;
        dMirrdHe=deltaM*(Man-RR*Mirr)/(k*delta);
         dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-alpha*(1-c)*(dMirrdHe)-(alpha*c*dMandHe));
        M(i,j)=M(i-1,j)+dMdH*dH;
        B(i,j)=mu0*(Hm(i,j)+M(i,j));
    end
end
B=B(1:end,1:j);H=Hm(1:end,1:j);
end
