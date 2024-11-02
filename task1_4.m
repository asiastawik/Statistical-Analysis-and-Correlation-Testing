clear all
close all
clc

%% uploading the data and selecting proper columns
% 254912 - companies 1 and 12 - AAPL and JNJ - reason why 1 and not 254 is
% in email
data1 = readtable('aapl_us_d.csv');  % skips the first three rows of data

% Access the temperature column of the table
index1_close = data1.Close;
index1_data = data1.Date;


data2 = readtable('jnj_us_d.csv');
index2_close = data2.Close;
index2_data = data2.Date;

%% calculate returns
index1_returns = (index1_close(2:end) - index1_close(1:end-1))./index1_close(1:end-1)*100;
index2_returns = (index2_close(2:end) - index2_close(1:end-1))./index2_close(1:end-1)*100;

%% Create a subplot with data visualization
figure();

% Upper plot
subplot(2,1,1);
plot(index1_data(2:end), index1_close(2:end), 'r', 'LineWidth', 1.5);
title('Apple');
ylabel('Price [$]');
xlabel('Date');
xticks(datetime([2022 3 31; 2022 6 30; 2022 9 30; 2022 12 31]));
xticklabels({'Q1','Q2','Q3','Q4'})

subplot(2,1,2)
plot(index1_data(3:end), index1_returns(2:end), 'r', 'LineWidth', 1.5);
title('Apple - percentage return');
ylabel('Return [%]');
xlabel('Date');
xticks(datetime([2022 3 31; 2022 6 30; 2022 9 30; 2022 12 31]));
xticklabels({'Q1','Q2','Q3', 'Q4'})

%% Repeat the same with second index

figure();

% Upper plot
subplot(2,1,1);
plot(index2_data(2:end), index2_close(2:end), 'b', 'LineWidth', 1.5);
title('Johnson&Johnson');
ylabel('Price [$]');
xlabel('Date');
xticks(datetime([2022 3 31; 2022 6 30; 2022 9 30; 2022 12 31]));
xticklabels({'Q1','Q2','Q3','Q4'})

subplot(2,1,2)
plot(index2_data(3:end), index2_returns(2:end), 'b', 'LineWidth', 1.5);
title('Johnson&Johnson - percentage return');
ylabel('Return [%]');
xlabel('Date');
xticks(datetime([2022 3 31; 2022 6 30; 2022 9 30; 2022 12 31]));
xticklabels({'Q1','Q2','Q3', 'Q4'})

%% Calculate the basic statistic
Ex_1c = mean(index1_close); 
Std_1c = std(index1_close);
Median_1c = median(index1_close);
MAD_1c = mean(abs(index1_close-median(index1_close)));
Sk_1c = skewness(index1_close,1);
r_1c = iqr(index1_close);

Ex_2c = mean(index2_close); 
Std_2c = std(index2_close);
Median_2c = median(index2_close);
MAD_2c = mean(abs(index2_close-median(index2_close)));
Sk_2c = skewness(index2_close,1);
r_2c = iqr(index2_close);

Ex_1r = mean(index1_returns); 
Std_1r = std(index1_returns);
Median_1r = median(index1_returns);
MAD_1r = mean(abs(index1_returns-median(index1_returns)));
Sk_1r = skewness(index1_returns,1);
r_1r = iqr(index1_returns);

Ex_2r = mean(index2_returns); 
Std_2r = std(index2_returns);
Median_2r = median(index2_returns);
MAD_2r = mean(abs(index2_returns-median(index2_returns)));
Sk_2r = skewness(index2_returns,1);
r_2r = iqr(index2_returns);

stats = [Ex_1c, Std_1c, Median_1c, MAD_1c, Sk_1c, r_1c; Ex_2c, Std_2c, Median_2c, MAD_2c, Sk_2c, r_2c; Ex_1r, Std_1r, Median_1r, MAD_1r, Sk_1r, r_1r; Ex_2r, Std_2r, Median_2r, MAD_2r, Sk_2r, r_2r];
names = {'Expected value', 'Standard deviation', 'Median', 'MAD', 'Skewness', 'Interquartile range'};
names_r = {'Apple - Close', 'J&J - Close', 'Apple - % returns', 'J&J - % returns'};
T = array2table(stats, 'Variablenames', names, 'RowNames', names_r);
disp(T)

