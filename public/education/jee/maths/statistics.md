# Statistics (JEE Level)

## Why This Chapter Matters
Statistics in JEE covers measures of central tendency, variance, standard deviation, and coefficient of variation — 4-6 marks. Quick calculations using deviation from mean are tested.

## Core Concepts

### 1. Measures of Central Tendency
**Mean (x_bar):** sum of all values / n
For grouped data: x_bar = sum(f_i x_i)/sum(f_i)

**Median:** Middle value of sorted data. For n values: (n+1)/2 th value if n odd; average of n/2 and (n/2+1)th if n even.

**Mode:** Most frequently occurring value.

### 2. Measures of Dispersion

**Range:** Maximum - Minimum

**Mean Deviation about Mean:**
MD = sum|x_i - x_bar| / n

**Variance:**
sigma^2 = sum(x_i - x_bar)^2 / n = sum(x_i^2)/n - x_bar^2

**Standard Deviation:**
sigma = sqrt(variance)

**Coefficient of Variation (CV):**
CV = (sigma/x_bar) x 100%
Lower CV = more consistent data.

### 3. Effect of Operations on Mean and Variance
If each x_i -> x_i + k: mean -> mean + k, variance unchanged, SD unchanged
If each x_i -> k x_i: mean -> k x mean, variance -> k^2 x variance, SD -> |k| x SD

## PYQs
**2024:** Data: 5,7,9,11,13. Find variance.
Mean = 45/5 = 9. Deviations: -4,-2,0,2,4. Sum of squares = 16+4+0+4+16 = 40.
Variance = 40/5 = 8.

**2023:** The SD of two values a and b is 5. Also (a-b)^2 = 200. Find |a-b|.
Variance = (a-b)^2/4 = sigma^2. So 200/4 = 50 = sigma^2 (if computed about mean).
Actually: for two values a,b: mean = (a+b)/2, variance = [(a-mean)^2+(b-mean)^2]/2 = (a-b)^2/4.
sigma^2 = (a-b)^2/4 = 25. (a-b)^2 = 100. |a-b| = 10.

**2022:** Which data set is more consistent? A: mean=30, SD=6. B: mean=25, SD=5.
CV(A) = 6/30 x 100 = 20%. CV(B) = 5/25 x 100 = 20%. Equal consistency.

## Revision Notes
```
MEAN: sum(x)/n or sum(fx)/sum(f)
VARIANCE: sigma^2 = sum(x-mean)^2/n = sum(x^2)/n - mean^2
SD: sigma = sqrt(variance)
CV: (sigma/mean) x 100 -- lower = more consistent

EFFECT OF TRANSFORMATIONS:
y = x + k: mean_y = mean_x + k, sigma_y = sigma_x
y = kx:   mean_y = k x mean_x, sigma_y = |k| x sigma_x
```
