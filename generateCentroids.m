function [ centroids ] = generateCentroids( X, k )
%GENERATECENTROIDS is function to generate some of centroids in the
%beginning of k_means
% choose random data from X
% X is data set
% k is number of centoids

[row cols] = size(X);
startCentroids = zeros(k,cols);

startCentroids = X(randperm(row,k),:);

centroids = startCentroids;

end

