# ===================================================================
#                  AI and Biotechnology/Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#           Session 2: R Syntax (variables, Comments & keywords)          
# -------------------------------------------------------------------
# ===================================================================

# Syntax are the predefined structure and rules of any programming language.
# It shows us how to right codes right way 
# Helps to write clear and error free codes &
# easy to debug and fix errors

# Syntax in R
# R have three basic building blocks:
# 1.Variables 
# 2.Comments &
# 3.Keywords 


#### Variables ####
# stores values in R just like a labeled test holds sample in a lab

# Storing a patient’s glucose level in a variable
glucose_level <- 98.6	

# Explanation:
# glucose_level is the variable name
# <- is an assignment operator that stores the value 98.6 into variable
# 98.6 is now saved in glucose_level

# To check what’s inside a variable, type its name and run it
glucose_level

# or use print () function
print(glucose_level)

# Important Notes:
# Overwriting Variables: Assigning a new value replaces the old one
glucose_level <- 45.6     # old value (98.6) is replaced

# Case Sensitivity: variable names are case sensitive 
Gluocose_level <- 98.6 
# different from glucose_level even have same values

#### Comment #### 
# help you explain your code
# This is only for your own understanding
# R doesn’t consider it as a code
# It starts with # and anything after that is ignored by R when the code runs
# If your code begin with # R treats the entire line as a comment and skips it completely

# Correct way to write comment
age <- 56        # assigning a value to a variable

# wrong way to write comment
# assigning a value to a variable age <- 56

# Best practice: always add comment before a code or at the end for clarity”

#### Keywords ####
# reserved words that perform specific function in R.
# You cannot use the as variable name
# Common keywords are:
# if, else - Conditional Statements
# function - Define reusable code block
# return   - Returns a value from a function

#### If & Else in R ####
gene_expression <- 30 

# Using only if
# The if statement checks if expression_level is greater than 25.
# If true, it prints: "Gene is highly expressed".
# If it’s FALSE, nothing happens.
# Run the code and check output in console

if (gene_expression > 25) {
  print ("gene is highly expressed")
}   

# Using if...else 
# This checks both condition. 
# The if statement checks if expression_level is greater than 25.
# If true, it prints: "Gene is highly expressed".
# Otherwise, the else block executes. It prints “Gene expression is low”
# 1.Run these code below in to check the output 
# 2.Try with different bmi values

bmi <- 30

if(bmi > 25){
  print("Person is obese") 
} else {
  print("Person is healthy")
}else 

# Using if...else if...else
# This checks multiple conditions
# If bmi is less than 18.5 prints (underweight)
# If it’s between 18.5 and 24.9 (normal)
# If it’s more than 24.9 (overweight)
# Try it with your own bmi value

bmi <- 17 

if(bmi < 18.5) {
  print("underweight")
} else if(bmi >- 18.5 & bmi <= 24.9) {
  print("normal weight")
} else {
  print("overweight")
}

# Try It Yourself: 
# 1.	Check Cholesterol level (using if) 
#Write an If statement to check cholesterol level is greater than 240, if it is print “High Cholesterol”

cholesterol <- 230

# ----------------------------------------------------------------------------------------------------------------

# 2.	Blood Pressure Status (using if...else)
# Write an if…else statement to check if blood pressure is normal.
# If it’s less than 120, print: “Blood Pressure is normal”
# Otherwise print: “Blood Pressure is high”

Systolic_bp <- 130

# ----------------------------------------------------------------------------------------------------------------

# 3.	White Blood Cell Count (using if…else, if…else condition)
#Write if…else, if…else statement to check WBC count. 
#If wbc_count is lower than 4000, print: “Leukopenia-low WBC count”
# If wbc_count in between 4000 & 11000, print: “WBC count is normal”
# If wbc_count is greater than 11000 print: “Leukocytosis-High WBC count”

wbc_count <- 3000 

# ----------------------------------------------------------------------------------------------------------------


# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/

