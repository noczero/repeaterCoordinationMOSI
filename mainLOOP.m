%% using LOOP for k iteration
%% Main Program
% generate DataSet
clc;
clear;
dataSet = generatePeople();

%% generate Centroids
k = 50;
epoch = 1;
accuracy = zeros(10,k);
while (epoch <= 10)
    while (k > 0)

        startCentroids = generateCentroids(dataSet,k);
        % visualize Centroids
        figure
        scatter(startCentroids(:,1),startCentroids(:,2));
        title('Start Centroids');

        %% do kMeans
        [finalCentroids , result ] = kMeans(dataSet,startCentroids);
        % visualize
        figure 
        scatter(finalCentroids(:,1),finalCentroids(:,2),[],[1:k],'d');
        hold on;
        scatter(result(:,1), result(:,2),[],result(:,3),'filled');

        %% limit for 5 miles radius
        filterResult = filterDistance(result,finalCentroids,5);
        % visualize not covered
        notCovered = filterResult(:,3) == 9999;
        datNotCovered = filterResult(notCovered,1:3);
        hold on;
        scatter(datNotCovered(:,1), datNotCovered(:,2),[],'white', 'x');
        %%hold on;
        %%viscircles(finalCentroids,5);

        %% accuracy
        accuracy = accuracyCovered(filterResult);
        disp(accuracy)

        %% save into csv
        % saveAccuracy = ['accuracy : ' int2str(accuracy)];
        saveData = vertcat(finalCentroids);
        filename = ['Result/centroids_k=' int2str(k) '_acc=' int2str(accuracy) '_epoch=' epoch '.csv'];
        csvwrite(filename,saveData);

        %% save figure as picture
        visualisasi = title(['Repeater Coordination with k = ' num2str(k) ' Accuracy = '  num2str(accuracy)]);
        filenamePic = ['Result/centroids_k=' int2str(k) '_acc=' int2str(accuracy) '_epoch=' epoch '.jpg'];
        saveas(visualisasi,filenamePic);
        %% save into csv
        % saveAccuracy = ['accuracy : ' int2str(accuracy)];
        saveData = vertcat(finalCentroids);
        filename = ['Result/centroids_k=' int2str(k) '_acc=' int2str(accuracy) '_epoch=' int2str(epoch) '.csv'];
        csvwrite(filename,saveData);

        %% save figure as picture
        visualisasi = title(['Repeater Coordination with k = ' num2str(k) ' Accuracy = '  num2str(accuracy)]);
        filenamePic = ['Result/centroids_k=' int2str(k) '_acc=' int2str(accuracy) '_epoch=' int2str(epoch) '.jpg'];
        saveas(visualisasi,filenamePic);
        %% list Accuracy
        accuracy(epoch,k) = accuracy;
        
        k = k - 1; % decrement k until 0        
        close all;
        
    end
    
    epoch = epoch + 1; % increment epoch ++
end

