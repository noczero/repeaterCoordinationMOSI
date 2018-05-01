function [ retCentroids ] = checkDistanceBetweenCentroids( finalCentroids , limitDistance )
%checkDistanceBetweenCentroids is function to calculate distance
%between centroids and add the new Centroids if distance > 5
%   input
% final centroids is list of centroids from k-Means
% limitDistance is the maximal distance

[rows cols ] = size(finalCentroids);
newCentroids = [];
% make distance matrix 
D = pdist(finalCentroids); % calculate eucildiean
distMatrix = squareform(D); % make distance matrix

%iterate on max rows
for i = 1:rows
    % find with the minumum in distance matrix
    onRows = distMatrix(i,:);
    [minVal , minIdx] = min(onRows(onRows>0));
    % + 1 Idx is + 1 cause zero element is not proceesed
    minIdx = minIdx + 1;
    disp(minVal);
    if(minVal > limitDistance)
        newX = (finalCentroids(i,1) + finalCentroids(minIdx,1)) / 2;
        newY = (finalCentroids(i,1) + finalCentroids(minIdx,2)) / 2;
        newCentroids = [ newCentroids; newX newY ];
    end

end

retCentroids = newCentroids;
end
