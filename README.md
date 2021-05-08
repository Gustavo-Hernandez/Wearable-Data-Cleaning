
# Wearable-Data-Cleaning
This repository contains the files for the Final Project of the Getting and Cleaning Data certification, imparted by the Johns Hopkins University at Coursera

# About this repository.
The objective of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

# Data source
The data source of this project can be obtained [here](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip)

# Contents

## [run_analysis.R](https://github.com/Gustavo-Hernandez/Wearable-Data-Cleaning/blob/master/run_analysis.R "run_analysis.R")
R Script with the following functionlities:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## [CodeBook.md](https://github.com/Gustavo-Hernandez/Wearable-Data-Cleaning/blob/master/CodeBook.md "CodeBook.md")
The purpose of this file is to give an explanation of the process followed to generate the requested tidy data set, the information about the structures generated and key lines of code are also detailed. Describes the variables, the data, and the transformations performed to clean up the data.

## [FeatureAvg_ActivitySubject.txt](https://github.com/Gustavo-Hernandez/Wearable-Data-Cleaning/blob/master/FeatureAvg_ActivitySubject.txt "FeatureAvg_ActivitySubject.txt")
Representation of an independent tidy data set with the average of each variable for each activity and each subject.
