Getting and Cleaning Data Project
---------------------------------

This directory contains scripts and data for working with the Samsung smartphone data at  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data is from  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The work is done by the R script called run_analysis.R that does the following:   
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

To run run_analysis.R set your working directory to the directory containing it and source the script.  It downloads and unpacks the source data in the data directory and creates two tidy data sets in the data directory:  smartphoneTidy1.csv and smartphoneTidy2.csv

The second of these, data/smartphoneTidy2.csv, is submitted for the project.

CodeBook.md contains a description of the variables in smartphoneTidy2.csv
