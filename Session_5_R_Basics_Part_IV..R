# ===================================================================
#             AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#                Session 5: Data Types in R  
# ===================================================================

######################## Data Types in R ##############################

# -----------------------------------------------------
# 1. Numeric
# -----------------------------------------------------
# Numeric data in R includes real numbers that can have a decimal point.
# They may be positive or negative.
# This data type is continuous.
var1 <- 40.8  # decimal value

## You can use the `class()` function to check the data type of any variable
class(var)   # returns "numeric"

var2 <- -40.6 # negative decimal
class(var2)

# Even whole numbers without 'L' are treated as numeric by default.
var3 <- 40
class(var3) # returns "numeric"

# -----------------------------------------------------
# 2. Integer
# -----------------------------------------------------
# Integer data includes whole numbers without decimals.
# You can define an integer by adding 'L' after the number.

a <- 25
class(a)  # numeric

b <- 25L
class(b)  # integer

# Converting numeric to integer using as.integer()
var1 <- as.integer(var1)
class(var1)  # now it's integer

# Note: R truncates the decimal part when converting numeric to integer.
num_val <- 40.9
int_val <- as.integer(num_val)
int_val  # 40, decimal part is removed

# When to use integer?
# Integer uses less memory than numeric.
# Useful in large datasets or ML models.

# Convert integer to numeric
back_to_num <- as.numeric(int_val)
class(back_to_num)

# -----------------------------------------------------
# 3. Character
# -----------------------------------------------------
# Character data holds text or string values.
# These must be enclosed in single (' ') or double (" ") quotes.

chr <- "biotechnology"
class(chr)  # character

# Numbers in quotes are also treated as characters.
a <- "2" # its looks like numeric but due to "" its a character datatype
class(a)  # character

# Example of non-character numeric
b <- 2
class(b)  # numeric

# -----------------------------------------------------
# 4. Factor
# -----------------------------------------------------
# Factors are used to store categorical (qualitative) data.
# Useful for statistical modeling and machine learning.

# Example: Disease status, Gender, Group etc.
status <- c("normal", "cancer", "normal")
status_fac <- as.factor(status)
class(status_fac)
levels(status_fac)  # alphabetically ordered

# You can relevel factors to define custom order
status_fac <- factor(status_fac, levels = c("normal", "cancer"))

# Convert character factor into numeric using ifelse
# e.g., 0 = normal, 1 = cancer
target <- ifelse(status == "normal", 0, 1)
class(target)  # numeric

target_fac <- as.factor(target)
class(target_fac)

# -----------------------------------------------------
# 5. Logical
# -----------------------------------------------------
# Logical data represents TRUE or FALSE values.

age <- c(15, 21, 35)
old <- age > 20  # logical condition
old  # FALSE TRUE TRUE

######################## Practical Example with data type conversion ##############################

# Create a data frame with 5 main columns
df <- data.frame(
  name = c("Ali", "Sara", "John", "Ayesha", "Usman"),
  age = c(25, 30, 19, 45, 50),          # whole numbers (should be integer)
  weight = c(70.5, 60.2, 55.0, 68.7, 72.1),  # decimal values (numeric)
  height = c("Short", "Tall", "Medium", "Short", "Tall"), # character
  gender = c("Male", "Female", "Male", "Female", "Male")  # character
)

# Check structure
str(df)

# Convert age (numeric) into integer because age is whole number
df$age <- as.integer(df$age)
class(df$age)

# Convert height and gender into factor
df$height <- as.factor(df$height)
levels(df$height)  # Levels will be in alphabetical order: Medium, Short, Tall

# Relevel height according to desired hierarchy: Short < Medium < Tall
df$height <- factor(df$height, levels = c("Short", "Medium", "Tall"))
levels(df$height)

# Convert character/factor to numeric using factor() function
# Example # 0 = Short, 1 = Medium & 2 = Tall

df$height_num <- factor(df$height,
                        levels = c("Short", "Medium", "Tall"),
                        labels = c(0, 1, 2)) 

# Convert gender into factor but do not relevel because there’s no hierarchy
df$gender <- as.factor(df$gender)
levels(df$gender)

# Convert character/factor to numeric using ifelse
# Example: Assign 1 for Female, 0 for Male
df$gender_num <- ifelse(df$gender == "Female", 1, 0)
class(df$gender_num)  # numeric

# now convert it to factor using as.factor() or factor() if you want to relevel as well
df$gender_num <- as.factor(df$gender_num)
class(df$gender_num)  # factor
levels(df$gender_num)

# Add a logical column: is the person older than 30?
df$is_old <- df$age > 30
df

# Summary to review all conversions
str(df)

# Excercise 

# 1_Create a numeric vector with both positive and negative decimal values
# 0.3, -0.4, 0.5, 0.06, 0.34, -0.8

# Check the class of your numeric vector 

# 2_Convert a numeric value into an integer using
# Observe how R truncates the decimal part

# 3_Create a character variable with your name and check its class

# 5_check the length of a character string using `nchar()

# 6_Create a mixed vector of numbers and strings(alphabets/words)
#Use `class()` to verify how R interprets the data

# 7_create a factor variable with numeric vector (e.g, 0, 1, 0, 1, 0 )
# then Convert a numeric variable into a character vector (e.g, 0 = healthy, 1 = diseased)
# convert into factor and check its levels


# That's all about today ! 

# We learned the core data types in R
# Created a sample dataset
# Performed data type conversion
# Used factor releveling
# Used ifelse to create numeric columns from categorical values

#What’s Next? In the next session, you’ll understand:

# Data structure in R
# Data assessment
# Data manipulation
# Subsetting and filtering

# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/
