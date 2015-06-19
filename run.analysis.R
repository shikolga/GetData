# download and unzip database
if (!file.exists("Project")) {
    dir.create("Project")
}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./Project/dataset.zip")
dateaccessed <- Sys.Date()
unzip("./Project/dataset.zip", exdir = "./Project")

# read activity, subject and measurements in separate tables. 
library(plyr)
library(dplyr)
actlabeltrain <- read.table("./Project/UCI HAR Dataset/train/y_train.txt") 
actlabeltest <- read.table("./Project/UCI HAR Dataset/test/y_test.txt") 
datasettrain <- read.table("./Project/UCI HAR Dataset/train/X_train.txt") %>%
    tbl_df()
datasettest <- read.table("./Project/UCI HAR Dataset/test/X_test.txt") %>%
    tbl_df()         
subjecttrain <- read.table("./Project/UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./Project/UCI HAR Dataset/test/subject_test.txt") 

# create variable names from file "features.txt" to the measurement data 
varnames <- read.table("./Project/UCI HAR Dataset/features.txt") 

# combine test and train data by columns
test <- cbind(actlabeltest, subjecttest, datasettest) 

train <- cbind(actlabeltrain, subjecttrain, datasettrain) 
# Step 1. Merge the training and the test sets to create one data set.Assign activity and subject names to respective columnes.Assign variables' names.         
combdataraw <-rbind(test, train) 
colnames(combdataraw) <- c("activity", "subject", as.character(varnames$V2))

# Step 2. Extract only the measurements on the mean and standard deviation for each measurement.
combdataraw <- combdataraw[, !duplicated(colnames(combdataraw))]
combdata <- select(combdataraw, activity, subject, contains("mean()"), contains("std()"))

# Step 3. Assigns descriptive activity names to name the activities in the data set
activity_names <- read.table("./Project/UCI HAR Dataset/activity_labels.txt")
activity_names[, "V2"]
for (i in 1:6) {
    combdata[combdata$activity==i, 1] <- as.character(activity_names[activity_names$V1==i, "V2"])
}
# Step 4. Appropriately labels the data set with descriptive variable names. 
colnames(combdata) <- gsub("[[:punct:]]", "", make.names(colnames(combdata)),  ignore.case = TRUE)
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- ddply(combdata, c("activity", "subject"), numcolwise(mean))
write.table(tidy_data, file = "tidydata.txt", row.name=FALSE)
