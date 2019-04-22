function [similarityM] = similarityMatrix(testScores,averageScores)
%SIMILARITYMATRIX Create similarity matrix.
%   Detailed explanation goes here
noE = size(testScores);
givenValues = testScores ~= -1;

similarityM = zeros(noE,noE);
for e1 = 1:noE
    for e2 = 1:noE
        if e1 == e2
            similarityM(e1,e2) = 1;
        else
            e1Indices = givenValues(e1,:);
            e2Indices = givenValues(e2,:);
            
            bothRated = (e1Indices + e2Indices) == 2;
            if ~isempty(bothRated)
                e1Scores = testScores(e1,bothRated);
                e2Scores = testScores(e2,bothRated);
                e1Average = averageScores(e1);
                e2Average = averageScores(e2);
                similarityM(e1,e2) = pearsonSimilarity(e1Scores,e2Scores,e1Average,e2Average);
            else
                similarityM(e1,e2) = 0;
            end
        end
    end
end

end

