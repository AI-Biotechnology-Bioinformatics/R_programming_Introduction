# ===================================================================
#                  AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#                    Session 3:Functions in R      
# ===================================================================
# A function is a reusable block of code 
# designed to execute a specific task when it’s called

# There are two types of functions in R 
# 1. Built-in R functions - readily available functions in R base, Pre-installed
# 2. User defined Functions - You can customized according to your need

# For example 
# The mode() function in base R does not return the most frequent value; it indicates the data type (like numeric or character). 
# To compute the statistical mode, a user-defined is needed.
# that you can create by your self 

# Let's Try it

# -------------------------------------------------------------------
# Function to calculate Mode
# -------------------------------------------------------------------
age <- c(26, 56, 58, 56, 40, 45, 56)

# First understand how to calculate mode in R 

# 1st step: Get Unique Value
uniq_val <- unique(age)
# This creates a new vector uniq_val 
# that contains only the distinct (unique) values from the age vector.

# 2nd step: Find the Most Frequent Value (Mode)
uniq_val[which.max(tabulate(match(age,uniq_val)))]

# code breakdown
# match(age, uniq_val) This returns the position of each element in age within uniq_val
# tabulate(...) Counts how many times each unique value appears
# which.max(...) Finds the position of the maximum count (the most frequent value)
# uniq_val[ ] Gets the actual value from the unique values using the index of the most frequent one

# Now create function to calculate mode

calculate_mode <- function(x){
  uniq_val <- unique(x)
  uniq_val[which.max(tabulate(match(x,uniq_val)))]
}
calculate_mode(age)

# You can this calculate_mode function across different variables or datasets

# to calculate mode value for weight
weight <- c(65, 76, 66, 67, 56, 76, 77)
calculate_mode(weight)

flower <- c("rose", "lily", "sunflower", "rose", "tulip", "iris")
calculate_mode(flower)

# Task: create different variables and calculate their mode

# -------------------------------------------------------------------
# Function to check gene expression level with if else function
# -------------------------------------------------------------------

check_expression <- function(expression_values){
  if(expression_values> 20) {
    return("highly expressed")
  } else{
    return("low expression")
  }
}

# check the expression of these genes using check_expression function
gene1 <- 35
gene2 <- 17
gene3 <- 25

check_expression()


# -------------------------------------------------------------------
# Function to calculate BMI
# -------------------------------------------------------------------
# formula to calculate BMI = weight/(height)^2

calculate_bmi <- function(weight_kg, height_m){
  bmi <- weight_kg/(height_m ^ 2)
  return(bmi)
}
weight <- 70
height_m <- 1.75

bmi <- calculate_bmi(weight, height_m)

# Task: Run this line of command and check the output
# notice the output of both codes and 
# try explain the output(why you're getting that particular results)
calculate_bmi(weight)
calculate_bmi(height_m)

# -------------------------------------------------------------------
# Function to find max and min expression values
# -------------------------------------------------------------------
var <- c(28, 23, 66, 86, 45, 90, 120) 

min_max <- function(values){
  minimum_value <- min(values)
  maximum_value <- max(values)
  result <- c(min = minimum_value, max = maximum_value)
  return(result)
}
min_max(var)

# Task 1: create a 3 different vectors with random number and find max min value by calling min_max function

# Task 2: create a function to calculate range from min & max value 
# hint:Try to incorporate below line of code in min_max function 
# range = max -min

# ----------------------------------------------------------------------------------------------------------------


# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/


