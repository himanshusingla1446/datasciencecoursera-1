# This document describes the code inside the run_analysis.R script #

## Programming Approach ##
The R programe is divided into 2 parts.

### 1. Combining data set ###

1. Extract test data and read into R object test_data.
2. Find mean and standard deviation for test_data and loads it in the mean and standard_deviation R object.
3. Extract Subject data for test data and read into the subject_test R object.
4. Extract Activity code data for test data and read into the activitycode_test R object.
5. Combine all elements together in the test_data_final object for test data.
6. Repeat steps 1-5 for train data and create train_data_final object for train data.
7. Combine dataset created in 5 and 6 step above and create combined_data R object.
8. Extract activity label and load in the activity_label object.
9. Merge dataset in step 7 and 8 above to combine 2 datasets.

### 2. Creating tidy data ###

1. Load the dplyr package.
2. Group the combined_data dataset by columns subject and actvitycode.
3. Perform summarise on the above dataset.
4. Merge resulting dataset with the activity_label dataset.
5. Rearrange the columns.
6. Writing the output to the .csv file.