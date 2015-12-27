## Getting and Cleaning Data

This repository includes a script run_analysis.R which is used to clean the data.

The data for the project is available at : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script uses the data from following files in the data set:
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/y_train.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/features.txt
UCI HAR Dataset/activity_labels.txt

The script performs following tasks:
1.  Load dplyr package which will be used to clean the data
2.  Load required data using read.table
3.  Merge the x_test_data and the x_train_data to create one full data set using rbind
4.  Label the data set with descriptive variable names using make.names
5.  Extract only the measurements on the mean and standard deviation for each measurement
6.  Merge test and train activity data using rbind
7.  Use descriptive activity names to name the activities in the data set
8.  Merge subject and activity data with fulldata using cbind and rbind
9.  Name the subject and activity name columns in fulldata
10. Get the average of each variable for each activity and each subject.
11. Write the result data set to a txt file using write.table()

