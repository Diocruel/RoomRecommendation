%%% Boundaries test file

%% in boundary
value = 1;
minValue = 0;
maxValue = 2;
[output] = boundaries(minValue,value,maxValue);
assert(output == value);

%% below boundary
value = -1;
minValue = 0;
maxValue = 2;
[output] = boundaries(minValue,value,maxValue);
assert(output == minValue);

%% above boundary
value = 3;
minValue = 0;
maxValue = 2;
[output] = boundaries(minValue,value,maxValue);
assert(output == maxValue);

%% on min boundary
value = 0;
minValue = 0;
maxValue = 2;
[output] = boundaries(minValue,value,maxValue);
assert(output == 0);

%% on max boundary
value = 2;
minValue = 0;
maxValue = 2;
[output] = boundaries(minValue,value,maxValue);
assert(output == 2);