clear all
close all
clc

% loading the data lab3
load lab3.mat

%% use 2 kernel functions with 2 bandwidth, then plot on one figure

%sample x1
figure()
ksdensity(x1, 'Kernel', 'normal', 'Bandwidth', 5)
hold on
ksdensity(x1, 'Kernel', 'normal','Bandwidth', 10)
ksdensity(x1, 'Kernel', 'box', 'Bandwidth', 5)
ksdensity(x1, 'Kernel', 'box', 'Bandwidth', 10)
legend('normal 5', 'normal 10', 'box 5', 'box 10', 'location', 'best')
title('x1')
hold off

%sample x2
figure()
ksdensity(x2, 'Kernel', 'normal', 'Bandwidth', 5)
hold on
ksdensity(x2, 'Kernel', 'normal','Bandwidth', 10)
ksdensity(x2, 'Kernel', 'box', 'Bandwidth', 5)
ksdensity(x2, 'Kernel', 'box', 'Bandwidth', 10)
legend('normal 5', 'normal 10', 'box 5', 'box 10', 'location', 'best')
title('x2')
hold off

%sample x3
figure()
ksdensity(x3, 'Kernel', 'normal', 'Bandwidth', 5)
hold on
ksdensity(x3, 'Kernel', 'normal','Bandwidth', 10)
ksdensity(x3, 'Kernel', 'box', 'Bandwidth', 5)
ksdensity(x3, 'Kernel', 'box', 'Bandwidth', 10)
legend('normal 5', 'normal 10', 'box 5', 'box 10', 'location', 'best')
title('x3')
hold off

disp("Sample x3 has a sharp edge - this couldn't be normal distribution.")

%% Verify assumption - qqplot

figure('Position', [0 0 1500 500])
subplot(1,3,1)
qqplot(x1)
subplot(1,3,2)
qqplot(x2)
subplot(1,3,3)
qqplot(x3)

disp("Based on the plots - sample x1 and x2 could come from normal distribution, because dots are close to the line. As I assumed before - sample x3 is not from normal distribution.")
