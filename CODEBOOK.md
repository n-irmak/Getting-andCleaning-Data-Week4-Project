

# Getting and Cleaning Data Course Peer-Reviewed Project - Codebook

This code book summarizes the data preparation performed by the 'run_analysis.R' script and the resulting data in 'TidyData.txt'

**1. Download the dataset**
* Dataset downloaded from provided link and extracted.

**2. Reading the required data**

* features -> data from accelerometer and gyroscope signals
* activities -> the type of activity performed by the test subject
* subject_test -> test data of test subjects
* x_test -> features of test subjects
* y_test -> activity codes of test data
* subject_train -> train data of training subjects
* x_train -> features of train subjects
* y_train -> activity codes of train data

**3. Merging test and train datasets**

* test -> merging subject_test, x_test, y_test by columns
* train -> merging subject_train, x_train, y_train by columns
* merged_data -> merging test and train by rows

**4. Extracting data that only contains mean and std**

* tidy_data is formed byselecting mean and std from merged_data

**5. Labeling data appropriately**

* Activity codes are replaced with activity names which are:
  + WALKING -> 1
  + WALKING_UPSTAIRS -> 2
  + WALKING_DOWNSTAIRS -> 3
  + SITTING -> 4
  + STANDING -> 5
  + LAYING -> 6

* Other replacements:

  + Acc -> Accelerometer
  + Mag -> Magnitude
  + ^t -> Time
  + ^f -> frequency
  + ^anglet -> angle_time
  + gravity -> Gravity
  + angle -> Angle
  + -mean() -> Mean
  + -std() -> STD
  + -freq() -> Frequency

**6. Creating a second tidy data set with averages and writing that into a txt file**

* second_tidy_data -> taking averages of each variables for each activity and each data set

* TidyData.txt -> second_tidy_data written in txt file format



