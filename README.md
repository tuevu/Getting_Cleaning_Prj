# "run_analysis.R": the main analysis file
## Question 1 to 5 are analysed with detailed descriptin in the R code

## The following are analysed:
- Set working dir
- Download and unzip the dataset
### 1. Merges the training and the test sets to create one data set
* Merge using row bind for the training and testing set (X_train, X_test)
* Merge using row bind for the training and testing set for Activities (Y_train, Y_test)
* Merge using row bind for the training and testing set for Individual (S_train, S_test)
* Read 561 features data set
* Merge all to one table frame 
### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Using grep to extract the index having word "mean" and "std"

### 3. Uses descriptive activity names to name the activities in the data set
* Using factor to replace activity number according to the activity table

### 4. Appropriately labels the data set with descriptive variable names.
* use gsub to replace short labels with long/full labels

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Using %>% and group_by /summarise to compute the average for each category (by Individual and Activities)
* Create new data set using write.table
==================================================================

# "Samsung_analysis.txt": is  the output from analysis file

* The file contains mean and standard deviation from activities using Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and Triaxial Angular velocity from the gyroscope. 

* There are 180 rows stand for 30 individual with 6 activities each

* There are 79 activities statistics (mean and standard deviation)

* Each row stands for each person who carried out the activities (1:30)
======================================


