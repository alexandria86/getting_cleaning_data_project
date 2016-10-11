## To begin working with a dataset, download a zipfile to your working directory using the following link: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##STEP 1
##Combine test and train data sets

##extract test set
testset<-read.table("./dataset/UCI HAR Dataset/test/X_test.txt")
##extract train set  
trainset<-read.table("./dataset/UCI HAR Dataset/train/X_train.txt")
x_set<- rbind(testset, trainset)



##extract y data
ytest<-read.table("./dataset/UCI HAR Dataset/test/y_test.txt")
ytrain<-read.table("./dataset/UCI HAR Dataset/train/y_train.txt")
##combine y data
y_set<-rbind(ytest, ytrain)

##read subject data
subject_test<-read.table("./dataset/UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./dataset/UCI HAR Dataset/train/subject_train.txt")
##combine subject data
subject_data<-rbind(subject_test, subject_train)
names(subject_data) <- "subject_id"

## Step 2
## Extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./dataset/UCI HAR Dataset/features.txt")

# get only columns with mean() or std() in their names
selected_features <- grep(".*[Mm]ean.*|.*[Ss]td.*", features[,2])
x_set<-x_set[selected_features]
# correct the column names
names(x_set) <- features[selected_features, 2]


## Step 3
## Uses descriptive activity names to name the activities in the data set
library(dplyr)
activity_labels<-read.table("./dataset/UCI HAR Dataset/activity_labels.txt")
y_set<-full_join( y_set, activity_labels, by="V1")
names(y_set)<-c("activity_id", "activity")

##Step 4
##Appropriately label the data set with descriptive variable names.


## combine x, y, and subject sets into one
all<-cbind(y_set, subject_data, x_set)
##names(all)<-c("subject_id", "activity_id", "activity")
##subset the dataset without having the activity_id for futher data analysis

##Step 5
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(reshape2)

allMelt <- melt(all, id = c("subject_id", "activity"))
allMean <- dcast(allMelt, subject_id + activity~ variable, mean)
write.table(allMean, "tidy_data.txt", row.names = FALSE, quote = FALSE)