clc;
clear;
%% Main Program
% generate DataSet
dataSet = generatePeople();

%% generate Centroids
k = 20;
startCentroids = generateCentroids(dataSet,k);
% visualize Centroids
scatter(startCentroids(:,1),startCentroids(:,2));

%% do kMeans
[finalCentroids , result ] = kMeans(dataSet,startCentroids);
% visualize
scatter(finalCentroids(:,1),finalCentroids(:,2),[],[1:k],'d');
hold on;
scatter(result(:,1), result(:,2),[],result(:,3),'filled');

%% limit for 5 miles radius
filterResult = filterDistance(result,finalCentroids,5);
% visualize not covered
notCovered = filterResult(:,3) == 9999;
datNotCovered = filterResult(notCovered,1:3);
hold on;
scatter(datNotCovered(:,1), datNotCovered(:,2), 'x');

%% accuracy
accuracy = accuracyCovered(filterResult);
disp(accuracy)

%% save into csv
% saveAccuracy = ['accuracy : ' int2str(accuracy)];
saveData = vertcat(finalCentroids);
filename = ['Result/centroids_acc=' int2str(accuracy) '_k=' int2str(k) '.csv'];
csvwrite(filename,saveData);
