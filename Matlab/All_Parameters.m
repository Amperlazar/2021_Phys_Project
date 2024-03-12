xdata = xlsread('damping_data', 1, 'E3:E59');
time = xlsread('damping_data', 1, 'J3:J59');

sym1 = xlsread('damping_data', 1, 'X3:X59');
sym2 = xlsread('damping_data', 1, 'AH3:AH59');

time_for_asym = xlsread('damping_data', 1, 'AY4:AY50');
asym1 = xlsread('damping_data', 1, 'AT4:AT50');
asym2 = xlsread('damping_data', 1, 'BD4:BD50');

time_for_super = xlsread('damping_data', 1, 'BT4:BT59');
super1 = xlsread('damping_data', 1, 'BO4:BO59');
super2 = xlsread('damping_data', 1, 'BY4:BY59');
cftool;