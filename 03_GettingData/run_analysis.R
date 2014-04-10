# Getting and Cleaning Data Project: 4/9/14
# This script is written for Windows.  Minor changes may be necessary for Linux or Mac.
# Original data source:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Additional information:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Begin by downloading the file if necessary (61MB)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filePath <- "./data/getdata-projectfiles-UCI HAR Dataset.zip"

if (!file.exists("data")) {
  dir.create("data")
}

if (!file.exists(filePath)) {
  download.file(fileUrl, destfile = filePath)
  dateDownloaded <- date()
  dateDownloaded
  
  # And unzip it
  unzip(filePath, exdir="./data")
}

# Read in training X, y, and subject data
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read in test X, y, and subject data
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Merge training and test data
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Cleanup original test and train data
rm(list=c("X_train", "y_train", "subject_train", "X_test", "y_test", "subject_test"))

# Convert activity (y) label numbers to a factor based on activity_labels.txt
# And name column activity
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors=FALSE)
y_factor <- NULL
y_factor$activity <- factor(y$V1, labels=activity_labels[,2])

# Rename subject column to subject
colnames(subject) <- "subject"
# Transform subject to a factor because it should NOT be interpreted as a number
subject$subject <- factor(subject$subject)

# See feature names in features.txt
# Note some of these characters will be illegal in R.  Think about how to clean.
# (remember how this caused problems in another class!)

# Read in feature names
features <- read.table("./data/UCI HAR Dataset/features.txt")
# Take a look at what R will do with names by default
#make.names(features[,2])
# Looks like main problems are: (),-
# See week 4 lectures for variable name guidelines:
# All lower case, descriptive, not duplicated, not have underscores or dots or white space
# Based on guidelines, remove (), but I think convert - and , to _ to break up variable 
# name components in a meaningful way (also simplifies grepping for mean/std below).
# I think leave case alone since carefully selected and aids readability.
features <- sapply(features[,2], function(x) gsub("[()]", "", x))
features <- sapply(features, function(x) gsub("[-,]", "_", x))

colnames(X) <- features

# Extract only the measurements on the mean and standard deviation for each measurement. 
# So only use X columns containing _mean_ or _std_ (note other uses of mean).
# Week 4 discusses regex.
X_subset <- X[,grep("_mean_|_std_", features, value=TRUE)]

# Not sure what order I prefer
smartphoneTidy1 <- cbind(subject, y_factor, X_subset)
write.csv(smartphoneTidy1, "data/smartphoneTidy1.csv") # 67MB for full dataset and slow

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject.
library(plyr)
summarize <- function (x) {
  result <- colMeans(x[,-c(1,2)])
}
smartphoneTidy2 <- ddply(smartphoneTidy1, .(subject, activity), summarize)
write.csv(smartphoneTidy2, "data/smartphoneTidy2.csv")

