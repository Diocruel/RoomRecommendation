clc;
clear;

% Load in data
scoresStruct = load('RoomRecommendation\data\scores.mat');
scores = scoresStruct.scores;

% Settings / variables
noise = 0.7;

[noE,noR] = size(scores);
noMissingElements = round(noR*noise);

testScores = scores;
for e = 1:noE
    % Decide what scores to remove
    indices = randperm(noR);
    zeroElements = indices(1:noMissingElements);
    
    testScores(e,zeroElements) = -1; 
end

fileName = 'RoomRecommendation\data\testScores';
save(fileName,'testScores');