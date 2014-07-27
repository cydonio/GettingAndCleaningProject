#
# Getting and Cleaning Data Course Project
#

#Read test data file
x_test = read.csv("C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\test\\x_test.txt", sep = "", header = FALSE, strip.white = TRUE, colClasses = numeric(), fill = FALSE, nrows = 2950)

#Read train data file
x_train = read.csv("C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\train\\x_train.txt", sep = "", header = FALSE, strip.white = TRUE, colClasses = numeric(), fill = FALSE, nrows = 7400)

#Append x.test dataset to x.train
x_full = rbind(x_train, x_test)

# Extract means and SDs for each measurement (x_train contains now both datasets)
# First, set a vector with the temporary names of all the mean and std dev variables
meansstds = c("V1","V2","V3","V41","V42","V43","V81","V82","V83","V121","V122","V123","V161","V162","V163","V201","V214","V227","V240","V253","V266","V267","V268",
"V294","V295","V296","V345","V346","V347","V373","V374","V375","V424","V425","V426","V452","V453","V454","V503","V513","V516","V526","V529","V539","V542",
"V552","V555","V556","V557","V558","V559","V560","V561",
"V4","V5","V6","V44","V45","V46","V84","V85","V86","V124","V125","V126","V164","V165","V166","V202","V215","V228","V241","V254","V269",
"V270","V271","V348","V349",
"V350","V427","V428","V429","V504","V517","V530","V543")

# Now extract all the means and std devs. into a new dataframe
x_tmsd = x_full[meansstds]

# Set descriptive variable names
namesvars = c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z",
 "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z",
 "tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyAccMag-mean()","tGravityAccMag-mean()","tBodyAccJerkMag-mean()",
 "tBodyGyroMag-mean()","tBodyGyroJerkMag-mean()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-meanFreq()-X",
 "fBodyAcc-meanFreq()-Y","fBodyAcc-meanFreq()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-meanFreq()-X",
 "fBodyAccJerk-meanFreq()-Y","fBodyAccJerk-meanFreq()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-meanFreq()-X",
 "fBodyGyro-meanFreq()-Y","fBodyGyro-meanFreq()-Z","fBodyAccMag-mean()","fBodyAccMag-meanFreq()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-meanFreq()",
 "fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-meanFreq()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-meanFreq()","angle(tBodyAccMean,gravity)",
 "angle(tBodyAccJerkMean),gravityMean)","angle(tBodyGyroMean,gravityMean)",
 "angle(tBodyGyroJerkMean,gravityMean)","angle(X,gravityMean)","angle(Y,gravityMean)","angle(Z,gravityMean)",
 "tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-std()-X",
 "tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-std()-X",
 "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-std()","tGravityAccMag-std()","tBodyAccJerkMag-std()","tBodyGyroMag-std()",
 "tBodyGyroJerkMag-std()","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y",
 "fBodyAccJerk-std()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-std()","fBodyBodyAccJerkMag-std()",
 "fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-std()")
 names(x_tmsd) = namesvars
 
#read activities
actnamestr = read.csv("C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
actnamestst = read.csv("C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
actnames = rbind(actnamestr, actnamestst)
actnames[actnames == 1] = "WALKING"
actnames[actnames == 2] = "WALKING_UPSTAIR"
actnames[actnames == 3] = "WALKING_DOWNSTAIR"
actnames[actnames == 4] = "SITTING"
actnames[actnames == 5] = "STANDING"
actnames[actnames == 6] = "LAYING"
names(actnames) = "Activity"
 
# Read subjects data sets
subjectstr = read.csv("C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
subjectstst = read.csv("C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE) 
subjects = rbind(subjectstr, subjectstst)
names(subjects) = "Subject"

# put all the details together
fullset = cbind(subjects, actnames, x_tmsd)

# melt the full dataset
library(reshape2)
meltset = melt(fullset, id = c("Subject", "Activity"))

# Calculate average values for every variable and place in final tidy dataset
tidyset = aggregate(meltset$value, by=list(meltset$Subject, meltset$Activity, meltset$variable), mean)

# Set column names in tidy dataset
names(tidyset) = c("Subject", "Activity", "Variable", "Average")

# Write tidy dataset to disk
write.table(tidyset, "C:\\Coursera\\DataScience\\GettingData\\Project\\UCI HAR Dataset\\tidydataset.txt",col.names = TRUE, row.names = FALSE)




