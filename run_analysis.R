## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.

require("data.table")

## Read data
## Read the training set data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## Read the test set data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## Read activity labels, ignoring numeric column
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
## Read variable names, ignoring numeric column
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

## Attach names and labels
## Rename X column names to names from features
names(X_test) = features
names(X_train) = features
## Label y data using activity labels
y_test[,2] = activity_labels[y_test[,1]]
y_train[,2] = activity_labels[y_train[,1]]
## Name y columns
names(y_test) = c("ID", "Activity")
names(y_train) = c("ID", "Activity")
## Name subject columns
names(subject_test) = "Subject"
names(subject_train) = "Subject"

## Bind the data together
## Bind the training set data by columns
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
## Bind the test set data by columns
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
## Bind the training and test data by rows to create one large dataset
data <- as.data.frame(rbind(train_data, test_data))

## Reduce dataset to only measures of mean and standard deviation
## Search for matches to "mean" or "std" to identify relevant columns
my_features <- grepl("mean|std|Activity|Subject", colnames(data))
## Reduce data to only contain my_features
data <- as.data.table(data[,my_features])

## Create tidy data set with only the average of each relevant variable
tidy_data <-data[,lapply(.SD,mean),by="Activity,Subject"]

## Write 
write.table(tidy_data, file = "./tidy_data.txt", row.name = FALSE)
