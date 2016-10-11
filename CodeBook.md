Getting and Cleaning Data Project:

1. Download the dataset and save it to your working directory. Follow the link: 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Read x sets from train and test data.
3. Bind x train and test sets into one - x_set
4. Extract y train and test data sets
5. Combine y train and test sets into y_set
6. Extract and combine subject data into one - subject_data
7. Rename a column in a subject data to subject_id
8. Extract features data which represent formulas/measures.
9. Identify features that contain mean and standard deviation measurements only.
10. Filter x_set according to a selected_features in the above step and name the columns of x_set per selected_features.  
11. Read descriptive activity names to be included in a final set.
12. Merge activity labels with y_set. This step will allocate a label to an appropriate activity_id because we merge by V1 which represents activity id.
13. Rename columns in a y_set to activity_id and activity where they are reflective of id and actual name respectively.
14. Bind y_set, subject_data, and x_set
15. Load reshape2 library to transform the dataset produced by step 14.
16. From the data set in step 15, create a second, independent tidy data set with the average of each variable for each activity and each subject.