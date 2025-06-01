# ===================================================================
#             AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#       Session 9 : Statistical Analysis & Data Visualization
# ===================================================================

# Load required libraries
library(DataExplorer)  # For creating automatic data profiling reports
library(tidyverse)     # A collection of R packages for data science
library(dplyr)         # For data manipulation
library(ggplot2)       # For data visualization

# -----------------------------------------------
#### Initial Data Assessment & Manipulation ####
# -----------------------------------------------

# ----------------------
# Import dataset 
# ----------------------

lung_cancer <- read.csv("Lung_cancer.csv")

# Identify Missing values 
is.na(data)

# --------------------------------
#  Select relevant columns 
# --------------------------------

subset_data <- lung_cancer %>% 
  select(Age, Gender, Smoking, Status, Level)

# ---------------------------------------------------
# Check structure and summary of Age variable 
# ---------------------------------------------------

str(subset_data)
summary(subset_data$Age)

# -----------------------------------
# Create an age group column
# -----------------------------------

subset_data <- subset_data %>%
  mutate(Age_group = case_when(
    Age >= 14 & Age < 20 ~ "14–19",
    Age >= 20 & Age < 30 ~ "20–29",
    Age >= 30 & Age < 40 ~ "30–39",
    Age >= 40 & Age < 50 ~ "40–49",
    Age >= 50 & Age < 60 ~ "50–59",
    Age >= 60 & Age <= 73 ~ "60–73"
  ))
str(subset_data)

# ---------------------------------------------
# Convert character variables to factor
# ---------------------------------------------

subset_data <- subset_data %>% 
  mutate(across(where(is.character), as.factor)) # Re-order with factor() if needed factor()

# ---------------------------------------------------------------------
# Generate an automated data profiling report with DataExplorer Package
# ---------------------------------------------------------------------
create_report(subset_data)

# ------------------------------
#### Descriptive statistics ####
# ------------------------------
summary(subset_data$Age)

# ---------------------------------------------------
#### Frequency tables for categorical variables ####
# ---------------------------------------------------
table(subset_data$Gender)
table(subset_data$Smoking)

# -------------------------
#### Cross-tabulation ####
# -------------------------

table(subset_data$Smoking, subset_data$Age_group)

# ---------------------------------------------
#### Check normality of Age distribution ####
# ---------------------------------------------

# Plotting Methods: 
hist(subset_data$Age)         # Histogram
qqnorm(subset_data$Age)       # Q-Q Plot
qqline(subset_data$Age)       # Add reference line

# Shapiro-Wilk normality test
shapiro.test(subset_data$Age)

# --------------------------------------
# #### Hypothesis testing - t-test ####
# --------------------------------------

# Compare mean age between cancer and normal patients
lung_yes <- subset(subset_data, Status == "cancer")$Age
lung_no <- subset(subset_data, Status == "normal")$Age
t.test(lung_yes, lung_no)

# ---------------------
#### Correlation ####
# ---------------------

# Convert Status and Smoking to numeric
status <- ifelse(subset_data$Status == "normal", 0, 1)
smoking <- ifelse(subset_data$Smoking == "no", 0, 1)

# Correlation with Age
cor(status, subset_data$Age)

# Correlation with Smoking
cor(status, smoking)

# ------------------------------------------
##### Chi-square test for independence ####
# ------------------------------------------

chisq.test(table(subset_data$Status, subset_data$Smoking))

# ----------------------------
#### Logistic regression ####
# ----------------------------

# Predict cancer status based on Age and Smoking
logistic_regression <- glm(Status ~ Age + Smoking, 
                           data = subset_data, 
                           family = binomial)
summary(logistic_regression)

# ----------------------------------
#### Data visualization basics ####
# ----------------------------------
# ggplot have 3 main components
# data = data
# mapping = aes(x ,y) aesthetics 
# geometric = geom
# (geom_bar for for barplot)
# (geom_boxplot for boxplot)
# (geom_line for scatter plot & so on)

# For more functions go through ggplot Cheatsheet

# Example 1: Scatter plot with line (using BOD dataset)
data(BOD)
ggplot(data = BOD, mapping = aes(x = Time, y = demand)) +
  geom_point(size = 3) +
  geom_line(colour = "blue")

# Example 2: Same using pipe operator
BOD %>%
  ggplot(aes(x = demand, y = Time)) +
  geom_point(size = 3) +
  geom_line(colour = "red") +
  labs(title = "Oxygen Demand by Time")

# Example 3: CO2 dataset with faceting
data("CO2")
CO2 %>%
  ggplot(aes(conc, uptake, colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5) +
  facet_grid(~Type) +
  theme_minimal()

# -------------------------------------------------
#### Custom visualizations on lung cancer data ####
# -------------------------------------------------

# -----------------
# Histogram of Age
# -----------------
ggplot(subset_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  theme_minimal() +
  ggtitle("Age Distribution of Patients")

# --------------------------------
# Bar plot: Smoking vs Lung Cancer
# --------------------------------

ggplot(subset_data, aes(x = Smoking, fill = Status)) +
  geom_bar(position = "dodge") +
  theme_minimal() +
  ggtitle("Smoking Status and Lung Cancer")

# -----------------------------------
# Boxplot: Age by Lung Cancer Status
# -----------------------------------

ggplot(subset_data, aes(x = Status, y = Age, fill = Status)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Age by Lung Cancer Status")

# --------------
#### Tasks ####
# --------------

# Data Wrangling
##  Filter patients aged over 50 who have lung cancer.
##  Create a new variable "Smoking Risk" as "High" if Smoking is "yes", "Low" otherwise.

# Descriptive Statistics
##  Calculate mean and median age by Gender.
##  Create a summary table of Status for each Age group.

# Visualization
##  Plot a bar chart of cancer cases by Age group

# Hypothesis Testing
##  Test if age differs significantly by gender.
##  Test if smoking is significantly associated with cancer (Chi-square).


# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/
