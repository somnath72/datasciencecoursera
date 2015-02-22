Getting and Cleaning Data Course Project CodeBook
=================================================

The site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:   


Merges the training [X_train.txt, y_train.txt and subject_train.txt] and the test [X_test.txt, y_test.txt and subject_test.txt] sets to create one data set.
Read the features.txt and activity_labels.txt files
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
