
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

# The datasets created during the process are as follows:
x_test - contains original measurementstest set
x_train - contains original measurements training set
x_full - contains the joined training and test sets
x_tmsd - contains only the mean and standard deviation values extracted from x_full
actnames - contains the activities labels for the full set
subjects - contains the joined test and training subjects data sets
fullset - contains actnames, subjects and x_tmsd joined together
meltset - is created by applying the melt operation to fullset
tidyset - contains the final tidy data with the averages of every variable already calculated


# The general process to obtain the final tidy dataset was as follows:
- Read the test data set into x_test
- Read the training dataset into x_train
- Join the two dataset into a single set named "x_full"
- From the joined dataset (x_full), extract only measurements on the mean and standard deviation for every feature and put them into a new dataset (x_tmsd)
- Name the columns in this x_tmsd dataset with the corresponding labels from features.txt file
- Read the training and test files with the activities identifiers and put them into a single data frame (actnames)
- Read the training and test subjects files and put them into another single data frame (subjects)
- Combine into a single data frame named "fullset" the subjects, activities identifiers (actnames) and measurements values (x_tmsd)
- Now melt the single new combined data frame creating a data set (meltset) which contains the following columns:
Subject, Activity, Variable and Value. This has the same format as the final tidy data set described above.
- Aggregate the melt dataset by subject, activity and variable calculating the mean for the values and create the final tidy dataset - tidyset
- Write the resulting aggregated and tidy dataset to disk



