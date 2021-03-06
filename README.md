Getting and Cleaning Data - Course project
=============

This repo contains the following files:
<li> dataset1/dataset2.txt files: These are tidy datasets, generated by the code in the repo. dataset1 is the tidy version of the initial dataset, and dataset2 contains summarization of values in dataset1 by taking the mean for each label for each activity. (See below for more detailed explanation).
<li> dataset1/dataset2.tsv files: These are copies of the dataset1.txt and dataset2.txt files. Initially these files were generated but since the assignment submission was asking for txt files, I generated the above files. These can be removed but I decided to keep them, since tsv seems to be a better format.
<li> Code_book_dataset1.md and code_book_dataset2.md: These are the codebooks for each of the datasets listed above. They contain information about the features that are included in the datasets.
<li> run_analysis.R: This file contains the R script used for generation of tidy datasets. This code has plenty of comments and is also explained below.

Explanation of run_analysis.R
=============

This document will go through the steps taken in run_analysis.R file to clean and tidy the dataset obtained from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and generate dataset1 and a to summarize those data in dataset2.

### Generating the tidy dataset (dataset1): ###

**Reading the features (X files) and selecting desired columns:**

We first downloaded and unzipped the data into a local directory, then we open and read the features from X_train.txt and X_test.txt files. The data in these files contain extra space characters, as a result we can not use a simple read.csv or read.table with a single " " separation character to correctly load the data. To overcome this problem we read these file using readLines command where the data is read text lines. We then use the gsub command to replace multiple occurences of space characters in the file, with a single comma (",") character. For this purpose we used the regex " +" to identify a sequence of one or more spaces. We also remove the leading spaces from the lines using trimws() function, before using the gsub on them.

After removing sequences of multiple spaces and forming a string where the values are separated by a comma, we used the read.csv function to read the data into a dataframe. However, rather than writing the cleaned up strings to file and then reading it back, we fed the already read and cleaned lines of strings into the read.csv function. This is made possible by using the "text" parameter of the read.csv function, where rather than giving the name of a file to the read.csv function we give the textual string of data to the function. (i.e. read.csv(text = linesOfData))

After repeating this series of operation for X_train.txt and X_test.txt files, we merge these dataframes using the rbind() function and store the result in mergedData dataframe.

Then we read the feature names from the features.txt file and assign them to the columns of the mergedData dataframe.

We need to keep only the features involving mean and std values. Unfortunately there are columns with similar column names in the data. This is a problem when using the select() function from the dlpyr function. Since we need to use this function, we will need to drop the columns with similar names or to rename them. Since the columns that we are asked to keep are not among the ones with duplicate names, we can simply drop these columns, otherwise we would rename them. To find and drop these columns we use the duplicated() function and simple subsetting techniques.

To select the feature names pertaining to columns for mean and std values, we use grep() and a regex to find all the names that contain mean() or std() in the column names. These desired feature names are stored in the remainingFeatures variable. At this stage we use the select() function and the remiaingFeatures vector to drop all other features from the mergedData dataframe.

**Reading the subjects and labels (y files) and adding them to the dataframe:**

The subjects are simply read using the read.csv() function from the subject_train.txt and subject_test.txt files. Then we merge these subjects using the rbind() function.

The labels are also read using the read.csv() function from the y_train.txt and y_test.txt files and then merged using rbind() function. But these labels are integer numbers (1-6), each representing an activity. These labels are described in activity_labels.txt file. To change this integer representative label to a descriptive value, we read the activiy_labels.txt file and then use a for loop to select each activity label (e.g. STANDING, WALKING, etc.) and change its corresponding value from an integer to its string description.

Now we use generate two new columns in mergedData and assign the read subjects and created activities vector to these new columns.

Finally, to give descriptive names to the columns we perform some minor changes using sub() and gsub() functions on them. The current column names are quite descriptive but we first replace the beginning 't' letter with "timeDomain" and the beginning 'f' letter with "freqDomain" to make the names more comprehensible. Then we remove special characters from the names. This is done by using gsub() and a regex to find comma(,), dash(-) and paranthesis(()) inside the names. The gub() replaces these characters with "" (essentially removing them).

At this point, the dataset1 is ready and we write it to file using write.table() function.

### Generating the second dataset of summary values (dataset2): ###
To generate the summaries dataset, we should average the values for the rows with the same subject and activity. To do this, we group the dataset1 using group_by function of the dplyr library and arguments subject and activity. Then we use the summarize_each function that works on all remaining columns (that the dataframe is not grouped by them) and applies the given function on those columns. In this case we specify the function mean as the argument to the summarize_each function. But because summarize_each accepts a vector of functions, we pass funs(mean) rather than mean.
Finally, we write the generated dataset to file using write.table() function.
