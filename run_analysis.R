rm(list=ls())
#Set working dir
if(!file.exists("data")){
  dir.create("data")
}
#Download and unzip the dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./data/UCI_dataset.zip")
unzip("./data/UCI_dataset.zip")
list.dirs()
#1. Merges the training and the test sets to create one data set
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE,sep="")
Xtest  <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE,sep="")
Xdata  <- rbind(Xtrain,Xtest)

Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE,sep="")
Ytest  <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE,sep="")
Ydata  <- rbind(Ytrain,Ytest)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
feature <- read.table("./UCI HAR Dataset/features.txt",header = FALSE)
indmean <- grep("*mean",feature$V2)
indstd  <- grep("*std",feature$V2)
ms <- c(indmean,indstd)
cnames  <- feature$V2[ms]

ms_datasets <- Xdata[,ms]
#3. Uses descriptive activity names to name the activities in the data set
colnames(ms_datasets) <- cnames

#4. Appropriately labels the data set with descriptive variable names.
vms_datasets <- cbind(Ydata,ms_datasets)
colnames(vms_datasets)[1] <- "ID"
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(vms_datasets,"seconddata.txt",row.names = FALSE)
