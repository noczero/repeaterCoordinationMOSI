function [ accuracy ] = accuracyCovered( X )
% accuracyCovered is calculating miss of unreacable user
%   X is data filter
[allRow , ~ ] = size(X);

% find the 9999 label
missCondition = X(:,3) == 9999;
[rowMiss , ~ ] = size(X(missCondition,:));

accuracy = ((allRow-rowMiss) / allRow) * 100; % divide the number of miss with the total data


disp('Unreacable user : ')
disp(rowMiss)
disp('Accuracy : ')
disp(accuracy)
end

