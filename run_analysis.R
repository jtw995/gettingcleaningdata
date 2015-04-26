# 
# Analysis of UCI HAR Dataset for "Getting and Cleaning Data" course
# For more details on the course see <https://class.coursera.org/getdata-013/>.
# 
# Script Author: Jeff Williams
#

# Assignment:
#  1) Merges the training and the test sets to create one data set.
#  2) Extracts only the measurements on the mean and standard deviation for each 
#     measurement. 
#  3) Uses descriptive activity names to name the activities in the data set
#  4) Appropriately labels the data set with descriptive variable names. 
#  5) From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.'
#

# This script assumes it is being run in a working directory with an 
# uncompressed copy of the UCI HAR Dataset folder.  That means it runs from the
# folder with test and train subfolders

# This script uses dplyr and reshape2
# to install dplyr, or reshape2 if missing, uncomment and run:  
# install.packages("dplyr")
# install.packages("reshape2")

library(dplyr)
library(reshape2)

# Get the data sets - note the intertial data is not needed due to no mean or
# standard deviation in that data
train <- read.table("train/X_train.txt")
train_labels <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")
test <- read.table("test/X_test.txt")
test_labels <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Combine the parts into data sets for train and test
train_columns <- cbind(subject_train,train_labels)
train <- cbind(train_columns,train)
test_columns <- cbind(subject_test,test_labels)
test <- cbind(test_columns,test)

# Combine test and train into one dataset
combined <- rbind(test,train)

# Load features
features <- read.table("features.txt")
    
# Fix feature names
features$V2 <- gsub('-','.',features$V2) 
features$V2 <- gsub('\\(','',features$V2)
features$V2 <- gsub(')','',features$V2)
features$V2 <- gsub('BodyBody','Body',features$V2)

# Add features
colnames(combined) <- c('Subject','Activity',features$V2)

# Filter out columns that do not include std, Mean, or mean followed by a '.'
# Already cleaned off the ()'s above
combined <- combined[c('Subject','Activity',
                       features$V2[grep("(mean\\.|Mean|std)",features$V2)])]

# Enter Activities with the useful gsub command
combined$Activity <- gsub('1','WALKING',combined$Activity)
combined$Activity <- gsub('2','WALKING_UPSTAIRS',combined$Activity)
combined$Activity <- gsub('3','WALKING_DOWNSTAIRS',combined$Activity)
combined$Activity <- gsub('4','SITTING',combined$Activity)
combined$Activity <- gsub('5','STANDING',combined$Activity)
combined$Activity <- gsub('6','LAYING',combined$Activity)

# Summarize means by subject and activity with dplyr's summarize_each and funs
summary <- combined %>%
    group_by(Subject,Activity) %>%
    summarise_each(funs(mean))

# Convert to long format (I think it looks nicer) and write to a file
summary_long <- melt(summary, id.vars=c("Subject","Activity"))
write.table(summary_long, file = "tidy_data_UCI_HAR_long.txt", row.name=FALSE)

# DEAR GRADER, here are commands to easily read in the table and to view it, uncomment
# them before running them:
# data <- read.table("tidy_data_UCI_HAR_long.txt", header = TRUE)
# View(data)
