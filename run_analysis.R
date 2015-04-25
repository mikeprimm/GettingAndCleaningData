library(plyr)

# Fetch data and extract
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data.zip", method="curl")
unzip("data.zip")

# Load training set data
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingSet_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingSet_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Load test data
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSet_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSet_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# Get activity code mapping
activityMap <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Get features mapping
featuresMap <- read.table("./UCI HAR Dataset/features.txt")

# Use feature mapping to label data columns
colnames(trainingSet) <- featuresMap$V2
colnames(testSet) <- featuresMap$V2
# Label activity columns
colnames(trainingSet_activity) <- c("Activity")
colnames(testSet_activity) <- c("Activity")
# Label subject columns
colnames(trainingSet_subject) <- c("Subject")
colnames(testSet_subject) <- c("Subject")

# Add activity and subject columns to rest of test and training data
trainingSet <- cbind(trainingSet, trainingSet_activity)
trainingSet <- cbind(trainingSet, trainingSet_subject)
testSet <- cbind(testSet, testSet_activity)
testSet <- cbind(testSet, testSet_subject)

# 1. Merges the training and the test sets to create one data set.
combinedSet <- rbind(trainingSet, testSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
meanSet <- sapply(combinedSet, mean, na.rm=TRUE)
sdSet <- sapply(combinedSet, sd, na.rm=TRUE)

# 3. Uses descriptive activity names to name the activities in the data set
combinedSet$Activity <- factor(combinedSet$Activity, levels=activityMap$V1, labels=activityMap$V2)

# 4. Appropriately labels the data set with descriptive variable names. 
#(completed earlier)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
combinedTable <- data.table(combinedSet)
tidyData <- ddply(combinedTable, c("Subject","Activity"), numcolwise(mean))
write.table(tidyData, file="tidyData.txt", sep=",", row.names=FALSE)
