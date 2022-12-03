function [h, dhdb] = jabfunc(phr, b)
global RR nr Hm
% J-A model for given b waveform
 load Bm_35h270;
 Bmax=max(Bm_35h270);Bt=Bmax(1:7);
 Rd=[3.24,1.86,1.40,1.19,1.09,1.04,1];% the dissipative factor determined from IJAM
  mu0 = 4*pi*1e-7;
 
  % Parameter scaling
  ms=phr(1);k=phr(2);c=phr(3);alfa=phr(4);a=phr(5);
 
  hp = 0;
  bp = 0;
  jj=0;nl=length(b)/nr;j=1;
  Bm=b;
  for n = 2 : length(b)
      db = b(n)-bp;    
      mp = bp/mu0 - hp;
      hep = hp + alfa*mp;
      [manp, dmandhe] = Manfunc(hep, a, ms);
      mirp = (mp-c*manp)/(1-c);
            if i==(nl+1)+jj
         jj=jj+nl;
            end
 
%  R=1;
 if i>=2+jj & i<=20+jj           
RR=1;
     elseif i>=21+jj & i<=50+jj         
 RR=interp1(Bt,Rd,abs(Bm(i,j)),'linear');
      elseif i>=78+jj & i<=102+jj    
 RR=interp1(Bt,Rd,abs(Bm(i,j)),'linear');
    elseif i>=145+jj & i<=175+jj      
 RR=interp1(Bt,Rd,abs(Bm(i,j)),'linear');
   elseif i>=203+jj & i<=227+jj    
 RR=interp1(Bt,Rd,abs(Bm(i,j)),'linear');
  else
  RR=1;
 end

      if sign(db*(manp-RR *mirp)) > 0
          dmirdhe = abs(manp-RR *mirp)/k;
      else
          dmirdhe = 0;
      end
      dmdh = (c*dmandhe+(1-c)*dmirdhe)/(1-alfa*c*dmandhe-alfa*(1-c)*dmirdhe);
      dhdb(n) = 1/(mu0*(1+dmdh));
      h(n) = hp+db*dhdb(n);
      
      hp = h(n);
      bp = b(n);
  end
%   h=(max(Hm)/max(h)).*(h);
end
