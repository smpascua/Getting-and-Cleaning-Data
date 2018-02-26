

R version 3.4.2 (2017-09-28) -- "Short Summer"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

Loading required package: lubridate

Attaching package: ‘lubridate’

The following object is masked from ‘package:base’:
  
  date

> ##get working directory
  > getwd()
[1] "C:/Users/Sonia/Documents"
Warning message:
  package ‘lubridate’ was built under R version 3.4.3 
> setwd("C:/Users/Sonia/Documents/R")
> getwd()
[1] "C:/Users/Sonia/Documents/R"
> ##downloading binary backages data.table & dplyr
  > install.packages("data.table")
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.4/data.table_1.10.4-3.zip'
Content type 'application/zip' length 1577342 bytes (1.5 MB)
downloaded 1.5 MB

package ‘data.table’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Sonia\AppData\Local\Temp\RtmpSuzR5v\downloaded_packages
> install.packages("dplyr")
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.4/dplyr_0.7.4.zip'
Content type 'application/zip' length 2891304 bytes (2.8 MB)
downloaded 2.8 MB

package ‘dplyr’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Sonia\AppData\Local\Temp\RtmpSuzR5v\downloaded_packages
> ##attaching packages
  Error in fetch(key) : 
  lazy-load database 'C:/Users/Sonia/Documents/R/R-3.4.2/library/data.table/help/data.table.rdb' is corrupt
> library(data.table)
data.table 1.10.4.3
The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way
Documentation: ?data.table, example(data.table) and browseVignettes("data.table")
Release notes, videos and slides: http://r-datatable.com

Attaching package: ‘data.table’

The following objects are masked from ‘package:lubridate’:
  
  hour, isoweek, mday, minute, month, quarter, second, wday, week,
yday, year

Warning message:
  package ‘data.table’ was built under R version 3.4.3 
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:data.table’:
  
  between, first, last

The following objects are masked from ‘package:lubridate’:
  
  intersect, setdiff, union

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

Warning message:
  package ‘dplyr’ was built under R version 3.4.3 
> #read tables and assign to variables
> features <- read.table("UCI HAR Dataset/features.txt")
> activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
> subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
> trainingset <- read.table("UCI HAR Dataset/train/X_train.txt")
> traininglabels <- read.table("UCI HAR Dataset/train/y_train.txt")
Error in fetch(key) : 
  lazy-load database 'C:/Users/Sonia/Documents/R/R-3.4.2/library/data.table/help/data.table.rdb' is corrupt
> testset <- read.table("UCI HAR Dataset/test/X_test.txt")
Error in fetch(key) : 
  lazy-load database 'C:/Users/Sonia/Documents/R/R-3.4.2/library/data.table/help/data.table.rdb' is corrupt
> testlabels <- read.table("UCI HAR Dataset/test/y_test.txt")
> subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
> subject_train <- read.table("UCI HAR Dataset/subject_train.txt", header = FALSE)
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
  In file(file, "rt") :
  cannot open file 'UCI HAR Dataset/subject_train.txt': No such file or directory
> subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
> trainingset <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
> traininglabels <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
> testset <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
> testlabels <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
> ##name columns
  > ##merge data
  > subject <- c(subject_train, subject_test)
Error in fetch(key) : 
  lazy-load database 'C:/Users/Sonia/Documents/R/R-3.4.2/library/data.table/help/data.table.rdb' is corrupt
> activity <- c(trainingset, testset)
Error in fetch(key) : 
  lazy-load database 'C:/Users/Sonia/Documents/R/R-3.4.2/library/data.table/help/data.table.rdb' is corrupt
> features <- c(traininglabels, testlabels)
> #merge subject, activity and features
> FinalData <- cbind(subject, features, activity)
> FinalData
> FinalData_mean_std <- FinalData[,grepl("mean|std|subject|activity", colnames(FinalData))]
> requiredColumns <- c(FinalData_mean_std, 562, 563)
> dim(FinalData)
[1] 1122    3
> FinalData_mean_std <- FinalData_mean_std[, -1]
> names(FinalData_mean_std) <- make.names(names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("Acc", Acceleration",(names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("^t", "Time",names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("^f", "Frequency",names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("BodyBody", "Body",names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("mean", "Mean",names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("std", "STD",names(FinalData_mean_std))
> names(FinalData_mean_std) <- gsub("mag", "Magnitude",names(FinalData_mean_std))

# 1. Merges the training and the test sets to create one data set.
rm(list=ls())
train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, sep = "")
train <- cbind(train, read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/train/y_train.txt"))
test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, sep = "")
test <- cbind(test, read.table("UCI HAR Dataset/test/subject_test.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))
data <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
features <- make.names(features[,"V2"])
mean_std <- data[,grep(pattern="std|mean", x=features, ignore.case=TRUE)]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
activity_labels <- apply(activity_labels, 1, function(x) unlist(strsplit(x, split=" ")))
data[,563] <- factor(as.factor(data[,563]), labels=activity_labels[2,])

# 4. Appropriately labels the data set with descriptive activity names. 
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
features <- make.names(features[,"V2"])
features[562] = "subject"
features[563] = "activity"
colnames(data) <- features

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
labels <- colnames(data)[-c(562,563)]
data2 <- lapply(X=labels, FUN=function(x) tapply(data[[x]], list(data$activity, data$subject), mean))
names(data2) <- labels
capture.output(data2, file = "tidy_data.txt")
                                                                                                                                
                                                                                                                                
