---
CodeBook
---

This is my code book for the tidy data set created by run_analysis.R for the 
"Getting and Cleaning Data" course project. 

For more details on the course see 
<https://class.coursera.org/getdata-013/>.

The assignment asks that the codebook should descibe the variables, the data, 
and any transformations or work that was performed to clean up the data.

---
The variables 
---
"Subject"  The subject, one of 1-30.

"Activity" The activity they performed.

The following variables each contain observations and are descriptive because they indicate the meaning via their names rather than being V1, V2, V3, etc.

"tBodyAcc.mean.X"

"tBodyAcc.mean.Y"

"tBodyAcc.mean.Z"

"tBodyAcc.std.X"

"tBodyAcc.std.Y"

"tBodyAcc.std.Z"

"tGravityAcc.mean.X"

"tGravityAcc.mean.Y"

"tGravityAcc.mean.Z"

"tGravityAcc.std.X"

"tGravityAcc.std.Y"

"tGravityAcc.std.Z"

"tBodyAccJerk.mean.X"

"tBodyAccJerk.mean.Y"

"tBodyAccJerk.mean.Z"

"tBodyAccJerk.std.X"

"tBodyAccJerk.std.Y"

"tBodyAccJerk.std.Z"

"tBodyGyro.mean.X"

"tBodyGyro.mean.Y"

"tBodyGyro.mean.Z"

"tBodyGyro.std.X"

"tBodyGyro.std.Y"

"tBodyGyro.std.Z"

"tBodyGyroJerk.mean.X"

"tBodyGyroJerk.mean.Y"

"tBodyGyroJerk.mean.Z"

"tBodyGyroJerk.std.X"

"tBodyGyroJerk.std.Y"

"tBodyGyroJerk.std.Z"

"tBodyAccMag.std"

"tGravityAccMag.std"

"tBodyAccJerkMag.std"

"tBodyGyroMag.std"

"tBodyGyroJerkMag.std"

"fBodyAcc.mean.X"

"fBodyAcc.mean.Y"

"fBodyAcc.mean.Z"

"fBodyAcc.std.X"

"fBodyAcc.std.Y"

"fBodyAcc.std.Z"

"fBodyAccJerk.mean.X"

"fBodyAccJerk.mean.Y"

"fBodyAccJerk.mean.Z"

"fBodyAccJerk.std.X"

"fBodyAccJerk.std.Y"

"fBodyAccJerk.std.Z"

"fBodyGyro.mean.X"

"fBodyGyro.mean.Y"

"fBodyGyro.mean.Z"

"fBodyGyro.std.X"

"fBodyGyro.std.Y"

"fBodyGyro.std.Z"

"fBodyAccMag.std"

"fBodyAccJerkMag.std"

"fBodyGyroMag.std"

"fBodyGyroJerkMag.std"

"angletBodyAccMean,gravity"

"angletBodyAccJerkMean,gravityMean"

"angletBodyGyroMean,gravityMean"

"angletBodyGyroJerkMean,gravityMean"

"angleX,gravityMean"

"angleY,gravityMean"

"angleZ,gravityMean"


---
The data
---
The data we are working with is from the field of wearable computing.

The abstract (linked below) defines this data as follows:

"Human Activity Recognition database built from the recordings of 30 subjects 
performing activities of daily living (ADL) while carrying a waist-mounted 
smartphone with embedded inertial sensors."

Link to learn more information:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


---
Transformations
---
The X\_train, Y\_train, and subject\_train files from the train folder were read 
in and combined into a single data frame via column binding.

The X\_test, Y\_test, and subject\_test files from the train folder were read in 
and combined into a single data frame via column binding.

Then those two data frames were combined.

The features were loaded from features.txt and had to be cleaned up as follows:

  * The dashes '-' were replaced with dots '.'

  * 'BodyBody' was replaced with 'Body'

  * ( and ) were removed

Then 'Subject', 'Activity' and the features were aadded as the column names.  

Once the column names were in place I filtered out columns that did not include 
std, Mean, or mean().  I excluded meanFreq which was not just a mean, but a
weighted average of frequency components.  The other Means were included since
they are clearly a mean, and can be filtered out if not needed.

The descriptive activity labels were added via gsub assignment after 
looking them up in activity_labels.txt.

Next the data was summarized into means by 'Subject' and 'Activity' using
dplyr's group\_by and summarize\_each functions.

Lastly, I used reshape2 to melt the data from wide format into long format and
wrote it out with write_table as specified in the assignment.

Thanks for reading my CodeBook.md

-Jeff
