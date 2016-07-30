# set working directory
store_wd <- getwd()
setwd("C:/Users/vivek verma/Desktop/Data Science/Data/UCI HAR Dataset")

# Extract Test Data
test_data <- read.table("./test/X_test.txt",stringsAsFactors = FALSE)

# Find mean and sd of all rows
mean <- apply(test_data,1,mean,na.rm= TRUE)
standard_deviation <- apply(test_data,1,sd,na.rm= TRUE)

#Extact subject
subject_test <- read.fwf("./test/subject_test.txt",col.names = "subject",widths=2)

#Extact activity code
activitycode_test <- read.fwf("./test/y_test.txt",col.names = "activitycode",widths=1)

#Combine all together for test data
test_data_final<- cbind(subject_test,activitycode_test,mean,standard_deviation)

# Extract Train Data
train_data <- read.table("./train/X_train.txt",stringsAsFactors = FALSE)
# Find mean and sd of all rows
mean <- apply(train_data,1,mean,na.rm= TRUE)
standard_deviation <- apply(train_data,1,sd,na.rm= TRUE)

#Extact subject
subject_train <- read.fwf("./train/subject_train.txt",col.names = "subject",widths=2)

#Extact activity code
activitycode_train <- read.fwf("./train/y_train.txt",col.names = "activitycode",widths=1)

#Combine all together for train data
train_data_final<- cbind(subject_train,activitycode_train,mean,standard_deviation)

# merge 2 data sets
combined_data <- rbind(test_data_final,train_data_final)

# Extract Activity Label
activity_label <- read.table("activity_labels.txt",col.names = c("activitycode","activity"),stringsAsFactors = FALSE)

# Activity label merge with combined data
combined_data <- merge(combined_data,activity_label)


# Load the dplyr package
library(dplyr)

# group by activity and subject
group_comb_data<- group_by(combined_data,activitycode,subject)

# summarise the average of mean and standard deviation
tidy_data <- summarize(group_comb_data, mean = mean(mean,na.rm = TRUE), standard_deviation = mean(standard_deviation,na.rm=TRUE))
# merge with activity label
tidy_data <- merge(tidy_data,activity_label)
# reorder columns in tidy data set
tidy_data <- tidy_data[c(1,5,2,3,4)]

setwd(store_wd) 

# write data to the .csv file.
write.csv(combined_data,"combined_data.csv")
write.csv(tidy_data,"tidy_data.csv")


