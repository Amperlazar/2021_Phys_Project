%% damping
figure( 'Name', 'damping' );
h_damping = plot( fitresult{1}, xData_damp, yData_damp );
title('damping');
xlim([0, 7]);
xlabel('time(s)');
ylabel('position(mm)');
legend off;
box on;
hold off;
%% symmetric
figure( 'Name', 'symmetric' );
hold on;
h_sym1 = plot( fitresult{2}, xData_sym1, yData_sym1 );
h_sym2 = plot( fitresult{3}, xData_sym2, yData_sym2 );
title('symmetric mode');
xlim([0, 7]);
ylim([300, 1200]);
xlabel('time(s)');
ylabel('position(mm)');
legend off;
box on;
hold off;
%% antisym 
figure( 'Name', 'anti-symmetric' );
hold on;
h_antisym1 = plot( fitresult{4}, xData_anti1, yData_anti1 );
h_antisym2 = plot( fitresult{5}, xData_anti2, yData_anti2 );
title('antisymmetric mode');
xlim([0, 6]);
ylim([300, 1300]);
xlabel('time(s)');
ylabel('position(mm)');
legend off;
box on;
hold off;

%% super
figure( 'Name', 'super1' );
hold on;
h_super1 = plot( fitresult{6}, xData_super1, yData_super1 );
h_super2 = plot( fitresult{7}, xData_super2, yData_super2, excludedPoints );
title('Normal mode coupling');
xlim([0, 7]);
xlabel('time(s)');
ylabel('position(mm)');
legend off;
box on;
hold off;
