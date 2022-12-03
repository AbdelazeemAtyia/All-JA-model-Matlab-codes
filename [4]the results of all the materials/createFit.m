function [fitresult,gof] = createFit(Bmm50i, Pm1i)
%CREATEFIT(BMM50I,PM1I)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : Bmm50i
%      Y Output: Pm1i
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 18-Aug-2022 17:42:14


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( Bmm50i, Pm1i );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999999999977262;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'Pm1i vs. Bmm50i', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'Bmm50i', 'Interpreter', 'none' );
% ylabel( 'Pm1i', 'Interpreter', 'none' );
% grid on

