# This is a readme file for the run_analysis.R script #

## Programming Approach ##

### 1. Combinig data set ###

1. Extract test data and read into R object test_data.
2. Find mean and standard deviation for test_data.
3. Extract Subject data for test data and read into the subject_test R object.
4. Extract Activity code data for test data and read into the activitycode_test R object.
5. Combine all elements together in the test_data_final object.
6. Repeat steps 1-5 for train data and create train_data_final object.
7. combine dataset created in 5 and 6 step above.
8. Extract activity label and load in the activity_label object.
9. Merge dataset in step 7 and 8 above.

### 2. Creating tidy data ###

1. Load the dplyr package.
2. Group the data by columns subject and actvitycode.
3. Perform summarise.
4. Merge resulting dataset with the activity_label dataset.
5. Rearrange the columns.