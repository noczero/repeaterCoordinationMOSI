function [dataSet] = generatePeople()

%% scheme 1
%%rng(0,'twister');
a = 0;
b = 40;
rawRand = (b-a).*abs(randn(1000,2)) + a;
people = round(rawRand,0);
%%people = abs(randomRound);

% scatter(people(:,1),people(:,2));

%% scheme 2
p = normpdf([0,40],[1000,2]);

x = [-3:.1:3];
norm = normpdf(x,0,1);

%% scheme 3
% generate X value
randomX = myLCG(997,36,57,24,1000); % call LCG with m : 997, a : 36 , c : 57 , x0 : 24 , range : 1000)
inRangeX = abs(randomX*40); % range is 0 - 40 the value are positive integer

% generate Y value
randomY = myLCG(997,79,78,36,1000);
inRangeY = abs(randomY*40);

dataSet = [inRangeX inRangeY];
scatter(dataSet(:,1),dataSet(:,2)); % visualize data
end