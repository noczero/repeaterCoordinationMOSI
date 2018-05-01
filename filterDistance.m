function [ result ] = filterDistance( X , centroids, limitDist)
%filterDistance is function to filter centroids in distance
% X is result in label
% centroids is the result of k-Means centroids
% limitDist is the limit distance of centroids and its member

[row col] = size(X);

newResult = zeros(row,col);

% iterate for all data
for idx = 1:row
    class = X(idx,3);
    % calculate distance between centroids and its member
    sub = X(idx,1:2) - centroids(class,:);
    euclidean = sqrt(sum(sub.^2));
    
    % check distance compare to limitDist
    if (euclidean <= limitDist)
        % true case
        newResult(idx,1) = X(idx,1); % for x
        newResult(idx,2) = X(idx,2); % for y
        newResult(idx,3) = class; % for true label assign it to its class
    else
        % false case
        newResult(idx,1) = X(idx,1); % for x
        newResult(idx,2) = X(idx,2); % for y
        newResult(idx,3) = 9999; % for false label
    end
    
end

result = newResult;

end

