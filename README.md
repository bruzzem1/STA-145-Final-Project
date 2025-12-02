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
