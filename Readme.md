---
title: "Readme"
author: "Olga Shik"
date: "2015-06-15"
output: html_document
---
# run.analysis.R script description
This Readme dscribes the prosecc of obtaining the tidy data file fom the raw data accessed from the Coursersa website, where it was sources from the website representing data collected from the accelerometers from the Samsung Galaxy S smartphone: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Dowloading and Reading Raw Data 
As the first step. the raw data is downloaded and unzipped into the directiry named "Project".
There are two data sets called TRAIN and TEST, each containing a set of 561 measurements (train/X_train.txt and test/X_test.txt), a set of actovity lables 1 to 6 (y_train.txt, y_test.txt ), and subject labels from 1 to 30. TEST database contains 2947 observations, TRAIN - 7352 observations. 
The data frames names were assignes as follows: 
actlabeltrain <- read.table("./Project/UCI HAR Dataset/train/y_train.txt") 

actlabeltest <- read.table("./Project/UCI HAR Dataset/test/y_test.txt") 

datasettrain <- read.table("./Project/UCI HAR Dataset/train/X_train.txt") %>%
    tbl_df()
datasettest <- read.table("./Project/UCI HAR Dataset/test/X_test.txt") %>%
    tbl_df()         
subjecttrain <- read.table("./Project/UCI HAR Dataset/train/subject_train.txt")

subjecttest <- read.table("./Project/UCI HAR Dataset/test/subject_test.txt") 
The data frame with the variables (measurements) names was created from file "features.txt" (561 rows):
varnames <- read.table("./Project/UCI HAR Dataset/features.txt")
Using cbind function to combine test and train data by columns, the activity and subject numbers where added to test and train data sets. 
##Step 1
Step 1 of tidying the data was to merge the training and the test sets (using rbind) to create one data set. Activity and subject names assiogned to respective columnes. Variables' names from varnames were assigned to measurements.         
##Step 2
Step 2. Extract only the measurements on the mean and standard deviation for each measurement.
Means and standard deviation columns where extracted according to the information in the features_info.txt file.
The resulting data set contains 68 columns, Activity and subject lablels and 66 mean and standard deviations of the measurmement variables.
##Step 3
Step 3. The script assigns descriptive activity names to each activity in the data set. It reads the activity description form file "activity_labels.txt" and the activity numbers in the activity column are replaced with the respective activity descriptions.
# Step 4. 
Appropriately labels the data set with descriptive variable names. 
For the sake of clarity, the extra punctuation is removed from the variable names. 
Each average measurement's name is a combination of several elements. Prefix "t"" denotes time and prexix "f" means Fast Fourier Transform (FFT) was applied. "Acc"" stands for the accelerometer and "Gyro"" for gyroscope. "Jerk"" in the variable name means the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. "Body" and "Gravity" mean the signal was separated into body and gravity acceleration signals. "Mag" in the end means denotes the magnitude of the signal. The signal was 3-axial, each direction denoted by X, Y, or Z.
# Step 5
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The data set is grouped by subject and activity columnes, and then by using the ddply function of plyr package and numcolwise(mean) argument, the average value of each measurement is calculated.
It is then written in to file "tidydata.txt".
The resulting data frame has 180 rows (30 Subjects x 6 Activities) for each Variable (Column with average measurement).
The data conform with the tidy data requirements:
* each variable is in one column
* each observation of that variable is in a different row
* includes variable names that makes sense.
File tidydata.txt contains the tidy data that can be read into R by:
read.table("./tidydata.txt", header = TRUE)