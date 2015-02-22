Getting and Cleaning Data Course Project
========================================
This file describes how "run_analysis.R" script works

1 First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
2 Make sure the data folder (UCI HAR Dataset - extracted zip file) and the run_analysis.R script are both in the current working directory.
3 Second, use source("run_analysis.R") command in RStudio. 
4 Third, you will find two output files are generated in the current working directory:
  - merged_data.txt: it contains a data frame called clensedData
  - data_with_means.txt: it contains a data frame called finalResult
5 Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file.
