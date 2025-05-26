# ===================================================================
#                  AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#                  Session 4: Operators in R  
# ===================================================================

# Operators are the special symbols/signs (like +, -, >, ==) 
# that tell R to do something values/variable 
# like add numbers, compare values, or make decisions

#There are four main types of operators in R:
  # Assignment Operators
  # Arithmetic Operators
  # Relational Operators
  # Logical Operators

#### Assignment Operators ####

# Used to assign values to variables.
# <-   (Most common; rightward assignment)
# ->   (Same as above, but leftward assignment)
# <<-  (Global assignment)
# ->>  (Global assignment – reversed version)
# =    (Also assigns, used in function arguments)

# Examples

# 1. <- (Most common assignment operator)
# Direction: From right to left.
# Recommended and most used in R.
x <- 10


# 2. -> (Same as <- but reversed)
# Direction: From left to right.
# Rare; used for style or special cases.
10 -> x

# 3. <<- (Global assignment)

# Assigns a value outside the current function (to the global environment or parent environment).\
# When you want to change a variable outside the function you can use this operator
# but not common in clean coding practices

myfunc <- function() {
  x <<- 5  # Assigns x global environment
}

myfunc()
print(x)  # x is available outside the function

# 4. ->> (Also a global assignment, but reversed)
#Same as \<\<- but assignment is from left to right
# Used very rarely.

5 ->> x # Same as x <<- 5

# 5. = (Also assigns, used in functions)

x = 10

mean(x = c(1, 2, 3))

## Difference Between `<-` and `<<-` (Global vs Local Assignment)

# In R, assignment operators define where a variable will be stored:
  
# <- Local (default) 
# Creates or updates a variable in the current environment. If used inside a function, it stays local.\

# Example
my_func <- function() {
  a <- 10  # a exists only inside this function
}
my_func()
print(a)  # Error! a doesn't exist in the global environment
# a only lives inside the local environment created for my_func

# Or check another example
b <- 5
my_func <- function() {
  print(x)  # R doesn't find b inside the function, so it checks the parent (global)
}
my_func()  # Output: 5
print(b) # Output: 5, already in global enviroment

# -----------------------------------------------------------------------
# <<- Global/Parent 
# Assigns a variable in the parent environment (e.g., global environment if used in a function).\
# This makes the variable available outside the function.

# Normally, variables created inside a function don’t affect the outside.
# But if you use <<-, you force R to look outside the function to assign
# the value either in the parent or global environment.

# Example

my_func <- function() {
  b <<- 20  # This puts b into the global environment 
} 
my_func()
print(b)  # Works! b is now global
# b is available outside the function!

# But this is not recommended in most cases because it can make your code confusing or buggy.

#Use <- when you want variables to stay local and predictable.
# Use <<- only when you intentionally want to affect a variable outside the current environment.
# Overusing <<- can make debugging hard and is not recommended in most programming situations. Prefer returning values from functions instead.

# Important:
# An environment in R is like a workspace or a storage area where variables live.\

#Global Environment(.GlobalEnv):This is your main workspace where you type and run your code in the R console or script.

# When you do this:
x <- 10
# You're storing the variable x in the global environment

# You can view what's in it using:
ls()

------------------------------------------------------------------------------
#Local Environment (inside functions): When you run a function, 
# R creates a new local environment to hold the function’s temporary variables.

my_func <- function() {
  y <- 20  # y exists only inside this function
}

my_func()

print(y)  # Error! y is not in the global environment

# y only lives inside the local environment created for my_func
--------------------------------------------------------------------

# Parent Environment:
# Every environment (except the global one) has a parent.
# If R can’t find a variable in the current environment, it looks in the parent, and so on, until it reaches the global environment.

environment()        # Where am I now?
parent.env(environment())  # What's my parent?
  
------------------------------------------------------------------------
#### Arithmetic Operators ####

# Used for mathematical calculations. You can use R as giant calculator.

# + Addition
3 + 2

# - Subtraction   
5 - 1

# * Multiplication 
4 * 3

# / Division
10 / 2

# ^ Exponentiation
2 ^ 3

(3 + 3 - 2) / 5

# OR

result <- 3 + 4 * 6 / 7
print(result)

------------------------------------------------------------------------
#### Relational Operators (Comparison) ####
  
# Used to compare values.

# == Equal 
x == 5 # different from = assignment operator

# != Not equal to
x != 5

# > Greater than   
x > 3

# < Less than  
x < 10

# >= Greater or equal 
x >= 7

# <= Less or equal   
x <= 9
  
# Example data
data <- data.frame(age = c(70, 80, 85, 75, 85, 86, 80))

# Exactly 80 years old
data$age == 80

# 80 or younger
data$age <= 80

# 80 or older
data$age >= 80

------------------------------------------------------------------------
#### Logical Operators ####
#Used to combine multiple conditions.

# & AND (both TRUE)
x > 5 & y < 10

# | OR (either TRUE)
x > 5 | y < 10

# ! NOT (negation) Not TRUE 

# Example dataset 
# (download actual dataset from Github Repository of this course )

disease_status <- data.frame(
  Age = c(55, 45, 60, 75, 56, 49),
  Gender = c("Female", "Male", "Female", "Female", "Male","Female"),
  Country = c("Pakistan", "UK", "USA", "USA", "Pakistan", "UK"),
  Disease = c("Cancer", "Hypertension","Cancer", "Hypertension", "Cancer", "Cancer")
)

# Age > 50 and Cancer
subset(disease, Age > 50 & Disease == "Cancer")

# Female OR from Pakistan
subset(disease, Gender == "Female" | Country == "Pakistan")

# Female from Pakistan with Hypertension
subset(disease, Gender == "Female" & Country == "Pakistan" & Disease == "Hypertension")

# Female NOT from Pakistan
subset(disease, Gender == "Female" & Country != "Pakistan")

# People not from UK
disease[disease$Country != "UK", ]

# ------------------------------------------------------------------------------
# Summary
# Always use <- for assignment (preferred style)
# Use == for comparison
# Logical operators help you filter and query data effectively

#### Exercise ####

# Task 1: Task: Assign values using different operators

# Assign the number 25 to a variable called age using <-.

# Assign the name "John" to a variable name using =.

# Use <<- inside a function to assign a variable called city with value "Lahore" globally.

# Print all three variables.

# Task 2: Basic maths 
x <- 15
y <- 5

# Add x and y
# Subtract y from x
# Multiply x by y
# Divide x by y
# Square x
# Calculate the result of (x + y)^2 / y

#### Task 3: Compare values ####

# Use the following:
a <- 10
b <- 20

# Is a equal to b?
# Is a not equal to b?
# Is a greater than or equal to 10?
# Is b less than a?
  
#### Task 4: 
# Use the following dataset:
death_data <- data.frame(
  Age_Group = c("50-54", "55-59", "60-64", "65-69", "70-74"),
  Rural_Male = c(11.7, 18.1, 26.9, 41.0, 66.0),
  Urban_Male = c(8.7, 11.7, 20.3, 30.9, 54.3),
  Rural_Female = c(15.4, 24.3, 37.0, 54.6, 71.1),
  Urban_Female = c(8.4, 13.6, 19.3, 35.1, 50.0)
)

# Age groups where rural male death rate > 30
# Age groups where urban female death rate < 20
# Age groups where rural female death rate > rural male death rate
# Age groups where either rural female or urban female death rate exceeds 50


# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/
  
