function [predictedScores] = scorePredictor(testScores,noNeighbours)
%SCOREPREDICTOR Collaborative filtering
%   Detailed explanation goes here

[noE,noR] = size(testScores);
givenValues = testScores ~= -1;
nullValues = testScores == -1;

% Get average scores for each user
averageScore = averageScores(testScores);

% Create user - similarity matrix
similarityM = similarityMatrix(testScores,averageScore);

% Sort this matrix
[sortedDistances,users] = sort(similarityM,'descend');

predictedScores = zeros(noE,noR);

% Predict scores
for e = 1:noE
    userScores = testScores(e,:);
    
    predictedScores(e,:) = predictUser(e,userScores,testScores,noNeighbours,sortedDistances,users,givenValues);
end
end

