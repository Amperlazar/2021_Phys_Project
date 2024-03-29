function [fitresult, gof] = createFits(time, xdata, sym1, sym2)
%CREATEFITS(TIME,XDATA,SYM1,SYM2)
%  Create fits.
%
%  Data for 'damping' fit:
%      X Input : time
%      Y Output: xdata
%  Data for 'symmetric mass1' fit:
%      X Input : time
%      Y Output: sym1
%  Data for 'symmetric mass 2' fit:
%      X Input : time
%      Y Output: sym2
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 07-Jun-2021 11:57:36

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 3, 1 );
gof = struct( 'sse', cell( 3, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'damping'.
[xData_damp, yData_damp] = prepareCurveData( time, xdata );

% Set up fittype and options.
ft = fittype( 'c + A*exp(-b*x)*cos(w*x + d)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [20 -Inf 600 -3.14 0];
opts.StartPoint = [80 0.5103 720 0 3.14];
opts.Upper = [100 Inf 800 3.14 6.28];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData_damp, yData_damp, ft, opts );

% Plot fit with data.
figure( 'Name', 'damping' );
h_damping = plot( fitresult{1}, xData_damp, yData_damp );
legend( h_antisym1, 'xdata vs. time', 'damping', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time', 'Interpreter', 'none' );
ylabel( 'xdata', 'Interpreter', 'none' );
grid on

%% Fit: 'symmetric mass1'.
[xData_sym1, yData_sym1] = prepareCurveData( time, sym1 );

% Set up fittype and options.
ft = fittype( 'c+a*cos(w_a*x+d)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [50 440 -3.14 0];
opts.StartPoint = [100 520 0 2];
opts.Upper = [150 600 3.14 3];

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData_sym1, yData_sym1, ft, opts );

% Plot fit with data.
figure( 'Name', 'symmetric mass1' );
h_sym1 = plot( fitresult{2}, xData_sym1, yData_sym1 );
legend( h_sym1, 'sym1 vs. time', 'symmetric mass1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time', 'Interpreter', 'none' );
ylabel( 'sym1', 'Interpreter', 'none' );
grid on

%% Fit: 'symmetric mass 2'.
[xData_sym2, yData_sym2] = prepareCurveData( time, sym2 );

% Set up fittype and options.
ft = fittype( 'c+a*cos(w_a*x+d)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [50 960 -3.14 0];
opts.StartPoint = [100 1000 0 2];
opts.Upper = [130 1040 3.14 3];

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData_sym2, yData_sym2, ft, opts );

% Plot fit with data.
figure( 'Name', 'symmetric mass 2' );
h_sym2 = plot( fitresult{3}, xData_sym2, yData_sym2 );
legend( h_sym2, 'sym2 vs. time', 'symmetric mass 2', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time', 'Interpreter', 'none' );
ylabel( 'sym2', 'Interpreter', 'none' );
grid on


%% Fit: 'anti-symmetric mass 1'.
[xData_anti1, yData_anti1] = prepareCurveData( time_for_asym, asym1 );

% Set up fittype and options.
ft = fittype( 'c+a*cos(w_a*x+d)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [20 540 -3.14 2];
opts.StartPoint = [50 560 0 4.8];
opts.Upper = [80 590 3.14 6];

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData_anti1, yData_anti1, ft, opts );

% Plot fit with data.
figure( 'Name', 'anti-symmetric mass 1' );
h_antisym1 = plot( fitresult{4}, xData_anti1, yData_anti1 );
legend( h_antisym1, 'asym1 vs. time_for_asym', 'anti-symmetric mass 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time_for_asym', 'Interpreter', 'none' );
ylabel( 'asym1', 'Interpreter', 'none' );
grid on

%% Fit: 'anti-symmetric mass 2'.
[xData_anti2, yData_anti2] = prepareCurveData( time_for_asym, asym2 );

% Set up fittype and options.
ft = fittype( 'c+a*cos(w_a*x+d)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [20 1020 -3.14 0];
opts.StartPoint = [50 1070 0 4.8];
opts.Upper = [80 1110 3.14 6];

% Fit model to data.
[fitresult{5}, gof(5)] = fit( xData_anti2, yData_anti2, ft, opts );

% Plot fit with data.
figure( 'Name', 'anti-symmetric mass 2' );
h_antisym2 = plot( fitresult{5}, xData_anti2, yData_anti2 );
legend( h_antisym2, 'asym2 vs. time_for_asym', 'anti-symmetric mass 2', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time_for_asym', 'Interpreter', 'none' );
ylabel( 'asym2', 'Interpreter', 'none' );
grid on


%% Fit: 'super1'.
[xData_super1, yData_super1] = prepareCurveData( time_for_super, super1 );

% Set up fittype and options.
ft = fittype( 'c+a*cos(((w_s+w_a)/2)*x+d)*cos(((w_s-w_a)/2)*x+f)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 500 -Inf -Inf -Inf -Inf];
opts.StartPoint = [100 580 0.489252638400019 0.337719409821377 4.8 2.24];
opts.Upper = [200 640 Inf Inf Inf Inf];

% Fit model to data.
[fitresult{6}, gof(6)] = fit( xData_super1, yData_super1, ft, opts );

% Plot fit with data.
figure( 'Name', 'super1' );
h_super1 = plot( fitresult{6}, xData_super1, yData_super1 );
legend( h_super1, 'super1 vs. time_for_super', 'super1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time_for_super', 'Interpreter', 'none' );
ylabel( 'super1', 'Interpreter', 'none' );
grid on

%% Fit: 'super2'.
[xData_super2, yData_super2] = prepareCurveData( time_for_super, super2 );

% Set up fittype and options.
ft = fittype( 'c+a*sin(((w_s+w_a)/2)*x+d)*sin(((w_s-w_a)/2)*x+f)', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData_super2, yData_super2, 'Indices', 1 );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [20 1020 -3.14 -3.14 2 1];
opts.StartPoint = [100 1100 0 0 4.8 2.2];
opts.Upper = [200 1200 3.14 3.14 6 4];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult{7}, gof(7)] = fit( xData_super2, yData_super2, ft, opts );

% Plot fit with data.
figure( 'Name', 'super2' );
h_super2 = plot( fitresult{7}, xData_super2, yData_super2, excludedPoints );
legend( h_super2, 'super2 vs. time_for_super', 'Excluded super2 vs. time_for_super', 'super2', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time_for_super', 'Interpreter', 'none' );
ylabel( 'super2', 'Interpreter', 'none' );
grid on


