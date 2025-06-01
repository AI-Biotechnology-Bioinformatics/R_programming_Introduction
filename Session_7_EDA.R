# ===================================================================
#             AI and Biotechnology / Bioinformatics        
# ===================================================================
# -------------------------------------------------------------------
#                    R CRASH COURSE (2025)
# -------------------------------------------------------------------
#               Session 7: Data Assessment & Manipulation
# ===================================================================

# -------------------------------
#### Handling Missing Values ####
# -------------------------------

# Simulate dataset with missing values
set.seed(123)
missing_data <- data.frame(
  PatientID = 1:10,
  GeneA = c(2.5, NA, 3.0, 2.7, NA, 2.9, 3.1, NA, 2.6, 2.8),
  GeneB = c(NA, 1.1, 1.2, NA, 1.0, 1.3, 1.1, 1.2, 1.0, NA)
)

# Check for missing values in the entire dataset
is.na(missing_data)  # Returns TRUE for missing cells

# Count total number of missing values
sum(is.na(missing_data))  # Total number of NA values

# Count missing values in each column
colSums(is.na(missing_data))

# Get names of columns that contain at least one NA
names(missing_data)[colSums(is.na(missing_data)) > 0]

# Count missing values per row
rowSums(is.na(missing_data))

# Find rows that have missing values
which(rowSums(is.na(missing_data)) > 0)

# Display rows with missing values
missing_data[!complete.cases(missing_data), ]

# Remove rows with any missing values
clean_data1 <- na.omit(missing_data)

# Remove columns with any missing values
clean_data2 <- missing_data[, colSums(is.na(missing_data)) == 0]

# Replace all missing values in the dataset with 0
replaced_data <- missing_data
replaced_data[is.na(replaced_data)] <- 0

# Compare dimensions (rows, columns) of original and cleaned data
dim(missing_data)
dim(clean_data1)


# ----------------------------------------------------------
#### Exploratory Data Analysis (EDA) with DataExplorer ####
# ----------------------------------------------------------

# Load the DataExplorer package for automated EDA
install.packages("DataExplorer") # install it if not already installed
library(DataExplorer) # activate package 

# Load a dataset 
lung_cancer <- read.csv(file.choose())

# Describe basic information for data
# total number of columns, rows, miising values etc
introduce(lung_cancer)
?introduce

# Visualize structure and content
plot_intro(lung_cancer)      # Overview of variable types
plot_bar(lung_cancer)        # Bar plots for categorical variables
plot_missing(lung_cancer)    # Visualize missing data patterns
plot_histogram(lung_cancer)  # Distribution of numeric variables
plot_correlation(lung_cancer)# Correlation between numeric variables

# Create a full automatic HTML report
create_report(lung_cancer)


# -------------------------------
#### For Loop Basics ####
# -------------------------------

# Basic loop: print numbers 1 to 5
for (i in 1:5) {
  print(i)
}

# Print a list of genes
genes <- list("BRCA1", "TP53", "EGFR", "ADCY5", "ABL1")
for (x in genes) {
  print(x)
}


# ------------------------------------------------------------
# Loop to calculate mean gene expression value
# ------------------------------------------------------------

# Simulate gene expression data (10 samples × 5 genes)
set.seed(42)
expression_matrix <- matrix(rnorm(50, mean = 5, sd = 2),
                            nrow = 10)
colnames(expression_matrix) <- c("BRCA1", "TP53", "EGFR", "ADCY5", "ABL1")

# Initialize an empty list to store mean expression per gene
gene_means <- list()

# Loop through each gene to compute mean expression
for (gene in colnames(expression_matrix)) {
  gene_means[[gene]] <- mean(expression_matrix[, gene])
}

# Print the results
print(gene_means)


# ------------------------------------------------------------------
# Create Summary Table (Mean and SD for Each Gene)
# ------------------------------------------------------------------

# Initialize an empty summary data frame
summary_df <- data.frame(Gene = character(), 
                         Mean = numeric(), 
                         SD = numeric(), 
                         stringsAsFactors = FALSE)

# Loop through each gene to calculate mean and standard deviation
for (gene in colnames(expression_matrix)) {
  expr <- expression_matrix[, gene]
  summary_df <- rbind(summary_df, data.frame(
    Gene = gene,
    Mean = mean(expr),
    SD = sd(expr)
  ))
}

# Display the final summary
print(summary_df)


# --------------
#### Tasks ####
# --------------

# Create a loop that calculates both mean and median for each gene
# Replace for loop with lapply() or purrr::map() for calculating gene means
# Use ggplot2 to visualize mean gene expression from the summary table


# follow for more:
# github: https://github.com/AI-Biotechnology-Bioinformatics
# linkedin: https://www.linkedin.com/company/ai-and-biotechnology-bioinformatics/
