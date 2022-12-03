function createfigure(X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7, Y7, X8, Y8)
%CREATEFIGURE(X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7, Y7, X8, Y8)
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  Y2:  vector of y data
%  X3:  vector of x data
%  Y3:  vector of y data
%  X4:  vector of x data
%  Y4:  vector of y data
%  X5:  vector of x data
%  Y5:  vector of y data
%  X6:  vector of x data
%  Y6:  vector of y data
%  X7:  vector of x data
%  Y7:  vector of y data
%  X8:  vector of x data
%  Y8:  vector of y data

%  Auto-generated by MATLAB on 30-May-2022 16:13:45

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'Parent',axes1,'DisplayName','Meas','LineWidth',1.5,...
    'Color',[1 0 0]);

% Create plot
plot(X2,Y2,'Parent',axes1,'DisplayName','Simu','LineWidth',1.5,...
    'Color',[1 0 0]);

% Create plot
plot(X3,Y3,'Parent',axes1,'LineWidth',1.5,'Color',[1 0 0]);

% Create plot
plot(X4,Y4,'Parent',axes1,'LineWidth',1.5,'Color',[1 0 0]);

% Create plot
plot(X5,Y5,'Parent',axes1,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

% Create plot
plot(X6,Y6,'Parent',axes1,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

% Create plot
plot(X7,Y7,'Parent',axes1,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

% Create plot
plot(X8,Y8,'Parent',axes1,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

% Create xlabel
xlabel('H[A/m]','FontWeight','bold');

% Create title
title('JA Res at B = 1.3959T','FontWeight','bold');

% Create ylabel
ylabel('B[T]','FontWeight','bold');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',15,'FontWeight','bold');
% Create axes
axes2 = axes('Parent',figure1,...
    'Position',[0.734641006661731 0.170321637426901 0.163582531458179 0.226608187134503]);
hold(axes2,'on');

% Create plot
plot(X1,Y1,'Parent',axes2,'DisplayName','Meas','LineWidth',1.5,...
    'Color',[1 0 0]);

% Create plot
plot(X5,Y5,'Parent',axes2,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

box(axes2,'on');
grid(axes2,'on');
