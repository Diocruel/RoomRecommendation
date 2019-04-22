function [sim] = pearsonSimilarity(e1Scores,e2Scores,e1Average,e2Average)
%PEARSONSIMILARITY Calculate pearson similarity
%   Detailed explanation goes here
noScores = length(e1Scores);
assert(length(e1Scores) == length(e2Scores));

combinedSum = 0;
xSum = 0;
ySum = 0;

for i = 1:noScores
    combinedSum = combinedSum + (e1Scores(i) - e1Average) * (e2Scores(i) - e2Average);
    xSum = xSum + (e1Scores(i) - e1Average)^2;
    ySum = ySum + (e2Scores(i) - e2Average)^2;
end

sim = combinedSum / (sqrt(xSum)*sqrt(ySum));
end