%% Using the T test, significance level 1%

[h, p, ci, stats] = ttest(index1_returns, 0, 'Alpha', 0.01);

fprintf('For index1_returns:\n');
if h
    fprintf('Reject null hypothesis (mean is not zero)\n');
else
    fprintf('Fail to reject null hypothesis (mean is zero)\n');
end
fprintf('Confidence interval for the mean: [%f, %f]\n', ci(1), ci(2));

fprintf('\nFor index2_returns:\n');
[h2, p2, ci2, stats2] = ttest(index2_returns, 0, 'Alpha', 0.01);

if h2
    fprintf('Reject null hypothesis (mean is not zero)\n');
else
    fprintf('Fail to reject null hypothesis (mean is zero)\n');
end
fprintf('Confidence interval for the mean: [%f, %f]\n', ci2(1), ci2(2));

%% Test the correlation between return of both indices

figure()
scatter(index1_returns,index2_returns)

disp(['Pearson is good for measure linear correlation and Spearman is for monotonical correlation. ' ...
    'Based on scatter plot is not clear if there is any of those types of correlation. In that case better is to use both Pearson and Spearman correlations.'])

%r - correlation coef (-1, 1)
[r1] = corr(index1_returns, index2_returns)  %Pearson
[r2] = corr(index1_returns, index2_returns, 'type', 'Spearman')

disp('Both r1 and r2 are between values -0.5 and 0.5, so there is no correlation at all.')

%% Check whether the return of those two indices have the same distribution

[h, p, ksstat] = kstest2(index1_returns, index2_returns);

if h
    fprintf('\nReject null hypothesis (distributions are different)\n');
else
    fprintf('\nFail to reject null hypothesis (distributions are the same)\n');
end

%% Choose a suitable normality test and decide are the index returns are normally distributed

figure()
qqplot(index1_returns)
histogram(index1_returns, 'Normalization','pdf')

figure()
qqplot(index2_returns)
histogram(index2_returns, 'Normalization','pdf')

disp('Kstest is good way to test only when we KNOW the parameters of distributions (expected value and std).\n')
disp('I choose a Jarque-Bera test.\n')

[t1, p1] = jbtest(index1_returns); 
disp([t1, p1])

[t2, p2]  = jbtest(index2_returns); 
disp([t2, p2])

disp('Parametr p-value of the normallity test is higher in p1 (index1_return).\n')

%% Subplot for index1_return with higher p-value

figure;
subplot(1,2,1);

[f,x] = ecdf(index1_returns); %compute empirical CDF
norm_cdf = normcdf(x, mean(index1_returns), Std_1r); %analytical CDF function
histogram(x, 'Normalization', 'cdf')
hold on
plot(x, f, 'r-', 'LineWidth', 1.5); %plot empirical CDF
hold on;
plot(x, norm_cdf, 'g--', 'LineWidth', 1.5); %plot analytical CDF function
hold off;
title('Empirical CDF vs. Normal CDF');
legend('Histogram Normalized to PDF', 'Empirical CDF', 'Analytical CDF', 'Location', 'best');

subplot(1,2,2);

[f, x] = ksdensity(index1_returns);  %compute kernel density estimate and plot
plot(x, f, 'LineWidth', 2);
hold on;
histogram(index1_returns, 'Normalization', 'pdf');
x = linspace(-10,10,100);
norm_pdf = normpdf(x, mean(index1_returns), Std_1r); %analytical PDF function
plot(x, norm_pdf, 'g--', 'LineWidth', 1.5); %plot analytical PDF function
hold off;
title('Kernel Density Estimation vs. Normal PDF');
legend('Kernel Density Estimate', 'Histogram Normalized to PDF', 'Analytical PDF', 'Location', 'northeast');
