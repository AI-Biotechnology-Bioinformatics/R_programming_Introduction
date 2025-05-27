# ===================================================================
#             AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#               Session 6: Data Structures in R  
# ===================================================================

#### Data Structures ####

## Vectors: sequence of elements of same data type
## It can be created using 'c()' function

# Numeric vector
numeric_vector <- c(1, 2, 3, 4, 5)
print(numeric_vector)

# Character vector
character_vector <- c("oxygen", "nitrogen", "hydrogen")
print(character_vector)

#### Lists: unlike vectors list contains elements of various data types 

list_1 <- 1:3 #(seq from 1 t0 5)
#1,5 ( 1 & 5)
print(list_1)

list_2 <- letters[1:10]
print(list_2)

list_3 <- c("cancer", "normal", "normal", "cancer", "normal")
print(list_3)
class(list_3)

combined_all <- list(list_1, list_2, list_3) ### nested list
print(combined_all)
class(combined_all)
str(combined_all)

data_1 <- combined_all[[3]]
print(data_1)

# since combined_all contains a combination of all data types: numeric character and factors etc
# character data type will get dominance and complete data set will be character

data_2 <- unlist(combined_all) 
print(data_2)
class(data_2)

# Matrix: two dimensional collection of elements of the same datatype 
# You can consider it as a table with different  rows and columns

matrix_1 <- matrix(c(1:9), nrow = 3, ncol = 3) # asign values column by column
print(matrix_1)

matrix_2 <- matrix(c(1:9), nrow = 3, ncol = 3, byrow = TRUE)
print(matrix_2)

matrix_3 <- matrix(c(1:9), nrow = 3, ncol = 3, byrow = FALSE)
print(matrix_3)
###### Create data with row and column name
matrix_4 <- matrix(c(1:9), nrow = 3, ncol = 3, byrow = TRUE,
                   dimnames = list(c("row1", "row2", "row3"),
                                   c("column_1", "column_2", "column_3")))

print(matrix_4)

matrix_3 <- matrix(c(1:9), nrow = 3, ncol = 3, byrow = FALSE,
                   dimnames = list(c("row1", "row2", "row3"),
                                   c("C1", "C.2", "C.3")))
print(matrix_3)

# Data frame also two-dimensional data structure with different data types
# table as matrix but contain different types data in rows and columns  

### create dataset for 10 participants(sample_ID S1 to S10), with different variables
# like Disease Status, Age, Weight, Height Gender, BMI, Glucose_level, Cholestrol_level

data <- data.frame(
  sampl_id = c("S1", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "S10"),
  Disease_Status = c("normal", "cancer", "normal","cancer", "cancer", "normal","normal","cancer", "normal", "normal"),
  Age = c(56, 66, 73, 80, 65, 45, 55, 67, 70, 85),
  Weight = c(81,85, 90, 75, 81.5,85.9, 90, 75.8, 65, 55),
  Height = c(6, 5.3, 6.2, 5.4, 6, 5.3, 6.2, 5.4, 6, 5.3),
  Gender = c("male", "female", "male", "female","female", "male", "female", "male", "female", "male"),
  BMI = c(25, 27, 30, 18, 28, 22, 27, 30, 18, 28),
  Glucose_level = c(70, 120, 150, 110, 200, 115, 107, 108, 100, 90),
  Cholestrol_level = c(150, 100, 200, 250, 120, 185,  100, 200, 250, 120)
)
str(data)

# Assessment of data frame is very important step for data manipulation and data analysis

# data Assessment 
summary(data)       # Provides statistical summary of numeric variables
str(data)           # Provides the structure of the dataset
dim(data)           # number of rows & columns of dataset
nrow(data)          # number of rows
ncol(data)          # number of columns
names(data)         # Lists variables/column in the dataset
colnames(data)      # display column names
rownames(data)      # display row names
head(data)          # First 6 rows of dataset
head(data, n=3)     # First 3 rows of dataset
head(data, n= -2)   # All rows but the last 2
tail(data)          # Last 6 rows
tail(data, n=3)     # Last 3 rows
tail(data, n= -1)   # All rows except the first 

# data[#rows, column]
data[1:3,]          # first 3 rows and all columns
data[c(1:3), 5]     # first 3 rows of 5 columns only 
data[1:5,1:2]       # First 5 rows of data of the first 2 columns/variables
data[c(1, 3, 6),]   #row 1. 3. & 4 of all columns
data[c(1, 3, 6),c(1, 4, 7)] #row 1. 3. & columns 1, 4, 7 only


###### Select/eliminate specific row or column
data$sampl_id<- NULL           # remove specific column using $ function
data_3 <- data[,-1]            # remove 1st column
data_4  <- data[, -c(1, 2)]    # remove 1st & 2nd column
data_4  <- data[-c(1, 2),]     # remove 1st & 2nd rows

# excercise
# load different R datasets and assess them
# check datatypes of each variable
# check dimension of data set
# run quick statistical summary


# That's it for today!

#  We learned the different data structures in R\
#  Performed data assessment

# In the next session, you’ll learn:
  
# data assessment with base R and  DataExplorer package 
# data manipulation
# Sub-setting and filtering
# Basic 

# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/
