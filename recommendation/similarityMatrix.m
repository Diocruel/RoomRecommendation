function [similarityM] = similarityMatrix(testScores,averageScores)
%SIMILARITYMATRIX Create similarity matrix.
%   Detailed explanation goes here
noE = size(testScores,1);
givenValues = testScores ~= -1;

similarityM = zeros(noE,noE);
for e1 = 1:noE
    for e2 = 1:noE
        if e1 == e2
            similarityM(e1,e2) = 2;
        else
            e1Indices = givenValues(e1,:);
            e2Indices = givenValues(e2,:);
            
            bothRated = (e1Indices + e2Indices) == 2;
            if sum(bothRated) ~= 0
                e1Scores = testScores(e1,bothRated);
                e2Scores = testScores(e2,bothRated);
                e1Average = averageScores(e1);
                e2Average = averageScores(e2);
                
                pSim = pearsonSimilarity(e1Scores,e2Scores,e1Average,e2Average);
                
                similarityM(e1,e2) = pSim;
            else
                similarityM(e1,e2) = 0;
            end
        end
    end
end

end

