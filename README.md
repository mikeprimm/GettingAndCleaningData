# Project Summary
One of the most exciting areas in all of data science right now is wearable computing - see 
for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
advanced algorithms to attract new users. The data linked to from the course website represent data collected 
from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where 
the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The source data can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The code presented does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Using the provided code
To use the provided code you simply need to do the following:
* Extract the run_analysis.R file
* Make sure that the 'data.table' and 'plyr' packages have been installed in your R environment
* Execute the run_analysis.R file via running "source('run_analysis.R')"
The code will download the source data, if needed, and extract the data, if needed.  Beyond that, 
it will do all the processing indicated above, and generate an output file 'tidyData.txt' in the working directory.

# Description of code function
The provided code executes the following general processing steps
* Downloads and extracts the source data, if needed - if this has already been done, the steps are skipped
* Loads the test and training data, as well as activity and feature name mapping data, into data tables
* Uses the feature mapping (from 'features.txt') to label the columns for the test and training data tables
* Labels the data columns for the test and training activity data as 'Activity'
* Labels the data columns for the test and training subject data as 'Subject'
* Binds the activity and subject data as additional columns on to the test and training data tables
* Row combines the test and training activity tables
* Removes the columns from the combined table that are not the Subject, Activity, an average ('mean()') or a standard deviation ('std()') value
* Use factor() to map Activity ID values to string values, based on map loaded from 'activity_labels.txt'
* Tidy up the labels for the columns - map '-mean()' to ' (mean)', '-X' to ' (X axis)', etc
* Use ddply to generate a tidy table by group rows by Subject and Activity, and apply the 'mean' function column-wise on the numeric data columms using the 'numcolwise()' function.
* Use write.table to store the final tidy table in tidyData.txt
