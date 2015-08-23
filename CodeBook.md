#Getting and Cleaning Data Course project

##Explaining the "run_analysis.R" script

*After reading the data into R the data are merged with rbind(). 
*Subsetting the collumns that contain the mean() and std(). 
*Changing the names of the collumns to the feature names, "Activity" and "subjectID".
*Merging all the data together using cbind().
*With ddply() from the plyr packaged a new dataset is created with 180 rows(30 observations  x 60 activities and their means for the different features.
*A new dataset is created with write.table() and the tidy dataset.

##Explaining the variables

*temp_test_ID,temp_train_ID are the IDs of the observations for the two datasets. temp_ID is the merged variable containing these two variables.
*temp_test_x,temp_train_x are the times of different features of the measured observations. temp_x is the merged variable containing these two variables.
*temp_test_Y,temp_train_Y are the activities perfomed for each measurement. temp_Y is the merged variable containing these two variables.
*feature_names contains the names of the features that are measured.
*mean_std_features is a vector that has the positions of the mean and std values we want from the feature_names variable.
*merged_data is the complete dataset with the collumns we want.
*tidy_dataset is the a tidied dataset with the average of each variable for each activity and each subject.