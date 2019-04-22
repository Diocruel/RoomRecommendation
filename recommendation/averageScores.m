function [averageScore] = averageScores(testScores)
%AVERAGESCORES Calculate averageScores of each user

noE = size(testScores,1);
givenValues = testScores ~= -1;

% Calculate average scores
averageScore = zeros(noE,1);
for e = 1:noE
    scores = testScores(e,givenValues(e,:));
    averageScore(e) = mean(scores);
end
end

