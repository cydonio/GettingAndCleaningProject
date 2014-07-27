
##  Getting and Cleaning Data Course Project
##
##
## The final dataset is called tidydataset.txt and it contains the following columns:

"Subject" - identifies the subject who performed the activity

"Activity" - This is the label of an activity for a subject. The possible values are:
WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING 

"Variable" - This column contains the description of a feature for a particular activity for one subject. The possible 
values for this column are described in the features.txt file

"Average" - This is the value of the observation for a variable for one activity, for one subject

# The general process to obtain the final tidy dataset was as follows:
- Read the test data set
- Read the training dataset
- Join the two dataset into a single set
- From the joined dataset, extract only measurements on the mean and standard deviation for every feature and put them into
a new dataset
- Name the columns in this means/SDs dataset with the corresponding labels from features.txt file
- Read the training and test files with the activities identifiers and put them into a single data frame
- Read the training and test subjects files and put them into another single data frame
- Combine into a single data frame the subjects, activities identifiers and measurements values
- Now melt the single new combined data frame creating a data set which contains the following columns:
Subject, Activity, Variable and Value. This has the same format as the final tidy data set described above.
- Aggregate the melt dataset by subject, activity and variable calculating the mean for the values
- Write the resulting aggregated and tidy dataset to disk



