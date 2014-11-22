# Samsung Smartphone Activity Data

This dataset contains data derived from raw data collected from the accelerometers and gyroscope of 
Samsung Galaxy S smartphones. The original data was obrained from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Outlined below are the steps taken to tidy this data and some information on how to use the included R script to manipulate the original data youself and on how to read the tidy data.

### How the data was tidied.

1. The original data contained two sets, a training and a test set. First the two sets were merged and columns describing the activity and subject were added.
2. Column headers were added.
3. Columns that contain measurements on the mean and standard deviation of the origina signal were extracted.
4. The data was reshaped to be tall and narrow, with one column for the measured value and another for the measurement name.
5. The average for each combinaton of subject activity and variable was taken.
6. The measurement name was factored out in to sperate variables so that each column contained only one variable.

### Why this dats is tidy

Column names are single variables. Previously, each column contained many attributes about the measurement in the heading. e.g. ```tBodyAcc-mean()-X``` meant time domain, body component, accelerometer, mean, X axis. All of this information is now in its own column, manking subsetting the data for further analysis trivial.

### Using the script

The included R script (run_analysis.R) can be used on the original data (linked above) to produce the tidy data.

The script, when sourced, loads a function called run_analysis in to the environment. This function expects one parameter, a path to the ```'UCI HAR Dataset'``` folder. By default, the function expects the this folder is a subfolder in the current working directory. 

e.g.
```
Working Directory/
 |    run_analysis.R
 | 
 |-----UCI HAR Dataset/
        |    activity_labels.txt
        |    ....
        |----test/
        |----train/
        ...
```

If this is not the case, you can provide a full or relative path to the dataet folder.

For convenience, and to save time, it would be best to store  the return value from the function to a variable e.g.

``` data <- run_analysis()

### Readind the tidy data set

To read the tidy data set in R use the read.table command. e.g.

``` data <- read.table("tidy_data.txt", header=TRUE)