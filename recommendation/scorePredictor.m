function [predictedScores] = scorePredictor(testScores,noNeighbours)
%SCOREPREDICTOR Collaborative filtering
%   Detailed explanation goes here

% Get average scores for each user
averageScore = averageScores(testScores);

% Create user - similarity matrix
similarityM = similarityMatrix(testScores,averageScore);

predictedScores = 0;
end

