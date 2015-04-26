#Summary
As this data set is derived from the “Human Activity Recognition Using Smartphones Dataset, v1.0”, the following background and descriptions of the source data have been extracted from the README.txt contained from that source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).

#From Source Data
```
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
```

#Specific Definitions of Output Generated

The project provided here derives summary data from the original data set.  Specifically, each data from both the ‘training’ and the ‘test’ data that are averages (‘*mean()*’) or standard deviations (‘*std()*’) are collected, grouped by specific subject and activity, and the corresponding average is reported.
As a result, the reported data contains a column for the activity (presented with the textual data from ‘activity_labels.txt’), the subject, and a column for each of the data from the original data sets (train/X_train.txt, with column labels from train/y_train.txt, row concatenated with test/X_test.txt, with column labels from test/y_test.txt), but excluding the columns from those data that are neither averages nor standard deviations.
Each row corresponds to the summarization of the records from those sources with the same subject and activity values, with all corresponding data in those columns averaged to produce the corresponding data in the reported row.
The column labels have been altered from the original source, in order to improve readability - specifically, source columns matching averages have had ‘-mean()’ replaced with ‘ (mean)’; those matching standard deviation have had ‘-std()’ replaced with ‘ (std dev)’; and those corresponding to different XYZ axis values have had ‘-X’ replaced with ‘ (X axis)’, ‘-Y’ with ‘ (Y axis)’ and ‘-Z’ replaced with ‘ (Z axis)’, accordingly.
The resulting table is reported, with comma separators, to the tidyData.txt file.

The base data values reported, though averaged, correspond both in definition and in range to the types in the original source data.  Definitions of the columns can be found in the features_info.txt file of the source data set.  The base data reported include:

* Activity
* Subject
* tBodyAcc (average and std for X,Y,Z)
* tGravityAcc (average and std for X,Y,Z)
* tBodyAccJerk (average and std for X,Y,Z)
* tBodyGyro (average and std for X,Y,Z)
* tBodyGyroJerk (average and std for X,Y,Z)
* tBodyAccMag (average and std)
* tGravityAccMag tBodyAccMag (average and std)
* tBodyAccMag (average and std)
* tBodyAccJerkMag (average and std)
* tBodyGyroMa (average and std)
* tBodyGyroJerkMag (average and std)
* fBodyAcc (average and std for X,Y,Z)
* fBodyAccJerk (average and std for X,Y,Z)
* fBodyGyro (average and std for X,Y,Z)
* fBodyAccMag (average and std),
* fBodyBodyAccJerkMag (average and std)
* fBodyBodyGyroMag (average and std)
* fBodyBodyGyroJerkMag (average and std)
