function [fitresult, gof,xData, yData] = M_fit(h, b);
[xData, yData] = prepareCurveData( h, b );
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999999999318255;
[fitresult, gof] = fit( xData, yData, ft, opts );

% figure( 'Name', 'untitled fit 1' );
% h_1 = plot( fitresult, xData, yData );
% legend( h_1, 'b vs. h', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'h', 'Interpreter', 'none' );
% ylabel( 'b', 'Interpreter', 'none' );
% grid on


