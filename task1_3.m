clear all
close all
clc

%loading the data4 file
load data4.mat

%% Which vector (x or y1) is normally distributed?
l = linspace(0,1,1000);
figure("Name",'x')
scatter(l,x)
figure("Name",'y1')
scatter(l,y1)

figure("Name", 'qqplot(x)')
qqplot(x)
figure("Name", 'qqplot(y1)')
qqplot(y1)

figure("Name",'histogram x')
histogram(x, 'Normalization','pdf')
figure("Name",'histogram y1')
histogram(y1, 'Normalization','pdf')

l2 = linspace(-4,4);
hold on
plot(l2, normpdf(l2,0,1))

disp("The 'y1' is normally distributed.")

%% Normality test - in a loops

for i = 1:10
h1 = jbtest(y1);
h2 = lillietest(y1);
h3 = kstest(zscore(y1)); 
disp([h1, h2, h3])
end

for i = 1:10
h4 = jbtest(x);
h5 = lillietest(x);
h6 = kstest(zscore(x)); 
disp([h4, h5, h6])
end

disp("'x' is not normal distribution, but y1 is normally distributed.")

%% Plot the cdf and pdf of x (not normal vector)

figure("Name", 'Subplot cdf and pdf')
subplot(2,1,1)
histogram(x, 'Normalization', 'pdf')
subplot(2,1,2)
histogram(x, 'Normalization', 'cdf')
disp("'x' is the uniform distribution.")

%% Testing the correlation

%pair (x, y1)
figure("Name", 'Correlation x, y1')
scatter(x,y1)
[r1, p1] = corr(x', y1') %transpose ' , Pearson
[r2, p2] = corr(x', y1', 'type', 'Spearman')
disp("There is no correlation between pair (x, y1), because r is between -0.5 and 0.5.")

%pair (x, y2)
figure("Name", 'Correlation x, y2')
scatter(x,y2)
[r1, p1] = corr(x', y2') %transpose ' , Pearson
[r2, p2] = corr(x', y2', 'type', 'Spearman')
disp("The correlation between pair (x, y2) is negative, because r < -0.5.")

%pair (x, y3)
figure("Name", 'Correlation x, y3')
scatter(x,y3)
[r1, p1] = corr(x', y3') %transpose ' , Pearson
[r2, p2] = corr(x', y3', 'type', 'Spearman')
disp("The correlation between pair (x, y3) is positive, because r > 0.5.")

%r - correlation coef (-1, 1)
%positive r > 0.5
%negative r < -0.5
%anything between - no correlation

