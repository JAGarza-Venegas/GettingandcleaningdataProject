# Course 3 Project.

rm(list = ls())
library(dplyr)

# Step 1: Read data and important information about it.
features <- read.table(".\\UCI HAR Dataset\\features.txt")
# View(features)
train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", col.names = features$V2)
train_labels <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", col.names = features$V2)
test_labels <-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")

# Step 2: Merge both datasets and construct the activity column using the activities labels.
completedata <- rbind(train,test)
Activitieslabels <- rbind(train_labels, test_labels)

### This completes the task marked as 1 in Coursera Assignment. ###

# Step 3: Subset the data by extracting only the measurements on the mean and standard deviation for each measurement.
subsetdata <- select(completedata, grep("mean[.*]|std[.*]", names(completedata)))

### This completes the task marked as 2 in Coursera Assignment. ###

# Step 4: Change the activity label to some activity name, using the correspondence
# 1 - walking, 2 - walkingupstairs, 3 walkingdownstairs, 4 - sitting, 5 - standing, 6 - laying
numbercode <- 1:6
activitylabel <- c("walking", "walkingupstairs", "walkingdownstairs", "sitting", "standing", "laying")
for( i in 1:length(numbercode)){
    Activitieslabels$V1 <- gsub(numbercode[i], activitylabel[i], Activitieslabels$V1)
}
# Add the column with the activity label to the subset dataset.
subsetdata$Activities <- Activitieslabels$V1

### This completes the task marked as 3 in Coursera Assignment. ###

# Step 5: Appropriately labels the data set with descriptive variable names.

# We create an array with the keywords included in the names of the variables in the data set, that we will use 
# to find the indexes with grep to rename the column names, in some cases using metacharacters.

# Keywords to use with grep.
keywords <- c("mean", "std", "BodyAcc", "GravityAcc", "BodyGyro", "Jerk", "Mag", "^t", "^f", "X$", "Y$", "Z$")
# Words of phrases to create the new names. 
newwords <- c("mean", "standard deviation", "body acceleration", "gravity acceleration", "body angular velocity",  "jerk", "magnitude", "in time domain", "in frequency domain", "in x axis", "in y axis", "in z axis")
# Empty array for the new names.
newnames <- c()
newnames <- as.character(newnames)

# Replace the entries of the newnames array with the phrases in the newwords array as long as the word is found. 
for (k in 1:length(keywords)){
    index <- grep(keywords[k], names(subsetdata))
    newnames[index] <- paste(newnames[index], newwords[k])
}
# Add the name of the Activities column
newnames[67] <- "Activity"
# Now, remove the "NA " string created.
newnames <- gsub("NA ", "", newnames)

#Rename the variables of the data set.
names(subsetdata) <- newnames

### This completes the task marked as 4 in Coursera Assignment. ###

# Step 6:Create an independent tidy data set to show the average 
# of each variable for each activity and each subject.

library(reshape2)
# Create an ID for each subject. 
subject <- 1:nrow(subsetdata)
# Concatenate the column with the subject id in the left part of the data frame.
AvgData <- cbind(subject, subsetdata)

# Use the melt function to reshape the data set
MeltAvgData <- melt(AvgData, id = names(AvgData[c(1,68)]), measure.vars = names(AvgData[2:67]))
TidyAvgData <- dcast(MeltAvgData, variable ~ Activity, mean)

write.csv(TidyAvgData, file = ".\\TidyDataset.csv")

### This completes the task marked as 5 in Coursera Assignment. ###