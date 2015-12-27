## Getting and Cleaning Data CodeBook

This code book describes the variables, the data, and the work performed to clean up the data.

###Data
The data for the project is available at : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The dataset includes the following files which are used in clean up:
UCI HAR Dataset/test/X_test.txt: Test set.  
UCI HAR Dataset/test/y_test.txt: Test labels.  
UCI HAR Dataset/test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
UCI HAR Dataset/train/X_train.txt: Training set.  
UCI HAR Dataset/train/y_train.txt: Training labels.  
UCI HAR Dataset/train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
UCI HAR Dataset/features.txt: List of all features.  
UCI HAR Dataset/activity_labels.txt: Links the class labels with their activity name.  

###Cleanup
This repository includes a script run_analysis.R which is used to clean the data.

Following steps are performed to clean up the data:  

1. Load dplyr package which will be used to clean the data
2. Load required data using read.table
3. Merge the x_test_data and the x_train_data to create one full data set using rbind
4. Label the data set with descriptive variable names using make.names
5. Extract only the measurements on the mean and standard deviation for each measurement
6. Merge test and train activity data using rbind
7. Use descriptive activity names to name the activities in the data set
8. Merge subject and activity data with fulldata using cbind and rbind
9. Name the subject and activity name columns in fulldata
10. Get the average of each variable for each activity and each subject.
11. Write the result data set to a txt file using write.table()

