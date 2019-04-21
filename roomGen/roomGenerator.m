clc;
clear;
close all;

%%% Settings
noRooms = 20;
noValues = 6;

% Size
minSize = 12;
maxSize = 100;
meanSize = 30;
varSize = 20;

% Temp range 
lowerTempMin = 10;
lowerTempMax = 21;
lowerMeanTemp = 18;
lowerVarianceTemp = 2;
higherTempMin = 21;
higherTempMax = 30;
higherMeanTemp = 24;
higherVarianceTemp = 3;

% Windows
minWindow = 10;
maxWindow = 100;
meanWindow = 20;
varianceWindow = 50;

% Electronics
minElec = 0;
maxElec = 5;

% Luxery
minLux = 0;
maxLux = 6;

%%% Generation
rooms = zeros(noRooms,noValues + 1);
% Generate room by room
% Position, Size, Temp Range (min,max), Windows, Electronics, Luxery
for i = 1:noRooms
    % Position
    rooms(i,1) = 1;
    
    % Size
    rawSize =  meanSize + varSize * randn;
    sizeB = boundaries(minSize,rawSize,maxSize);
    rooms(i,2) = sizeB;
    
    % Temp Range
    rawLowerTemp =  lowerMeanTemp + lowerVarianceTemp * randn;
    lowerTemp = boundaries(lowerTempMin,rawLowerTemp,lowerTempMax);
    rooms(i,3) = lowerTemp;
    rawHigherTemp = higherMeanTemp + higherVarianceTemp * randn;
    higherTemp = boundaries(higherTempMin,rawHigherTemp,higherTempMax);
    rooms(i,4) = higherTemp;
    
    % Windows
    rawWindow = meanWindow + varianceWindow * randn;
    windows = boundaries(minWindow,rawWindow,maxWindow);
    rooms(i,5) = windows;
    
    % Electronics
    elec = floor(minElec + (maxElec - minElec).*rand);
    rooms(i,6) = elec;
    
    % Luxery
    lux = floor(minLux + (maxLux - minLux).*rand);
    rooms(i,7) = lux;
end

% Save rooms on Disk
fileName = 'RoomRecommendation\data\rooms';
save(fileName,'rooms');




