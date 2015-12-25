# Load dplyr package
library(dplyr)

# Load all required data
x_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)  
subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)  
x_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)  
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)  
features_data <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)  
activity_labels_data <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Merge the x_test_data and the x_train_data to create one full data set
fulldata <- rbind(x_test_data,x_train_data)

# labels the data set with descriptive variable names
xdata_colnames <- make.names(features_data[,2])
colnames(fulldata) <- xdata_colnames

# Extract only the measurements on the mean and standard deviation for each measurement
colnumber_mean_std <- features_data[grep("-mean\\()|-std\\()", features_data$V2), 1]
fulldata <- fulldata[,colnumber_mean_std]

# Merge test and train activity data
activity_data <- rbind(y_test_data,y_train_data)

# Use descriptive activity names to name the activities in the data set
activity_data$V1 <- activity_labels_data[match(activity_data$V1, activity_labels_data$V1),2]

# Merge subject and activity data with fulldata
fulldata <- cbind(rbind(subject_test_data,subject_train_data),activity_data,fulldata)

# Name the subject and activity name columns in fulldata
names(fulldata)[1] <- "subject"
names(fulldata)[2] <- "activity_name"

# Get the average of each variable for each activity and each subject.
resultdf <- fulldata %>% group_by(subject, activity_name) %>% summarise_each(funs(mean), -c(subject, activity_name))

# Write the result data set to a txt file using write.table()
write.table(resultdf,file="tidydataset.txt",sep="\t", row.names = FALSE)
