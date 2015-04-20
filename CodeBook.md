#CodeBook

This is the code book for run_analysis.R and the data set is from this url "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "  

##Prepare all the data
load all the text files under directory "UCI HAR Dataset" into R  
and name the data based on file name,such as xtrain

##Part 1 - Merges the training and the test sets to create one data set.
1.Use rbind to merge x values in train and test, and label colnames with feature values  
2.Use rbind to merge y values in train and test, and lable colnames as activity  
3.Use rbind to merge subject values in train and test, and lable colnames as subject  
4.Use cbind to merge all the binded x,y,subject values into a dataset

##Part 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
Use grep to find all the mean and std measurements  
The extracted data is called selectdata

##Part 3 - Uses descriptive activity names to name the activities in the data set
Use the plyr package, and map the activitylabels values to the activity column in dataset

##Part 4 - Appropriately labels the data set with descriptive variable names
Since y column is already named activity, and subject column is named subject  
I only changed some colnames in x, substitude names has "BodyBody" with "Body"

##Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use aggrate from plyr package, and easily get the required results,which is called dataset2
Then I sort the dataset2 first in subject order,the in activity order
At last,I write the sorted data into a text file called tidy_data


