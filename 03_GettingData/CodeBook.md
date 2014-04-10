Code Book
=========

A code book that describes the variables, the data, and any transformations or work performed to clean up the data.

Additional information about the original features is available in the files features.txt and features_info.txt in the original dataset and at  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Overview of the Data
--------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Transformations
---------------

Created train and test data sets as a combination of the three files provided for each:  
X/features, y/activity (the dependent variable), and subject.

The original train and test data sets were merged into a single data set as specified in the instructions.

The subject variable was transformed from an integer to a factor because it is categorical and should NOT be treated as a number (e.g. in regression).

The activity variable was transformed from an integer to a factor using the names in activity_labels.txt:  

1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

Variable names were transformed to be legal (in R), descriptive and consistent.  This included:  
- Naming the subject variable "subject"
- Naming the activity variable "activity"
- Modifying the original feature names to be compatible with R:
    - Remove characters '(' and ')'  
    - Change characters '-' and ',' to '_'
    
Case was retained and '_' used to retain the descriptiveness and readability of the original feature names.

Variables
---------

subject - Factor from 1 to 30 indicating the subject (person)  
activity - Factor with one of six values indicating the activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
activity is the dependent variable (e.g. predicting this is the goal).

The remaining variables are a subset of the original features (mean() and std() in features_info.txt below) averaged over each combination of subject and activity.  Each of them is numerical.  They are named as follows (see key below for further details).

tBodyAcc_mean_X  
tBodyAcc_mean_Y  
tBodyAcc_mean_Z  
tBodyAcc_std_X  
tBodyAcc_std_Y  
tBodyAcc_std_Z  
tGravityAcc_mean_X  
tGravityAcc_mean_Y  
tGravityAcc_mean_Z  
tGravityAcc_std_X  
tGravityAcc_std_Y  
tGravityAcc_std_Z  
tBodyAccJerk_mean_X  
tBodyAccJerk_mean_Y  
tBodyAccJerk_mean_Z  
tBodyAccJerk_std_X  
tBodyAccJerk_std_Y  
tBodyAccJerk_std_Z  
tBodyGyro_mean_X  
tBodyGyro_mean_Y  
tBodyGyro_mean_Z  
tBodyGyro_std_X  
tBodyGyro_std_Y  
tBodyGyro_std_Z  
tBodyGyroJerk_mean_X  
tBodyGyroJerk_mean_Y  
tBodyGyroJerk_mean_Z  
tBodyGyroJerk_std_X  
tBodyGyroJerk_std_Y  
tBodyGyroJerk_std_Z  
fBodyAcc_mean_X  
fBodyAcc_mean_Y  
fBodyAcc_mean_Z  
fBodyAcc_std_X  
fBodyAcc_std_Y  
fBodyAcc_std_Z  
fBodyAccJerk_mean_X  
fBodyAccJerk_mean_Y  
fBodyAccJerk_mean_Z  
fBodyAccJerk_std_X  
fBodyAccJerk_std_Y  
fBodyAccJerk_std_Z  
fBodyGyro_mean_X  
fBodyGyro_mean_Y  
fBodyGyro_mean_Z  
fBodyGyro_std_X  
fBodyGyro_std_Y  
fBodyGyro_std_Z  
  
Additional Feature Information
------------------------------

From features_info.txt in the original dataset.

Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector (in the original dataset) is available in 'features.txt'

