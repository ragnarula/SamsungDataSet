# Code Book - Samsung Smartphone Activity Data

This dataset contains data derived from raw data collected from the accelerometers and gyroscope of 
Samsung Galaxy S smartphones. The original data was obrained from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The following columns were extracted from the original dataset:

 [1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"           
 [5] "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"            "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
 [9] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[13] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"             
[17] "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"          "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
[21] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"               "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
[25] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[29] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[33] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
[37] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
[41] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
[45] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()" "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
[49] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"             "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[53] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
[57] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"               "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
[61] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"               "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
[65] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"          "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[69] "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
[73] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
[77] "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"          "fBodyBodyGyroJerkMag-std()"     

From these columns the average for each of these variables for each subject and activity was computed.

The data was then tidied and reshaped to form a new dataset with the following variables.

### Variables

##### subject

1-30 Integer value representing each subject

##### activity

Factor with 6 levels describing the activity being performed at the time of the measurement.

1. "WALKING"
2. "WALKING_UPSTAIRS"
3. "WALKING_DOWNSTAIRS"
4. "SITTING"
5. "STANDING"
5. "LAYING" 

##### domain

Factor with 2 levels describing the domain of the original measurement. Frequency domain measurements were etracted by applying a FFT.

1. frequency
2. time

##### component

Factor with 2 levels describing which component of the original measurement this obeservation represents. The "gravity" component was extracted with a 0.3Hz low pass filter. The "body" components was extracted with a 20Hz high pass filter.

1. body
2. gravity 

#####

Factor with 2 levels. The deivce that this measurement was taken from.

1. accelerometer
2. gyroscope

##### processing

Factor with 4 levels. The processing applied in the original data to obtain the measurement. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

1. jerk
2. jerk magnitude
3. magnitude
4. raw

##### measurement

Factor with 3 levels. The function applied to the original data.

1. mean
2. mean frequency
3. standard deviation

##### axis

Factor with 4 levels. The axis that the origina measurement was taken from.

1. x
2. xyz
3. y
4. z

##### average

Numeric value representing the average measurement of this combination of variables from the original data.
