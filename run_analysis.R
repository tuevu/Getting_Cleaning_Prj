rm(list=ls())
#Set working dir
if(!file.exists("data")){
  dir.create("data")
}
################################################
#Download and unzip the dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./data/UCI_dataset.zip")
unzip("./data/UCI_dataset.zip")
list.dirs()
################################################
#1. Merges the training and the test sets to create one data set
    #Actual activity data (standardized values)
    Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE,sep="")
    Xtest  <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE,sep="")
    Xdata  <- rbind(Xtrain,Xtest)
    
    #Activity Labels following activity_labels.txt
    Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE,sep="")
    Ytest  <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE,sep="")
    Ydata  <- rbind(Ytrain,Ytest)
    
    #Individual who took the test (from 1-30 person)
    Strain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep="")
    Stest  <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep="")
    Sdata  <- rbind(Strain,Stest)
    
    #Total of 561 statistics of activities recorded
    feature <- read.table("./UCI HAR Dataset/features.txt",as.is = TRUE)
    #use as.is becoz the feature is not  unique
    
    #Merge to one final table SS (stands for Samsung)
    SS <- cbind(Sdata,Ydata,Xdata)
    colnames(SS) <- c("ID","activities",feature$V2)
    
    #remove input
    rm(Xtrain,Xtest,Xdata,Ytrain,Ytest,Ydata,Strain,Stest,Sdata)
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
    ind <- grep("ID|activities|mean|std",colnames(SS))
    #Retain the mean and standard deviation for all measurement: SSms
    SSms <- SS[,ind]
    rm(SS)
    
#3. Uses descriptive activity names to name the activities in the data set
    activities_names <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE,sep="")
    
    #Replace the activities column using factor:
    SSms$activities <- factor(SSms$activities,levels = activities_names$V1,
                              labels = activities_names$V2)
#4. Appropriately labels the data set with descriptive variable names.
    SSms_names <- colnames(SSms)
    
    #Substitue the short names with descriptive variable names
    SSms_names <- gsub("^t","domain_time",SSms_names)
    SSms_names <- gsub("^f","domain_frequency",SSms_names)
    
    SSms_names <- gsub("Acc","Accelerometer",SSms_names)
    SSms_names <- gsub("Mag","Magnitude",SSms_names)
    SSms_names <- gsub("Freq","Frequency",SSms_names)
    SSms_names <- gsub("Gyro","Gyroscope",SSms_names)
    
    colnames(SSms) <- SSms_names
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    #Compute average values
    library(dplyr)
    meanSSms <- SSms %>%
      group_by(ID,activities) %>%
      summarise_all(funs(mean))
    
    write.table(meanSSms,"Samsung_analysis.txt",row.names = FALSE)
