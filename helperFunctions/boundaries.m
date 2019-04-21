function [output] = boundaries(minValue,value,maxValue)
%BOUNDARIES Return value between boundaries of the boundary.

output = max(min(value,maxValue),minValue);
end

