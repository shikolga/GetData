---
title: "Codebook. Getting and Cleaning Data Course Project"
author: "Olga Shik"
date: "2015-06-15"
output:
  html_document:
    keep_md: yes
---

## Project Description
The objective of the project was to collect, work with, and clean a data set.

##Study design and data processing

###Collection of the raw data
Raw data was accessed from the Coursersa website, where it was sources from the website representing data collected from the accelerometers from the Samsung Galaxy S smartphone: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile

###Guide to create the tidy data file
1. Download the data
2. Create a combined data frame from all the data
3. Select only required variables
3. Assign meningfull activity names
4. Assign meaningful variable names
5. Summarize data by subject and activity.


###Cleaning of the data
The script attached run_analysis.R merges the raw data in one data frame, selects the mean and standard deviations of the measurements as described below and assigns meaningfull activity and variable names. Then the script summarises the data by calculating average value of the mean and standard deviations of the measurementsby subject and activity and stored the output as a .txt file which contains a tidy data frame.  The detailed description of the code can be found in Readme.md.

##Description of the variables in the tidydata.txt file
File tidydata.txt contains the data frame of tidy data that can be read into R by:
read.table("./tidydata.txt", header = TRUE)
 * The tidydata data frame contains 180 observations of 68 variables
 * The data represents the average of the mean and standard deviation of the normalized measurements from the accelerometers from the Samsung Galaxy S smartphone. The average value is calculated fort each subject and type of activity.
 * Variables present in the dataset include one character variable for activity, one interger variable for the subject engaged in this activity and numeric variables for the average measurements as described below. There where total of 6 types of activities, therefore, the data consists of 6 * 30 = 180 observatons.
