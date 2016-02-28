## You should create one R script called run_analysis.R that does the following.

## Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement.
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names.
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# read into R
actlabels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
xtest<-read.table("./test/X_test.txt")
ytest<-read.table("./test/y_test.txt")
subtest<-read.table("./test/subject_test.txt")
xtrain<-read.table("./train/X_train.txt")
ytrain<-read.table("./train/y_train.txt")
subtrain<-read.table("./train/subject_train.txt")

# Merges the training and the test sets to create one data set
xmerged<-rbind(xtrain,xtest)
ymerged<-rbind(ytrain,ytest)
submerged<-rbind(subtrain,subtest)
mergeall<-cbind(submerged,ymerged,xmerged)

# Extracts only the measurements on the mean and standard deviation for each measurement.
# first, create column names for mergeall dataset

featurename<-as.character(features[,2])
newcolumns<-c("subject","activity",featurename)
colnames(mergeall)<-newcolumns

# then, create the new data frame based on mean and std
omeans<-grep("mean()", colnames(mergeall))
ostd<-grep("std()",colnames(mergeall))
newcolumns2<-c(omeans,ostd)
newcolumns2sort<-sort(newcolumns2)
NewData<-mergeall[,c(1,2,newcolumns2sort)]
NewData2<-NewData[,!grepl("Freq",colnames(NewData))]

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata<-data.frame()
for (i in 1:30) {
  subject<-subset(NewData2,subject==i)
  for (j in 1:6) {
    actvi<-subset(subject,activity==j)
    result<-as.vector(apply(actvi,2,mean))
    tidydata<-rbind(tidydata,result)
  }
}

colnames(tidydata)<-colnames(NewData2)
levels(tidydata[,2])<-c('walking','walking_upstairs','walking_downstairs','sitting','standing','laying')
write.table(tidydata,file='SamgsungGalaxy_data.txt', sep = " ")





