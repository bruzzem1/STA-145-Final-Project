# STA 145 Final Project – Replication Package

**Research question:**  
How is a representative’s age related to their years of congressional service (measured as number of terms)?

This repository contains the materials needed to reproduce my final project analysis for STA 145. The README is meant to match the Data section of my final paper.

---

## 1. Data Description

Each row in the dataset represents one member of the U.S. House of Representatives. The data include basic demographic and background information on representatives, along with how long they have served in Congress.

The CSV used for the analysis is saved as **`data.csv`** in this repository.

---

## 2. Variables Used in This Project

I focus on one pair of variables:

- **Age (`age`)**  
  - Continuous variable  
  - Age of the representative in years.

- **Years of congressional service (`number_of_terms`)**  
  - Count variable  
  - Number of two-year terms the representative has served in the U.S. House.  
  - Higher values indicate more experience / longer time in office.

Conceptually, `age` is my **independent variable** and `number_of_terms` is my **dependent variable**. I use number of terms as my measure of years of service.

---

## 3. Data Cleaning

All analyses are based on complete cases for the two variables listed above.

Cleaning steps:

1. Read the CSV into R as an object called `data`.
2. Used the `dplyr` package to create a complete-case dataset:

   ```r
   data_complete <- data %>%
     dplyr::filter(complete.cases(age, number_of_terms))
   ```

3. All descriptive statistics, plots, and models are run on `data_complete`.

No additional recoding or transformations were needed, since both variables were already in a usable numeric format.

---

## 4. Statistical Methods

Because both variables are numeric, I use correlation and linear regression to study their relationship.

1. **Descriptive statistics** for `age` and `number_of_terms`  
   - `mean()`, `sd()`, `summary()`, and a frequency table for the number of terms.

2. **Scatterplot** of age and number of terms  
   - `plot(age, number_of_terms)` to visualize the relationship.

3. **Linear regression**  
   - Model: `number_of_terms ~ age`  
   - Fit with `lm()` and summarized with `summary(model)`.  
   - The regression line is added to the scatterplot with `abline(model)`.

4. **Assumption checks**  
   - Residuals vs fitted values plot using `plot(fitted(model), resid(model))` and a horizontal line at 0 with `abline(h = 0)`.  
   - A histogram of the residuals using `hist(resid(model))` to get a sense of the normality assumption.

---

## 5. How to Reproduce the Analysis

To reproduce the results in my project:

1. Download this repository.
2. Open **`bruzzese-final_project.R`** in RStudio (or base R).
3. Set the working directory at the top of the script so that R can find `data.csv`.
4. Make sure the file name of the dataset is **`data.csv`**.
5. Install and load the `dplyr` package if it is not already installed:

   ```r
   install.packages("dplyr")   # only needed once
   library(dplyr)
   ```

6. Run the script from top to bottom.

Running the script will:

- produce descriptive statistics for age and number of terms,  
- create a scatterplot of age vs. number of terms with a regression line,  
- estimate a linear regression model of number of terms on age, and  
- generate diagnostic plots for the regression residuals.

---

## 6. Files in This Repository

- `bruzzese-final_project.R` – R script with all analysis code  
- `data.csv` – dataset used in the project  
- `README.md` – documentation of variables, cleaning steps, and replication instructions 
