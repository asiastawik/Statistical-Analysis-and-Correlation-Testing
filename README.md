# Data Analysis Report: Statistical Analysis and Correlation Testing Using MATLAB

This repository contains a detailed analysis report conducted using MATLAB. The report involves generating and analyzing statistical properties of random variables, performing kernel density estimation, testing for normality, calculating correlations, and visualizing financial data from two indices of the S&P 500. The following tasks were undertaken:

## Project Overview

### Task 1.1: Basic Statistics of Random Variables (3 Points)

1. **Generate Data**:
   - Created three samples (`N`, `N2`, `N3`) of size 2000 from a standard normal distribution.
   - Constructed the variable `Z` as `Z = N^2 + N2^2 + N3^2`.

2. **Visualization**:
   - **Subplot Panel 1**: Compared the empirical cumulative distribution function (ECDF) of `Z` with the analytic CDF of a χ²(3) distribution (using a dotted black line). The x-axis limit was set from 0 to 8.
   - **Subplot Panel 2**: Displayed ECDFs of `N`, `N2`, and `N3` with a legend positioned at 'best'.

3. **Statistical Comparison**:
   - Calculated basic statistics (mean, median, variance, skewness) for `Z` and compared them with analytic statistics for the χ²(3) distribution in a table format.

### Task 1.2: Kernel Density Estimation (2 Points)

1. **Load and Analyze Data**:
   - Loaded the provided `lab3` dataset containing three samples.
   - Applied two kernel functions with two different bandwidths for each sample and plotted them on individual figures.

2. **Identify Normal Distribution**:
   - Determined which sample appeared to originate from a normal distribution based on visual inspection.
   - Verified the assumption using a q-q plot.

### Task 1.3: Testing Normality and Correlation (2 Points)

1. **Load Data**:
   - Loaded the `data4` file and performed normality tests to identify whether vector `x` or `y1` was normally distributed.

2. **Plotting and Distribution Analysis**:
   - Created subplots for the CDF and PDF estimator of the non-normal vector, naming the distribution appropriately.

3. **Correlation Testing**:
   - Conducted Pearson and Spearman correlation tests between pairs `(x, y1)`, `(x, y2)`, and `(x, y3)`.
   - Analyzed whether correlations were positive or negative for each pair.

### Task 1.4: Financial Data Analysis (3 Points)

1. **Data Preparation**:
   - Downloaded and imported two selected indices from the S&P 500, covering the period from 31.12.2021 to 31.12.2022.
  
2. **Visualization**:
   - Created subplots:
     - **Upper Plot**: Displayed the original data for 2022, omitting the last day of 2021.
     - **Lower Plot**: Presented the percentage return for the indices.
   - Customized the titles, y-axis labels, and x-axis ticks to indicate the first day of each quarter.

3. **Statistical Analysis**:
   - Calculated basic statistics (mean, standard deviation, median, MAD, skewness, interquartile range) for the returns and displayed them in a table.

4. **T-Test**:
   - Conducted a T-test at a 1% significance level to check if the mean returns were significantly different from 0.

5. **Correlation and Scatter Plot**:
   - Tested the correlation between the returns of both indices, determining the type (positive/negative).
   - Prepared a scatter plot and chose between Pearson and Spearman correlation, providing reasoning for the selection.

6. **Distribution Analysis**:
   - Checked if the returns of the two indices had the same distribution.
   - Performed a suitable normality test and discussed the suitability of the K-S test.

7. **Detailed Subplot for Higher p-value Index**:
   - **Left Plot**: Included ECDF, normalized histogram (CDF estimator), and the analytical CDF of a normal distribution.
   - **Right Plot**: Showed the kernel density estimate, normalized histogram (PDF estimator), and the analytical PDF with estimated parameters.

## Programming Language and Tools

- **MATLAB** was used for the analysis and visualization throughout this project.
- The built-in functions and custom code were utilized to handle statistical computations, visualizations, and hypothesis testing.
