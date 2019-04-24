%
clc;
clear;
close all;

% Settings
noNeighboursArray = 1:1:45;
noTests = length(noNeighboursArray);

% Load in scores
scoresTestStruct = load('RoomRecommendation\data\testScores.mat');
testScores = scoresTestStruct.testScores;
scoresStruct = load('RoomRecommendation\data\scores.mat');
trueScores = scoresStruct.scores;

% For all neighbours
error = zeros(noTests,1);
for i=1:noTests
    noNeighbours = noNeighboursArray(i);
    % Predict scores
    predictions = scorePredictor(testScores,noNeighbours);
    
    % Measure error
    error(i) = immse(predictions,trueScores);
end

plot(noNeighboursArray,error)
title('Mean Squared Error versus number of neighbours')
xlabel('Number of neighbours.')
ylabel('MeanSquared error');