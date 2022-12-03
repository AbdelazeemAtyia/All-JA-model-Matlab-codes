function [man,dmandhe] = Manfunc(he, a, ms)

  if nargin == 0
    clc
    a = 100;
    ms = 1e6;
    he = linspace(-20*a, 20*a);
  end
 
  % Initialize arrays
  man = 0*he;
  dmandhe = 0*he;
  
  % Large input values
  ind = (abs(he/a) > 0.01);
  man(ind) = ms*(coth(he(ind)/a)-a./he(ind));
  dmandhe(ind) = ms/a*(1-(coth(he(ind)/a)).^2+(a./he(ind)).^2);

  % Low input values
  man(~ind) = ms/3*he(~ind)/a;
  dmandhe(~ind) = ms/3/a + he(~ind);

  if nargin == 0
    figure,
    plot(he, man)
  end
