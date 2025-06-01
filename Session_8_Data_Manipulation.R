# ===================================================================
#             AI and Biotechnology / Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#               Session 8: Data Manipulation
# ===================================================================

# ---------------------------------
# Data Manipulation with tidyverse
# ---------------------------------

# The tidyverse is a collection of R packages for data science.
# It makes importing, cleaning, transforming, and visualizing data easier.

# Two key packages from tidyverse:
# - dplyr: for data manipulation (Grammar of Data Manipulation)
# - ggplot2: for data visualization (Grammar of Data Visualization)

# Mastering these two will give you strong foundation of R.

# Install tidyverse (only once)
install.packages("tidyverse")

# Load tidyverse (activates all core packages)
library(tidyverse)

# Alternatively, you can load only the needed package
library(dplyr)  # activates only dplyr

# Check available tidyverse packages
tidyverse_packages()

# ----------------------------
# Load and Inspect Dataset
# ----------------------------

# Load dataset from working directory
lung_data <- read.csv("lung_cancer.csv")

# Or use file chooser
lung_data <- read.csv(file.choose())

# Inspect structure using base R and dplyr
str(lung_data)         # base R
glimpse(lung_data)     # dplyr version

# ----------------------------
# Select Columns
# ----------------------------

# Use select() to extract specific columns
subset_data <- select(lung_data, Age, Gender, Smoking)
print(subset_data)

# ----------------------------
# Filter Rows
# ----------------------------

# Use filter() to select rows where Age > 60
filtered_data <- filter(lung_data, Age > 60)
print(filtered_data)

# ----------------------------
# Create New Variables
# ----------------------------

# Use mutate() to create a new column 'bmi_category'
mutated_data <- mutate(lung_data,
                       bmi_category = case_when(
                         BMI < 18.5 ~ "Underweight",
                         BMI < 25 ~ "Normal",
                         BMI < 30 ~ "Overweight",
                         TRUE ~ "Obese"
                       ))
print(mutated_data)
View(mutated_data)

# ----------------------------
# Summarize Data
# ----------------------------

# Use summarize() to get summary statistics
summary_stats <- summarize(lung_data,
                           min_age = min(Age, na.rm = TRUE),
                           avg_age = mean(Age, na.rm = TRUE),
                           max_age = max(Age, na.rm = TRUE),
                           min_bmi = min(BMI, na.rm = TRUE),
                           avg_bmi = mean(BMI, na.rm = TRUE))
print(summary_stats)

# ----------------------------
# Grouped Summary
# ----------------------------

# Use group_by() and summarize() for grouped statistics
grouped_data <- group_by(lung_data,
                         Gender)
summary <- summarize(grouped_data, 
                     avg_age = mean(Age, na.rm = TRUE))
print(summary)

# ----------------------------
# The Pipe Operator (%>%)
# ----------------------------

# The pipe operator %>% allows chaining functions.
# It improves readability and expresses sequential operations clearly.

# Example: Remove unnecessary index columns
lung_data <- lung_data %>%
  select(-matches("index|Patient.id|X"), everything())

# ----------------------------
# Count Observations
# ----------------------------

# Count observations by group
lung_data %>% count(Level)     # Cancer levels
lung_data %>% count(Gender)    # Gender distribution
lung_data %>% count(Smoking)   # Smoking status

# ----------------------------
# Summarize by Groups
# ----------------------------

# Mean age and BMI by cancer level
lung_data %>%
  group_by(Level) %>%
  summarize(
    mean_age = mean(Age, na.rm = TRUE),
    mean_bmi = mean(BMI, na.rm = TRUE)
  )

# Cross-tab: Smoking vs Level
lung_data %>% count(Smoking, Level)

# Grouped summary: average age for Age > 50 by Gender
data %>%
  filter(Age > 50) %>%
  group_by(Gender) %>%
  summarize(avg_age = mean(Age, na.rm = TRUE))

# -----
# Tasks
# -----

# Use filter() to find female patients over 50 with high BMI (>30).
# Count how many patients are in each BMI category (Underweight, Normal, etc.).
# Use summarize() to calculate min, mean, and max BMI & Smoking status.
# Identify the gender with the highest average risk score.
# Export a summary table to CSV using write.csv().

# For more functions and examples, check the dplyr cheatsheet:
# https://github.com/rstudio/cheatsheets/blob/main/data-transformation.pdf
