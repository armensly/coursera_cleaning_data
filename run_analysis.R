# This file cleans the dataset for programming assignment of the Getting and Cleaning Data 
# course on Coursera. It first tidies the data and then generates and writes to file a 
# second dataset where the values are averaged for all features based on two of the columns.

# reading the training data features (X_train)
trainDataText <- readLines("UCI HAR Dataset/train/X_train.txt")
trainDataText <- gsub(" +", ",", trimws(trainDataText))
trainData <- read.csv(text = trainDataText, header = FALSE)
rm(trainDataText)

# reading the test data features (X_test)
testDataText <- readLines("UCI HAR Dataset/test/X_test.txt")
testDataText <- gsub(" +", ",", trimws(testDataText))
testData <- read.csv(text = testDataText, header = FALSE)
rm(testDataText)

# combining training and test features
mergedData <- rbind(trainData, testData)
rm(trainData, testData)

# reading the feature names from the file and assign them to the data frame columns
featureNames <- read.csv("UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
names(mergedData) <- featureNames[,2]
rm(featureNames)

# Remove the columns with duplicate names (e.g. column 317 and 331)
# Luckily none of std/mean columns have repeated names!
mergedData <- mergedData[, !duplicated(names(mergedData))]

# Select only the column with mean or std values, (identified by mean() and std() in the column name)
remainingFeatures <- grep("mean\\(\\)|std\\(\\)", names(mergedData))
mergedData <- dplyr::select(mergedData, remainingFeatures)
rm(remainingFeatures)

# Reading the subjects for train and test sets
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subjects <- rbind(trainSubjects, testSubjects)
rm(trainSubjects, testSubjects)

# Reading the labels for train and test sets
trainLabels <- read.table(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE)
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
labels <- rbind(trainLabels, testLabels)
rm(trainLabels, testLabels)

# Changing the labels to descriptive acitivity name
labelTexts <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE)
for (i in 1:nrow(labelTexts)) {
        labels[labels$V1 == i, 1] <- as.character(labelTexts[i, 2])
}
labels$V1 <- as.factor(labels$V1)
rm(labelTexts)

# Binding the subjects and labels to the feature data
mergedData$subject <- subjects$V1
mergedData$acitivity <- labels$V1
rm(subjects, labels)

# The variable names are descriptive with the exception of 't' and 'f' prefixes.
# We change the t prefix to 'timeDomain' and 'f' prefix to 'freqDomain' for clarity
# We also remove , - ( and ) characters and change the names to lower case letters
names(mergedData) <- sub("^t", "timeDomain", names(mergedData))
names(mergedData) <- sub("^f", "freqDomain", names(mergedData))
names(mergedData) <- gsub(",|-|\\(|\\)","", names(mergedData))

# Write the dataset to file
write.table(mergedData, "dataset1.tsv", row.names = FALSE, quote = FALSE)

##########################################################################################
# Creating the second dataset:
library(dplyr)
dataBySubjectActivity <- group_by(mergedData, subject, acitivity)
summarizedData <- summarize_each(dataBySubjectActivity, funs(mean))
write.table(summarizedData, "dataset2.tsv", row.names = FALSE, quote = FALSE)