run_analysis <- function (directory = "UCI HAR Dataset"){
        
        olddir <- getwd()
        first <- substring(directory,1,1)
        second <- substring(directory,2,2)
        
        if(first == '/' || second == ':'){
                setwd(directory)
        } else {
                setwd(paste(olddir,"/",directory,sep=""))
        }
        
        #read data
        testData <- read.table("test/X_test.txt",header=FALSE)
        trainData <- read.table("train/X_train.txt",header=FALSE)
        #read col names
        features <- read.table("features.txt",header=FALSE)
        #add col names
        colnames(testData) <- as.character(features[,2])
        colnames(trainData) <- as.character(features[,2])
        #read activity labels
        testActivityLabels <- read.table("test/Y_test.txt",header=FALSE)
        trainActivityLabels <- read.table("train/Y_train.txt",header=FALSE)
        #add activity label column to data sets
        trainData$Activity <- trainActivityLabels[,1]
        testData$Activity <- testActivityLabels[,1]
        #convert to factor
        testData$Activity <- as.factor(testData$Activity)
        trainData$Activity <- as.factor(trainData$Activity)
        #read activity names
        actLabels <- read.table("activity_labels.txt", header=FALSE)
        #rename factors
        levels(trainData$Activity) <- actLabels[,2]
        levels(testData$Activity) <- actLabels[,2]
        #read subjects
        testSubjects <- read.table("test/subject_test.txt", header=FALSE)
        trainSubjects <- read.table("train/subject_train.txt",header=FALSE)
        #add subject cols
        testData$Subject <- testSubjects[,1]
        trainData$Subject <- trainSubjects[,1]
        #combine data
        combined <- rbind(testData,trainData)
        #subset mean and std
        sub <- combined[,c(which(names(combined) %in% c("Subject","Activity")),grep("*mean",colnames(combined)),grep("*std",colnames(combined)))]
        sub$Subject <- as.factor(sub$Subject)
        #melt
        library(reshape2)
        melt <- suppressMessages(melt(sub))
        #take averages per subject,activity and variable
        tidy <- tapply(melt$value, list(melt$Subject,melt$Activity,melt$variable), mean)
        #melt again to make tall
        melt <- melt(tidy)
        #give columns names
        names(melt) <- c("subject","activity","signal","average")
        # extract Domain variable
        melt$domain <- sapply(melt$signal,function(x) ifelse(grepl("^t",x),"time","frequency"))
        #extract component variable
        melt$component <- sapply(melt$signal, function(x) ifelse(grepl("Body",x),"body","gravity"))
        #extract measurement type
        melt$measurement <- sapply(melt$signal, function(x) ifelse(grepl("mean",x),ifelse(grepl("meanFreq",x), "mean frequency","mean"),"standard deviation"))
        #extract jerk mag
        melt$processing <- sapply(melt$signal, function(x) ifelse(grepl("Jerk",x),ifelse(grepl("JerkMag",x), "jerk magnitude","jerk"),ifelse(grepl("Mag",x),"magnitude","raw")))
        #extract axis
        melt$axis <- sapply(melt$signal, function(x) ifelse(grepl("-X",x), "x",ifelse(grepl("-Y",x),"y",ifelse(grepl("-Z",x),"z","xyz"))))
        #extract device
        melt$device <- sapply(melt$signal,function(x) ifelse(grepl("Acc",x),"accelerometer","gyroscope"))
        #reorder columns, drop original feature names
        melt <- melt[,c("subject","activity","domain","component","device","processing","measurement","axis","average")]
        #Order by subject then activity
        melt <- melt[order(melt$subject,melt$activity,melt$domain,melt$component,melt$device,melt$processing,melt$measurement,melt$axis),]
        rownames(melt) <- NULL
        melt$domain <- as.factor(melt$domain)
        melt$device <- as.factor(melt$device)
        melt$component <- as.factor(melt$component)
        melt$processing <- as.factor(melt$processing)
        melt$measurement <- as.factor(melt$measurement)
        melt$axis <- as.factor(melt$axis)
        melt
}