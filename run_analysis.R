##load all data into R
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
subjtrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
subjtest<-read.table("UCI HAR Dataset/test/subject_test.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activitylables<-read.table("UCI HAR Dataset/activity_labels.txt")

##merge x value in train and test, and colnames to be feature values
x<-rbind(xtrain,xtest)
names(x)<-features[,2]

##merge y value in train and test,and colnames called activity
activity<-rbind(ytrain,ytest)
names(activity)<-"activity"

##merge subject value in train and test,and colnames called subject
subject<-rbind(subjtrain,subjtest)
names(subject)<-"subject"

##Merges the training and the test sets to create one data set called dataset
dataset<-cbind(x,activity,subject)

##extracts only the measurements on the mean and std,extracted dataset called selectdata
selectdata<-dataset[,grep("mean\\(\\)|std\\(\\)",names(dataset))]

##use descriptive activities to name the activities in the selected dataset
library(plyr)
dataset$activity<-mapvalues(dataset$activity,from = activitylables$V1,to = as.character(activitylables$V2))

##appropriately labels the dataset with descriptive variables names
##activity and subject are done above
names(dataset)<-gsub("BodyBody","Body",names(dataset))

##create a second,independent tidy data set
##with the average of each variable for eacn activity and each subject
dataset2<-aggregate(.~subject+activity,dataset,mean)
dataset2<-dataset2[order(dataset2$subject,dataset2$activity),]

##create a new text file with new tidy data
write.table(dataset2,file = "tidy_data.txt",row.names = F)
