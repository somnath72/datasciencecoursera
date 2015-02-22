rm(list=ls())
setwd("D:/Nijer/Somnath/Somnath/Books_Pers/MISC - VERY USEFUL/Backed Up/COURSERA/JHDSS - John Hopkins Course/3 - Getting and Cleaning Data/Course Project")

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
mergedData <- rbind(trainData, testData)
mergedLabel <- rbind(trainLabel, testLabel)
mergedSubject <- rbind(trainSubject, testSubject)


features <- read.table("./UCI HAR Dataset/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
mergedData <- mergedData[, meanStdIndices]
names(mergedData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(mergedData) <- gsub("mean", "Mean", names(mergedData))
names(mergedData) <- gsub("std", "Std", names(mergedData))
names(mergedData) <- gsub("-", "", names(mergedData))


activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[mergedLabel[, 1], 2]
mergedLabel[, 1] <- activityLabel
names(mergedLabel) <- "activity"


names(mergedSubject) <- "subject"
clensedData <- cbind(mergedSubject, mergedLabel, mergedData)
write.table(clensedData, "merged_data.txt") # write out the 1st dataset
View(clensedData)

subLength <- length(table(mergedSubject)) # 30
actLength <- dim(activity)[1] # 6
columnLen <- dim(clensedData)[2]
finalResult <- matrix(NA, nrow=subLength*actLength, ncol=columnLen) 
finalResult <- as.data.frame(finalResult)
colnames(finalResult) <- colnames(clensedData)
row <- 1
for(i in 1:subLength) {
    for(j in 1:actLength) {
        finalResult[row, 1] <- sort(unique(mergedSubject)[, 1])[i]
        finalResult[row, 2] <- activity[j, 2]
        bool1 <- i == clensedData$subject
        bool2 <- activity[j, 2] == clensedData$activity
        finalResult[row, 3:columnLen] <- colMeans(clensedData[bool1&bool2, 3:columnLen])
        row <- row + 1
    }
}
head(finalResult)
write.table(finalResult, "data_with_means.txt", row.name=FALSE) # write out the 2nd dataset
View(finalResult)
finalData <- read.table("data_with_means.txt")
View(finalData)
