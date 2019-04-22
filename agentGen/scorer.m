clc;
close all;
clear;

% Load in data
roomsData = load('RoomRecommendation\data\rooms.mat');
employeesData = load('RoomRecommendation\data\employees.mat');
rooms = roomsData.rooms;
employees = employeesData.employees;

% Settings/variables
minScore = 1;
maxScore = 5;

noRooms = size(rooms,1);
noEmployees = size(employees,1);

%Min max values
minSize = min(rooms(2,:));
maxSize = max(rooms(2,:));
rangeSize = maxSize-minSize;
minWindow = min(rooms(4,:));
maxWindow = max(rooms(4,:));
rangeWindow = maxWindow - minWindow;

%%% Generate personal scores
scores = zeros(noEmployees,noRooms);
for e = 1:noEmployees
    % Position, Size, Temp Range (min,max), Windows, Electronics, Luxery
    for r = 1:noRooms
        scoreParts = zeros(6,1);
        % Position
        scoreParts(1) = (noRooms - rooms(r,1) + 1) / noRooms * maxScore;
        % Size
        sizePref = employees(e,2);
        sizeRoom = rooms(r,2);
        differenceSize = abs(sizePref-sizeRoom);
        scoreParts(2) = differenceSize / rangeSize * maxScore;
        
        % Temp range
        minPref = employees(e,3);
        maxPref = employees(e,4);
        minRoom = rooms(r,3);
        maxRoom = rooms(r,4);
        overlap = rangeOverlap(minPref,maxPref,minRoom,maxRoom);
        scoreParts(3) = overlap * maxScore;
        
        % Windows
        windowPref = employees(e,5);
        windowRoom = rooms(r,5);
        differenceWindow = abs(windowPref-windowRoom);
        scoreParts(4) = differenceWindow / rangeWindow * maxScore;
        
        % Electronics
        scoreParts(5) = maxScore - abs(employees(e,6) - rooms(r,6));
        % Luxery
        scoreParts(6) = maxScore - abs(employees(e,7) - rooms(r,7));
        
        % Score room
        scores(e,r) = boundaries(minScore,round(mean(scoreParts)),maxScore);
    end
end

fileName = 'RoomRecommendation\data\scores';
save(fileName,'scores');
