
function makeCircleOnCentroids(finalCentroids, radius)
%% make circle on final centroids


[rows cols] = size(finalCentroids)
axis equal;
for i = 1:rows
    hold on;
    circle(finalCentroids(i,1),finalCentroids(i,2),radius);
    %%viscircles(finalCentroids(i),radius);
end
    
end