# gettingcleaningdata
Course project for Getting and Cleaning Data

This project was to write a script that would take a dataset, 
make it more tidy, and save a transformed dataset either in long or wide format.

To get started, please retrieve a copy of the course project's dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once that is downloaded and uncompressed, then please place the run_analysis.R into 
the same folder as the uncompressed data. (The script expects to be run from the 
*same folder* where the train and test folders are.)

Once the script is there, we are almost ready to run it.

--
Getting dplyr and reahape2
--
My run_analysis.R script uses dplyr and 
reshape2 to do summarization and melting from wide format into long format.  

If you do not have them, please install:

install.packages("dplyr")

install.packages("reshape2")

To test that they are installed you can load them:

library(dplyr)

library(reshape2)

--
Run the script
--
In R, load and run the run_analysis.R script and it will produce _tidy_data_UCI_HAR_long.txt_
That output is the long format data following the transformations detailed in my
https://github.com/jtw995/gettingcleaningdata/CookBook.md file.

--
View the resulting data
--
To view the data you can run these commands in R while in the working directorw with the data.

data <- read.table("tidy_data_UCI_HAR_long.txt", header = TRUE)

View(data)

--
Questions?
--

More details are in the CodeBook.md and the run_analysis.R file (I included many comments).
