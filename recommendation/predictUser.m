function [userScores] = predictUser(e,userScores,testScores,noNeighbours,sortedDistances,users,givenValues)
%PREDICTUSER Summary of this function goes here
%   Detailed explanation goes here
[noE,noR] = size(testScores);

for r=1:noR
    % Check if value needs to be predicted
    if userScores(r) == -1
        % Get all users that rated room r
        ratedR = givenValues(:,r);
        
        simSum = 0;
        ratingSum = 0;
        neighbourCounter = 0;
        turnCounter = 2; %first one is same user as e
        
        while (neighbourCounter < noNeighbours && turnCounter < noE)
            neighbour = users(turnCounter,e);
            if ratedR(neighbour)
                neighbourRating = testScores(neighbour,r);
                assert(neighbourRating ~= -1);
                
                sim = sortedDistances(turnCounter,e);
                simSum = simSum + abs(sim);
                
                ratingSum = ratingSum + sim * neighbourRating;
                 
                neighbourCounter = neighbourCounter + 1;
            end
            turnCounter = turnCounter +1;
        end
        % Save predictions
        userScores(r) = boundaries(1,round(ratingSum/ simSum),5);
    end
end
end

