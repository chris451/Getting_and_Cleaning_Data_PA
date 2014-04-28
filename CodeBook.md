## Codebook

# Variables:

* There are 30 subjects listed 1-30 in the tidy data.
* There are 6 activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying
* For each subject and activities the  mean of the following variables is recorded:
	- tBodyAcc-mean()-X
	- tBodyAcc-mean()-Y
	- tBodyAcc-mean()-Z
	- tBodyAcc-std()-X
	- tBodyAcc-std()-Y
	- tBodyAcc-std()-Z
	- tGravityAcc-mean()-X
	- tGravityAcc-mean()-Y
	- tGravityAcc-mean()-Z
	- tGravityAcc-std()-X
	- tGravityAcc-std()-Y
	- tGravityAcc-std()-Z
	- tBodyAccJerk-mean()-X
	- tBodyAccJerk-mean()-Y
	- tBodyAccJerk-mean()-Z
	- tBodyAccJerk-std()-X
	- tBodyAccJerk-std()-Y
	- tBodyAccJerk-std()-Z
	- tBodyGyro-mean()-X
	- tBodyGyro-mean()-Y
	- tBodyGyro-mean()-Z
	- tBodyGyro-std()-X
	- tBodyGyro-std()-Y
	- tBodyGyro-std()-Z
	- tBodyGyroJerk-mean()-X
	- tBodyGyroJerk-mean()-Y
	- tBodyGyroJerk-mean()-Z
	- tBodyGyroJerk-std()-X
	- tBodyGyroJerk-std()-Y
	- tBodyGyroJerk-std()-Z
	- tBodyAccMag-mean()
	- tBodyAccMag-std()
	- tGravityAccMag-mean()
	- tGravityAccMag-std()



# Data:
* The data in this tidy data set is the mean of these variables (see above) for all 30 subject for all activities. T

* Here is a brief decription of the raw data: "the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz." (from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



# Transformations to obtain the tidy data:
* The following transformations have been done (see R script):
    - Merging of the training and the test sets to create one data set.
    - Extraction of the measurements on the mean and standard deviation for each measurement. 
    - Activities have been renamed with their description (instead of a label)
    - Variables have been renamed with their descriptions
    - Calculation of the average for each variable for each activity and each subject (and save it in csv & txt file). 
