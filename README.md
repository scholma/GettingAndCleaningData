## Codebook

Original data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, a Human Activity Recognition database built from the recordings of 30 subjects (persons) performing 6 different kind of activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The tidy_data.txt summarises either mean (mean) or standard deviation (std) of in total 66 different type of measurements for the 30 subjects and 6 activities. The first two columns of the dataset describe:

* subject: integer numbered from 1 to 30
* activity: factor description of the activity, based on video's of the experiment

Remaining colums of the dataset describe the mean or standard deviation of one of the following measurement types:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

These measurements are described as follows in the Human Activity Recognition database:

* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
* These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


## Transformation Script: run_analysis.R
* the script transforms some of the files of the database into tiny_data.txt
* the script has been commented directly
* this readme contains only a summary of the script in the form of the comments from the script

### 1 Merges the training and the test sets to create one data set.
* first read x_train and x_test
* then merge by rbind

### 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
* first read the features table
* then find indices that match mean() or std() with grep, escaping brackets with fixed=TRUE and merging and sorting indices.
* finally create subset of data

### 3 Uses descriptive activity names to name the activities in the data set
* combine train and test for activities
* read activity labels and then merge with observations, preserving original order

### 4 Appropriately labels the data set with descriptive variable names. 

### 5 From the data set in step 4, creates a second, independent tidy data set 
* with the average of each variable for each activity and each subject.
* first read and merge subjects and add them as an extra column to the data
* we will use the dplyr package, which we might have to install first
 * then we create the tidy data with group_by and summarise
* and write tidy data in txt 

