
#  Getting and Cleaning Data Course Project
#

# There is only one script (run_analysis.R) which performs all the steps to collect all the data and create the final tidy dataset

# The general process to obtain the final tidy dataset is as follows:
- Read the test data set
- Read the training dataset
- Join the two dataset into a single set
- From the joined dataset, extract only measurements on the mean and standard deviation for every feature and put them into
a new dataset
- Name the columns in this means/SDs dataset with the corresponding labels from the features.txt file
- Read the training and test files with the activities identifiers and put them into a single data frame
- Read the training and test subjects files and put them into another single data frame
- Combine into a single data frame the subjects, activities identifiers and measurements values
- Now melt the single new combined data frame creating a data set which contains the following columns:
Subject, Activity, Variable and Value. This has the same format as the final tidy data set described in the code book.
- Aggregate the melt dataset using subject, activity and variable as keys and calculating the mean for the values and placing the results in a new final and tidy dataset
- Write the resulting aggregated and tidy dataset to disk



