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
minSize =;
maxSize =;
minWindow = ;
maxWindow = ;

%%% Generate personal scores
scores = zeros(noEmployes,noRooms);
for e = 1:noEmployees
    % Position, Size, Temp Range (min,max), Windows, Electronics, Luxery
    for r = 1:noRooms
        scores = zeros(6,1);
        % position
        scores(1) = (noRooms - rooms(r,1) + 1) / noRooms * maxScore;
        
        % size
        
    end
end
