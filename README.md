# "run_analysis.R": the main analysis file
## Question 1 to 5 are analysed with detailed descriptin in the R code

## The following are analysed:
- Set working dir
- Download and unzip the dataset
### 1. Merges the training and the test sets to create one data set
* Merge using row bind for the training and testing set (X_train, X_test)
* Merge using row bind for the training and testing set for ID person (Y_train, Y_test)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Using grep to extract the index having word "mean" and "standard deviation"

### 3. Uses descriptive activity names to name the activities in the data set
* use the same index to  extract the name

### 4. Appropriately labels the data set with descriptive variable names.
* use the same index to  extract the ID person name

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Create new data set using write.table
==================================================================

# "seconddata.csv": is  the output from analysis file

* The file contains mean and standard deviation from activities using Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and Triaxial Angular velocity from the gyroscope. 

* The Triaxial axeses are denoted as X, Y, Z

* There are 79 activities (mean and standard deviation)

* Each row stands for each person who carried out the activities (1:30)
======================================


