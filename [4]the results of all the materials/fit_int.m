function [x_out,y_out]=fit_int(x_inp,y_inp);
x_out=linspace(x_inp(1),x_inp(end),1000);
y_out= interp1(x_inp,y_inp,x_out,'linear','extrap');


end