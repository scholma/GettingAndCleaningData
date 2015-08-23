## 1 Merges the training and the test sets to create one data set.

## First read x_train and x_test, then merge by rbind
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
x_merged <- rbind(x_train, x_test)

## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

## First read the features table, then find indices that match mean() or std() with grep,
## escaping brackets with fixed=TRUE and merging and sorting indices.
## Finally create subset of data
features <- read.table("./UCI HAR Dataset/features.txt")
index_mean <- grep("mean()", features[,2], fixed=TRUE)
index_std <- grep("std()", features[,2], fixed=TRUE)
index_total <- sort(c(index_mean, index_std))
x_merged_subset <- x_merged[,index_total]

## 3 Uses descriptive activity names to name the activities in the data set

## Combine train and test for activities
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_merged <- rbind(y_train, y_test)

## read activity labels and then merge with observations, preserving original order
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
y_merged_named <- merge(y_merged, activity_labels, sort = FALSE)
x_merged_subset$activity <- y_merged_named[,2]

## 4 Appropriately labels the data set with descriptive variable names. 
names(x_merged_subset) <- features$V2[index_total]

## 5 From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

## first read and merge subjects and add them as an extra column to the data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_merged <- rbind(subject_train, subject_test)
x_merged_subset <- cbind(x_merged_subset, subject_merged)

## we will use the dplyr package, which we might have to install first
install.packages("dplyr")
library(dplyr)

## then we create the tidy data with group_by and summarise
tidy_data <- x_merged_subset %>% group_by(subject, activity) %>% summarise_each(funs(mean))

## and write tidy data in txt 
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
