library(reshape2)


#############################################################################################
# 1.Merges the training and the test sets to create one data set.
#############################################################################################
# read train data:
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")

# combine X & y
train <- cbind (X_train,y_train) 


# read test data:
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")

# combine X & y
test <- cbind (X_test,y_test) 

# merge trainind and test to create one data set:
data_set <- rbind(train, test)


#############################################################################################
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
#############################################################################################
# read the features (i.e. names of column)
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
myfeatures <- c(as.character(features[,2]),"Activity labels") # add the activity label for y_test and y_train

colnames(data_set) <- myfeatures

toMatch <- c(".*mean\\(\\).*$", ".*std\\(\\).*$") # comment: here we need $ sign to search for exact string
colnames_mean_dev <- grep(paste(toMatch,collapse="|"), colnames(data_set), value=TRUE)

data_set_sub <- data_set[,colnames_mean_dev]


#############################################################################################
# 3.Uses descriptive activity names to name the activities in the data set
# &
# 4.Appropriately labels the data set with descriptive activity names. 
#############################################################################################
activity <- rbind(y_train, y_test)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
names(activity ) <- "activity" 

data_set_sub <- cbind(data_set_sub,activity); # add column with activity number
data_set_sub$activity <- factor(data_set_sub$activity, labels=activity_labels[,2])# replace activity number by activity names



#############################################################################################
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#############################################################################################

# add column with subject label, could have been done before but subject wasn't needed up to now
subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"
data_set_sub <- cbind(data_set_sub,subject); # add column with subject label



mdata_set_sub <- melt(data_set_sub, id.vars=c("activity","subject"))
tidy_data <- dcast(mdata_set_sub, subject + activity ~ variable, mean)


# write table for submission:
write.table(tidy_data,"tidy_data.txt")
write.csv(tidy_data,"tidy_data.csv")
