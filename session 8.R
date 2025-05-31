# ===================================================================
#             AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#               Session 8: Data Manipulation
# ===================================================================

# Data Manipulation Using the tidyverse Package
# cleaning 
# remove unessasary column
# subset 

# tidyverse data science data manipulation and visulation 
# dplyr - data manipulation
# ggplot - grammar of graphics 


install.packages("tidyverse") # one time step 

library(tidyverse) # activate it by using library
library(dplyr)
tidyverse_packages()

# custom function
# BMI, mode

# Load the dataset
lung_data <- read.csv("lung_cancer.csv", row.names = FALSE)
data <- lung_data

str(data)

# data type conversion if conversion needed
# Except Age & BMI all categorical
# convert them to factor

# is.na NA values
is.na(data)
sum(is.na(data)) # no missing value 

# Select only age, gender, and smoking columns
dplyr::select()
caret::train() # machine model training

selected_data <- dplyr::select(data, age, gender, smoking)
print(selected_data)
selected_data <- dplyr::select(data, 
                               Age, Gender, Smoking, bmi)
names(data)
data[,#column]

# if else statemnets
# conditionals operators
# Filter patients over 60 years old
filtered_data <- filter(data, Age > 60)
filter()

print(filtered_data)

# Create new column: BMI category
data.frame(bmi = c(12, 11,))

mutated_data <- mutate(data,
                       bmi_category = case_when(
                         bmi < 18.5 ~ "Underweight",
                         bmi < 25 ~ "Normal",
                         bmi < 30 ~ "Overweight",
                         TRUE ~ "Obese"
                       ))
print(mutated_data)
mutated_data <- mutate(data,
                       Bmi_category = case_when(
                         bmi < 18.5 ~ "Underweight",
                         bmi < 25 ~ "Normal",
                         bmi < 30 ~ "Overweight",
                         TRUE ~ "Obese"
                       ))

# Summarize average BMI and weight
summary(data)
# summarize more customized function
summary_stats <- summarize(data,
                           min_bmi = min(bmi, na.rm = TRUE),
                           avg_bmi = mean(bmi, na.rm = TRUE),
                           max_bmi = max(bmi, na.rm = TRUE), 
                           age_min = min(Age, na.rm = TRUE))
print(summary_stats)
names(data)
na.rm() # remove NA values
summary_stats <- summarize(data,
                           min_age = min(Age, na.rm = TRUE),
                           avg_age = mean(Age, na.rm = TRUE),
                           max_age = max(Age, na.rm = TRUE),
                           min_bmi = min(bmi, na.rm = TRUE),
                           max_bmi = mean(bmi, na.rm = TRUE),
                           bmi_min = min(bmi, na.rm = TRUE))

# group_by(): Group the data by one or more variables like Gender
grouped_data <- group_by(data, Gender)

grouped_data <- group_by(data, Gender)

# Calculate average for each group
summary <- summarize(grouped_data, avg_age = mean(Age)) 
print(summary)

by_group <- summarize(grouped_data, avg_age = mean(Age))
print(by_group)

# The Pipe (%>%) Operator

# The pipe operator (%>%) allows you to pass the output of one function 
#directly into the next function. 

# This makes code more readable 
# by eliminating the need for nested functions and 
# by making the sequence of data manipulations more easy

# Remove index columns if present
lung_data <- lung_data %>%
  select(-matches("index|Patient.id"), everything())

data <- data %>%
  select(-matches("index|Patient.id|X"), everything())
str(data)

data$Gender <- as.factor(data$Gender)

# Convert categorical columns to factors and ensure numeric columns
data <- data %>%
  mutate(
    across(where(is.character), as.factor),
    age = as.numeric(age),
    bmi = as.numeric(bmi),
    weight_kg = as.numeric(weight_kg)
  )
data <- data %>%
  mutate(across(where(is.integer), as.factor),
         across(where(is.character), as.factor),
         age = as.numeric(Age),
         bmi = as.numeric(bmi))
str(data) # to check structure with base R
glimpse(data) # with dplyr

# Count cases by cancer level
lung_data %>% count(level)
lung_data %>% count(Level)

# Gender distribution
lung_data %>% count(gender)
lung_data %>% count(Gender)
lung_data %>% count(Smoking)
lung_data %>% count(Passive.Smoker)
lung_data %>% count(Alcohol.use)

# frequency table categorical variables
# descriptive statistics # numeric data

# Mean age and BMI by cancer level
lung_data %>%
  group_by(level) %>%
  summarize(
    mean_age = mean(age, na.rm = TRUE),
    mean_bmi = mean(bmi, na.rm = TRUE)
  )

# Cross-tab of smoking vs level
lung_data %>% count(smoking, level)  
summarize(group_by(filter(data, Age > 50), Gender), 
          avg_age = mean(Age))

# Group by gender and summarize average age
grouped_summary <- data %>%
  group_by(gender) %>%
  summarize(avg_age = mean(age, na.rm = TRUE))
print(grouped_summary)

# Patients over 60 grouped by smoking level, average BMI
pipe_example <- data %>%
  filter(age > 60) %>%
  group_by(smoking) %>%
  summarize(avg_bmi = mean(bmi, na.rm = TRUE))
print(pipe_example)


# Patients with high genetic risk and chronic lung disease
lung_data %>%
  filter(genetic_risk == 3, chronic_lung_disease == 3)

# Create a risk score (example: sum of 3 categorical factors + BMI)
lung_data <- lung_data %>%
  mutate(
    risk_score = as.numeric(as.character(smoking)) +
      as.numeric(as.character(genetic_risk)) +
      as.numeric(as.character(chronic_lung_disease)) +
      bmi
  )

# Top 5 high-risk patients
lung_data %>%
  arrange(desc(risk_score)) %>%
  select(age, gender, smoking, genetic_risk, bmi, risk_score) %>%
  head(5)