clear all
close all
clc

%generating 3 samples of size 2000 from a standard normal distribution
N = randn(1, 2000);
N2 = randn(1, 2000);
N3 = randn(1, 2000);

%creating a sample:
Z = N.^2 + N2.^2 + N3.^2;

%% ecdf -  empirical cumulative distribution functions
subplot(2,1,1)
ecdf(Z)
hold on
x = linspace(0,8);
xlim([0 8]) %x-axis limit from 0 to 8

%analytic cdf of chi2(3)
plot(x, chi2cdf(x, 3), 'Color', [0,0,0], 'LineStyle', ':') %curve dotted and black
title('Upper plot')
hold off

% empirical cumulative distribution functions of variables N, N2 and N3
subplot(2,1,2)
ecdf(N)
hold on
ecdf(N2)
hold on
ecdf(N3)
legend('N', 'N2', 'N3', 'location', 'best') %legend in best position
title('Lower plot')

%% Analitic statistics - statics from wikipedia.org site
%chi2(3) -> chi2(k)
k = 3;
mean_a = k;
median_a = k*(1-(2/(9*k)))^3;
var_a = 2*k;
skw_a = sqrt(8/k);

%Create a table
stats = [mean(Z), median(Z), var(Z), skewness(Z); mean_a, median_a, var_a, skw_a];
names = {'Mean', 'Median', 'Variance', 'Skewness'};
T = array2table(stats, 'VariableNames', names);

