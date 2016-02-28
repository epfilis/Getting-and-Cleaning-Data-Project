Getting and Cleaning Data Project
Efthimios P. Filis

Objective: 

This is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

The Data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Variables:
found 561 variables for the x test set and 1 variable across the y test set.  Same number of columns indicates the use of the rbind function when merging the data
in the x and y sets.

Transformations to the data:
1. Read the data into R for form the following data sets:

actlabels
features
xtest
ytestsubtest
xtrain
ytrain
subtrain

2. Merge the taining and the test sets into one data set using the rbind function.
xmerged<-rbind(xtrain,xtest)
ymerged<-rbind(ytrain,ytest)
submerged<-rbind(subtrain,subtest)
mergeall<-cbind(submerged,ymerged,xmerged)

3. apply column names using the provided features.txt file

4. Extract only the measurements on the mean and standard deviation for each measurement.
Use of the grep function to create the NewData and NewData2 data tables