Each average measurement's name is a combination of several elements. Prefix "t"" denotes time and prexix "f" means Fast Fourier Transform (FFT) was applied. "Acc"" stands for the accelerometer and "Gyro"" for gyroscope. "Jerk"" in the variable name means the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. "Body" and "Gravity" mean the signal was separated into body and gravity acceleration signals. "Mag" in the end means denotes the magnitude of the signal. The signal was 3-axial, each direction denoted by X, Y, or Z.
###"1" "activity"
character
Type of activity measured.
Levels: 
* "LAYING"             
* "SITTING"            
* "STANDING"          
* "WALKING"            
* "WALKING_DOWNSTAIRS"
* "WALKING_UPSTAIRS"  
###"2" "subject"
integer
Subject who performed the activity measured.
Levels: 1:30
###"3" "tBodyAccmeanX"
numeric 
Body acceleration signals. Average value. Measurement in the X direction.
###"4" "tBodyAccmeanY"
numeric
Body acceleration signals. Average value. Measurement in the Y direction.
###"5" "tBodyAccmeanZ"
numeric 
Body acceleration signals. Average value. Measurement in the Z direction.
###"6" "tGravityAccmeanX"
numeric
Gravity acceleration signals. Average value. Measurement in the X direction.
###"7" "tGravityAccmeanY"
numeric 
Gravity acceleration signals. Average value. Measurement in the Y direction.
###"8" "tGravityAccmeanZ"
numeric
Gravity acceleration signals. Average value. Measurement in the Z direction.
###"9" "tBodyAccJerkmeanX"
numeric 
Body linear acceleration derived in time. Average value. Measurement in the X direction.
###"10" "tBodyAccJerkmeanY"
numeric
Body linear acceleration derived in time. Average value. Measurement in the Y direction.
###"11" "tBodyAccJerkmeanZ
numeric
Body linear acceleration derived in time. Average value.... Measurement in the Z direction"
###"12" "tBodyGyromeanX"
numeric 
Gyroscope signals. Average value. Measurement in the X direction.
###"13" "tBodyGyromeanY"
numeric
Gyroscope signals. Average value.... Measurement in the Y direction.
###"14" "tBodyGyromeanZ"
numeric 
Gyroscope signals. Average value. Measurement in the Z direction.
###"15" "tBodyGyroJerkmeanX"
numeric 
Body angular velocity derived in time. Average value. Measurement in the X direction.
###"16" "tBodyGyroJerkmeanY"
numeric 
Body angular velocity derived in time. Average value. Measurement in the Y direction.
###"17" "tBodyGyroJerkmeanZ"
numeric 
Body angular velocity derived in time. Average value. Measurement in the Z direction.
###"18" "tBodyAccMagmean"
numeric
Body acceleration signals. Magnitude of the signal. Average value.
###"19" "tGravityAccMagmean" 
numeric
Gravity acceleration signals. Magnitude of the signal. Average value.
###"20" "tBodyAccJerkMagmean"
numeric 
Body linear acceleration derived in time. Magnitude of the signal. Average value.
###"21" "tBodyGyroMagmean"
numeric
Gyroscope signals. Magnitude of the signal. Average value.
###"22" "tBodyGyroJerkMagmean"
numeric 
Body angular velocity derived in time. Magnitude of the signal. Average value..."
###"23" "fBodyAccmeanX"
numeric
Fast Fourier Transform (FFT) applied. Body acceleration signals. Average value. Measurement in the X direction.
###"24" "fBodyAccmeanY"
numeric  
Fast Fourier Transform (FFT) applied. Body acceleration signals. Average value. Measurement in the Y direction.
###"25" "fBodyAccmeanZ"
numeric  
Fast Fourier Transform (FFT) applied. Body acceleration signals. Average value. Measurement in the Z direction.
###"26" "fBodyAccJerkmeanX"
numeric  
Fast Fourier Transform (FFT) applied. Body linear acceleration derived in time.. Average value.... Measurement in the X direction.
###"27" "fBodyAccJerkmeanY"
numeric  
Fast Fourier Transform (FFT) applied. Body linear acceleration derived in time. Average value. Measurement in the Y direction.
###"28" "fBodyAccJerkmeanZ"
numeric  
Fast Fourier Transform (FFT) applied. Body linear acceleration derived in time. Average value. Measurement in the Z direction.
###"29" "fBodyGyromeanX"
numeric  
Fast Fourier Transform (FFT) applied. Gyroscope signals. Average value. Measurement in the X direction.
###"30" "fBodyGyromeanY"
numeric  
Fast Fourier Transform (FFT) applied. Gyroscope signals. Average value. Measurement in the Y direction.
###"31" "fBodyGyromeanZ"
numeric  
Fast Fourier Transform (FFT) applied. Gyroscope signals. Average value. Measurement in the Z direction.
###"32" "fBodyAccMagmean"
numeric  
Fast Fourier Transform (FFT) applied. Body acceleration signals. Magnitude of the signal. Average value.
###"33" "fBodyBodyAccJerkMagmean"
numeric  
Fast Fourier Transform (FFT) applied. Body linear acceleration derived in time. Magnitude of the signal. Average value.
###"34" "fBodyBodyGyroMagmean"
numeric
Fast Fourier Transform (FFT) applied. Body Gyroscope signals. Magnitude of the signal. Average value.
###"35" "fBodyBodyGyroJerkMagmean"
numeric  
Fast Fourier Transform (FFT) applied. Body angular velocity derived in time. Magnitude of the signal. Average value.
###"36" "tBodyAccstdX"
numeric 
Body acceleration signals. Standard deviation. Measurement in the X direction.
###"37" "tBodyAccstdY"
numeric
Body acceleration signals. Standard deviation. Measurement in the Y direction.
###"38" "tBodyAccstdZ"
numeric 
Body acceleration signals. Standard deviation. Measurement in the Z direction.
###"39" "tGravityAccstdX"
numeric 
Gravity acceleration signals. Standard deviation. Measurement in the X direction.
###"40" "tGravityAccstdY"
numeric 
Gravity acceleration signals. Standard deviation. Measurement in the Y direction.
###"41" "tGravityAccstdZ" 
numeric 
Gravity acceleration signals. Standard deviation. Measurement in the Z direction.
###"42" "tBodyAccJerkstdX"
numeric 
Body linear acceleration derived in time. Standard deviation. Measurement in the X direction.
###"43" "tBodyAccJerkstdY"
numeric 
Body linear acceleration derived in time. Standard deviation. Measurement in the Y direction.
###"44" "tBodyAccJerkstdZ"
numeric 
Body linear acceleration derived in time. Standard deviation. Measurement in the Z direction.
###"45" "tBodyGyrostdX"
numeric 
Gyroscope signals. Standard deviation. Measurement in the X direction.
###"46" "tBodyGyrostdY"
numeric 
Gyroscope signals. Standard deviation. Measurement in the Y direction.
###"47" "tBodyGyrostdZ"
numeric 
Gyroscope signals. Standard deviation. Measurement in the Z direction.
###"48" "tBodyGyroJerkstdX"
numeric 
Body angular velocity derived in time. Standard deviation. Measurement in the X direction.
###"49" "tBodyGyroJerkstdY"
numeric 
Body angular velocity derived in time. Standard deviation. Measurement in the Y direction.
###"50" "tBodyGyroJerkstdZ"
numeric 
Body angular velocity derived in time. Standard deviation. Measurement in the Z direction.
###"51" "tBodyAccMagstd"
numeric 
Body acceleration signals. Magnitude of the signal. Standard deviation.
###"52" "tGravityAccMagstd"
numeric 
Gravity acceleration signals. Magnitude of the signal. Standard deviation.
###"53" "tBodyAccJerkMagstd"
numeric
Body linear acceleration derived in time. Magnitude of the signal. Standard deviation.
###"54" "tBodyGyroMagstd"
numeric
Gyroscope signals. Magnitude of the signal. Standard deviation.
###"55" "tBodyGyroJerkMagstd"
numeric 
Body angular velocity derived in time. Magnitude of the signal. Standard deviation.
###"56" "fBodyAccstdX"
numeric  
Fast Fourier Transform (FFT) applied. Body acceleration signals. Standard deviation. Measurement in the X direction.
###"57" "fBodyAccstdY"
numeric 
Fast Fourier Transform (FFT) applied. Body acceleration signals. Standard deviation. Measurement in the Y direction.
###"58" "fBodyAccstdZ"
numeric  
Fast Fourier Transform (FFT) applied. Body acceleration signals. Standard deviation. Measurement in the Z direction.
###"59" "fBodyAccJerkstdX"
numeric  Fast Fourier Transform (FFT) applied Body linear acceleration derived in time. Standard deviation.... Measurement in the X direction"
###"60" "fBodyAccJerkstdY"
numeric  
Fast Fourier Transform (FFT) applied. Body linear acceleration derived in time. Standard deviation. Measurement in the Y direction.
###"61" "fBodyAccJerkstdZ"
numeric  
Fast Fourier Transform (FFT) applied. Body linear acceleration derived in time. Standard deviation. Measurement in the Z direction.
###"62" "fBodyGyrostdX"
numeric 
Fast Fourier Transform (FFT) applied. Gyroscope signals. Standard deviation. Measurement in the X direction.
###"63" "fBodyGyrostdY"
numeric 
Fast Fourier Transform (FFT) applied. Gyroscope signals. Standard deviation. Measurement in the Y direction.
###"64" "fBodyGyrostdZ"
numeric 
Fast Fourier Transform (FFT) applied. Gyroscope signals. Standard deviation. Measurement in the Z direction.
###"65" "fBodyAccMagstd"
numeric 
Fast Fourier Transform (FFT) applied. Body acceleration signals. Magnitude of the signal. Standard deviation.
###"66" "fBodyBodyAccJerkMagstd"
numeric  
Fast Fourier Transform (FFT) applied.Body linear acceleration derived in time. Magnitude of the signal. Standard deviation.
###"67" "fBodyBodyGyroMagstd"
numeric  
Fast Fourier Transform (FFT) applied. Body Gyroscope signals. Magnitude of the signal. Standard deviation.
###"68" "fBodyBodyGyroJerkMagstd"
numeric  
Fast Fourier Transform (FFT) applied. Body angular velocity derived in time. Magnitude of the signal. Standard deviation.


##Sources
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

