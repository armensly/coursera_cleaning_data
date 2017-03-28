Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeDomainAcc-XYZ and timeDomainGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeDomainBodyAcc-XYZ and timeDomainGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeDomainBodyAccJerk-XYZ and timeDomainBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeDomainBodyAccMag, timeDomainGravityAccMag, timeDomainBodyAccJerkMag, timeDomainBodyGyroMag, timeDomainBodyGyroJerkMag). 

Then, a Fast Fourier Transform (FFT) was applied to some of these signals producing freqDomainBodyAcc-XYZ, freqDomainBodyAccJerk-XYZ, freqDomainBodyGyro-XYZ, freqDomainBodyAccJerkMag, freqDomainBodyGyroMag, freqDomainBodyGyroJerkMag.

Finally the set of variables that were estimated from these signals and stored in the dataset are:
mean(): Mean value
std(): Standard deviation

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Additionally, two other features are recorded in the dataset:
"subject", which is an integer between 1 to 30 and represents an ID number for the person on whom the data were recorded. 
"activity", which is one of the following values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

A complete list of features in the dataset (as explained above) is listed here:

timeDomainBodyAccmeanX 
timeDomainBodyAccmeanY 
timeDomainBodyAccmeanZ 

timeDomainBodyAccstdX 
timeDomainBodyAccstdY 
timeDomainBodyAccstdZ 

timeDomainGravityAccmeanX 
timeDomainGravityAccmeanY 
timeDomainGravityAccmeanZ 

timeDomainGravityAccstdX 
timeDomainGravityAccstdY 
timeDomainGravityAccstdZ 

timeDomainBodyAccJerkmeanX 
timeDomainBodyAccJerkmeanY 
timeDomainBodyAccJerkmeanZ 

timeDomainBodyAccJerkstdX 
timeDomainBodyAccJerkstdY 
timeDomainBodyAccJerkstdZ 

timeDomainBodyGyromeanX 
timeDomainBodyGyromeanY 
timeDomainBodyGyromeanZ 

timeDomainBodyGyrostdX 
timeDomainBodyGyrostdY 
timeDomainBodyGyrostdZ 

timeDomainBodyGyroJerkmeanX 
timeDomainBodyGyroJerkmeanY 
timeDomainBodyGyroJerkmeanZ 

timeDomainBodyGyroJerkstdX 
timeDomainBodyGyroJerkstdY 
timeDomainBodyGyroJerkstdZ 

timeDomainBodyAccMagmean 
timeDomainBodyAccMagstd 

timeDomainGravityAccMagmean 
timeDomainGravityAccMagstd 

timeDomainBodyAccJerkMagmean 
timeDomainBodyAccJerkMagstd 

timeDomainBodyGyroMagmean 
timeDomainBodyGyroMagstd 

timeDomainBodyGyroJerkMagmean 
timeDomainBodyGyroJerkMagstd 

freqDomainBodyAccmeanX 
freqDomainBodyAccmeanY 
freqDomainBodyAccmeanZ 

freqDomainBodyAccstdX 
freqDomainBodyAccstdY 
freqDomainBodyAccstdZ 

freqDomainBodyAccJerkmeanX 
freqDomainBodyAccJerkmeanY 
freqDomainBodyAccJerkmeanZ 

freqDomainBodyAccJerkstdX 
freqDomainBodyAccJerkstdY 
freqDomainBodyAccJerkstdZ 

freqDomainBodyGyromeanX 
freqDomainBodyGyromeanY 
freqDomainBodyGyromeanZ 

freqDomainBodyGyrostdX 
freqDomainBodyGyrostdY 
freqDomainBodyGyrostdZ 

freqDomainBodyAccMagmean 
freqDomainBodyAccMagstd 

freqDomainBodyBodyAccJerkMagmean 
freqDomainBodyBodyAccJerkMagstd 

freqDomainBodyBodyGyroMagmean 
freqDomainBodyBodyGyroMagstd 

freqDomainBodyBodyGyroJerkMagmean 
freqDomainBodyBodyGyroJerkMagstd 

subject 

acitivity
