library("dplyr")

#Wearable Data Cleaning

# 1) Fetching Data.
if(!dir.exists("./data")){
  dir.create("./data")
}

# Download zip containing all the data.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest= "./data/dataset.zip", mode = "wb")

# Decompress file.
in_file <- "./data/dataset.zip"
outDir <- "./data"
unzip(in_file, exdir = outDir)

# 2) Reading the features and activity files
features <- read.table("./data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Getting the mean and standard deviation features
features_mask <- grepl("*mean()*|*std()*", features[,2])
features_names <- features[features_mask, 2]
features_names <- gsub("mean","Mean",features_names)
features_names <- gsub("std","Std",features_names)
features_names <- gsub("[-]|[()]","",features_names)

rm("features")

# Load and merge test data.
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")[features_mask]
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

test_data <- cbind(subject_test,y_test,x_test)
rm("x_test","y_test","subject_test")

# Load and merge train data.
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")[features_mask]
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

train_data <- cbind(subject_train, y_train, x_train)
rm("x_train","y_train","subject_train")

# Merge train_data and test_data.
merged_data <- rbind(train_data, test_data)
rm("test_data","train_data")

# Get new data frame names.
new_names <- c("subject","activity", features_names)
colnames(merged_data) <- new_names

# Set descriptive activity names to name the activities in the data set.
merged_data$activity <- factor(merged_data$activity, levels = activity_labels[,1], labels = activity_labels[,2])
merged_data$subject <- as.factor(merged_data$subject)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
exported_data <- group_by(merged_data,subject, activity)
exported_data <- summarize_all(exported_data, mean)

#Export summarized data
write.table(exported_data, file="FeatureAvg_ActivitySubject.txt", row.names = FALSE)
rm(list=ls())