############################################################
# STA 145 Final Project
# Research question:
# How is a representative's age related to their years of
# congressional service (measured as number of terms)?
############################################################

###############
# 0. SETUP ----
###############

# Load packages used in class
library(dplyr)

###############
# 1. LOAD DATA ----
###############

# Data file should be saved in the working directory as "data.csv"
data <- read.csv("data.csv")

# Create complete-case dataset for the two variables we use
data_complete <- data %>%
  filter(complete.cases(age, number_of_terms))

###############
# 2. DESCRIPTIVE STATISTICS ----
###############

# Age
mean_age     <- mean(data_complete$age)
sd_age       <- sd(data_complete$age)
summary_age  <- summary(data_complete$age)

# Number of terms
mean_terms    <- mean(data_complete$number_of_terms)
sd_terms      <- sd(data_complete$number_of_terms)
summary_terms <- summary(data_complete$number_of_terms)

# Print results to console
mean_age
sd_age
summary_age

mean_terms
sd_terms
summary_terms

# Frequency table for number_of_terms
table_terms <- table(data_complete$number_of_terms)
table_terms

###############
# 3. SCATTERPLOT & CORRELATION ----
###############

# Scatterplot of age and number of terms
plot(
  x = data_complete$age,
  y = data_complete$number_of_terms,
  xlab = "Age of representative (years)",
  ylab = "Number of terms in Congress",
  main = "Scatterplot of Age and Number of Terms"
)

# Correlation between age and terms
cor_age_terms <- cor(data_complete$age, data_complete$number_of_terms)
cor_age_terms

###############
# 4. LINEAR REGRESSION ----
###############

# Regress number_of_terms on age
model <- lm(number_of_terms ~ age, data = data_complete)

# Regression output
summary(model)

# Add regression line to the scatterplot
abline(model)

###############
# 5. RESIDUAL DIAGNOSTICS ----
###############

# Residuals vs fitted values
plot(
  x = fitted(model),
  y = resid(model),
  xlab = "Fitted values",
  ylab = "Residuals",
  main = "Residuals vs Fitted Values"
)
abline(h = 0)

# Optional: histogram of residuals
hist(
  resid(model),
  main = "Histogram of Residuals",
  xlab = "Residuals"
)
