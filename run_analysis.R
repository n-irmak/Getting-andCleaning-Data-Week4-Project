library(dplyr)

#Reading feature and activity texts.

features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("no","func"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

#Reading test data.

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$func)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")

#reading training data.

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$func)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Combining test and training dataset

test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train,y_train,x_train)

merged_data <- rbind(test,train)

#Extracting mean and std

tidy_data <- merged_data %>% select(subject, code, contains("mean"),contains("std"))

tidy_data$code <- activities[tidy_data$code, 2]

#Labeling the data

names(tidy_data)[2] = "activity"
names(tidy_data) <- gsub("Acc","Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro","Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag","Magnitude", names(tidy_data))
names(tidy_data) <- gsub("gravity","Grativy",names(tidy_data))
names(tidy_data) <- gsub("angle","Angle",names(tidy_data))
names(tidy_data) <- gsub("tBody","TimeBody",names(tidy_data))
names(tidy_data) <- gsub("-mean()","Mean",names(tidy_data))
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data))
names(tidy_data) <- gsub("-freq()","Frequency", names(tidy_data))
names(tidy_data) <- gsub("^t","Time", names(tidy_data))
names(tidy_data) <- gsub("^f","Frequency", names(tidy_data))
names(tidy_data) <- gsub("^anglet","angle_time", names(tidy_data))

#Creating a second tidy data set with averages

second_tidy_data <- tidy_data %>%
                    group_by(subject,activity) %>%
                    summarise_all(funs(mean))

#Writing data to txt file

write.table(second_tidy_data,file="TidyData.txt",row.name=FALSE)

