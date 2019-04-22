function [ratio] = rangeOverlap(minPref,maxPref,minRoom,maxRoom)
%RANGEOVERLAP Calculate overlap as persentage of pref range.
%   Detailed explanation goes here

prefRange = maxPref - minPref;

if minRoom <= minPref && maxRoom >= maxPref
    ratio = 1;
elseif minRoom >= minPref && maxRoom >= maxPref
    ratio = (maxPref - minRoom) / prefRange;
elseif minRoom <= minPref && maxRoom <= maxPref
    ratio = (maxRoom - minPref) / prefRange;
elseif  minRoom >= minPref && maxRoom <= maxPref
    ratio = (maxRoom-minRoom) / prefRange;
else
    assert(1 == 0)
end
end

