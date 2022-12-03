function [fitresult, gof] =M50(h50, b50)
%CREATEFIT(H50,B50)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : h50
%      Y Output: b50
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 02-Aug-2022 16:54:41


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( h50, b50 );

% Set up fittype and options.
ft = 'pchipinterp';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'b50 vs. h50', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'h50', 'Interpreter', 'none' );
ylabel( 'b50', 'Interpreter', 'none' );
grid on


