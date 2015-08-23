#sourcing the plyr package for later use
library(plyr)
#reading the train and test data
temp_test_ID <-read.table("test/subject_test.txt") ;temp_test_x <-read.table("test/X_test.txt") ;temp_test_Y <-read.table("test/Y_test.txt")

temp_train_ID <-read.table("train/subject_train.txt") ;temp_train_x <-read.table("train/X_train.txt") ; temp_train_Y <-read.table("train/Y_train.txt")
#merging the data sets

temp_ID<-rbind(temp_test_ID,temp_train_ID)
temp_x<-rbind(temp_test_x,temp_train_x)
temp_Y<-rbind(temp_test_Y,temp_train_Y)

#read the features file and the activity labels
feature_names<-read.table("features.txt") ;activity_labels<-read.table("activity_labels.txt")
#find the mean and std features
mean_std_features<-grep("-(mean|std)\\(\\)",feature_names[,2])
#get the columns we want from the x dataset
temp_x<-temp_x[,mean_std_features]
#correcting columns and activity names
names(temp_x)<-feature_names[mean_std_features,2]
names(temp_Y)<-"Activity"
names(temp_ID)<-"SubjectID"
temp_Y[,1]<-activity_labels[temp_Y[,1],2]
#merge all the datasets together
merged_data<-cbind(temp_ID,temp_Y,temp_x)
#final step- create the tidy dataset with the averages and write the file
tidy_dataset<-ddply(merged_data,.(Activity,SubjectID),function(x)colMeans(x[,3:68]))
write.table(tidy_dataset,file="tidy_dataset.txt",row.name=FALSE)
