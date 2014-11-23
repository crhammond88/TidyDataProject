TidyDataProject
===============

Assignment from Getting and Cleaning Data (John Hopkins University and Coursera)

This project uses wearable device data found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data set was obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Run the analysis
The run_analysis.R script accomplishes the following five goals:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To execute the code, download and extract the dataset into the same folder as run_analysis.R.

## Dependencies
The "data.table" package is required to use run_analysis.R.
Use install.packages("data.table") if you do not have it already.

## CodeBook
Please see CodeBook.md for more information about the data set.
