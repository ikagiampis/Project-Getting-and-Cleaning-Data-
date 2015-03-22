library(plyr)
library(dplyr)
library(reshape)


#Read the files at the train data set 
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

subjectTrain <- tbl_df(subject_train)
XTrain <- tbl_df(X_train)

#Change the number with "word" activities in the Activities column (y_train.txt)
colnames(y_train)[1] <- "Activities"
activities.code <- c(WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4,  STANDING=5, LAYING=6)
y_train$Activities <- names(activities.code)[match(y_train$Activities, activities.code)]


#1) merge the list of subjects (sublectTrain) with the activities (Xtrain) at the train data set
XTrainSubject <- cbind(XTrain, subjectTrain)

#2) merge the list XtrainSubject with the type of activities (y_train) at train data set
XTrainSubjectActivities <- cbind(XTrainSubject, y_train)

#Give name for the column we added above
colnames(XTrainSubjectActivities)[562] <- "Subjects"
#colnames(XTrainSubjectActivities)[563] <- "Activities"

#Read the file with the column names (feature.txt)
column_name<-read.table("UCI HAR Dataset/features.txt")
#colName <- tbl_df(column_name)

#loop at the names from the file features.txt and add the name to the column
colName <- column_name$V2
i <- 1
for(i in 1:nrow(column_name)){
  name <- colName[i]
  name <- as.character(name)
  colnames(XTrainSubjectActivities)[i] <- name
  i <- i + 1
}

#View(XTrainSubjectActivities)
#View(colnames(XTrainSubjectActivities))
#----------------------------------------------------------------------------
#Do the same for the test data set
#Read the files at the test data set 
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

subjectTest <- tbl_df(subject_test)
XTest <- tbl_df(X_test)

#Change the number with "word" activities in the Activities column (y_train.txt)
colnames(y_test)[1] <- "Activities"
activities.code <- c(WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4,  STANDING=5, LAYING=6)
y_test$Activities <- names(activities.code)[match(y_test$Activities, activities.code)]

#1) merge the list of subjects (sublectTrain) with the activities (Xtrain) at the train data set
XTestSubject <- cbind(XTest, subjectTest)

#2) merge the list XtrainSubject with the type of activities (y_train) at train data set
XTestSubjectActivities <- cbind(XTestSubject, y_test)

#Give name for the column we added above
colnames(XTestSubjectActivities)[562] <- "Subjects"
colnames(XTestSubjectActivities)[563] <- "Activities"

#loop at the names from the file features.txt and add the name to the column
i <- 1
for(i in 1:nrow(column_name)){
  name <- colName[i]
  name <- as.character(name)
  colnames(XTestSubjectActivities)[i] <- name
  i <- i + 1
}

#View(XTestSubjectActivities)
#View(colnames(XTestSubjectActivities))
#--------------------------------------------------------------------------------
#Merging the tables
final_data <- rbind(XTrainSubjectActivities, XTestSubjectActivities)
#View(final_data)

#Chossing the column names that contains mean or std or Activities or Subjects
meanTable <- (final_data[ , grep("mean", colnames(final_data)) ])
stdTable <- (final_data[ , grep("std", colnames(final_data)) ])
Activities <- (final_data[ , grep("Activities", colnames(final_data)) ])
Subjects <- (final_data[ , grep("Subjects", colnames(final_data)) ])

#Join everything together
new_table <- cbind(meanTable, stdTable,Activities, Subjects)


#colnames(new_table)[79] <- "fBBGrJMagstd"
colnames(new_table)[1] <-  "tBA-m-X"
colnames(new_table)[2] <-	"tBA-m-Y"
colnames(new_table)[3] <-	"tBA-m-Z"
colnames(new_table)[4] <-	"tGRA-m-X"
colnames(new_table)[5] <-	"tGRA-m-Y"
colnames(new_table)[6] <-	"tGRA-m-Z"
colnames(new_table)[7] <-	"tBAJ-m-X"
colnames(new_table)[8] <-	"tBAJ-m-Y"
colnames(new_table)[9] <-	"tBAJ-m-Z"
colnames(new_table)[10] <-	"tBG-m-X"
colnames(new_table)[11] <-	"tBG-m-Y"
colnames(new_table)[12] <-	"tBG-m-Z"
colnames(new_table)[13] <-	"tBGJ-m-X"
colnames(new_table)[14] <-	"tBGJ-m-Y"
colnames(new_table)[15] <-	"tBGJ-m-Z"
colnames(new_table)[16] <-	"tBAMag-m"
colnames(new_table)[17] <-	"tGRAMag-m"
colnames(new_table)[18] <-	"tBAJMag-m"
colnames(new_table)[19] <-	"tBGMag-m"
colnames(new_table)[20] <-	"tBGJMag-m"
colnames(new_table)[21] <-	"fBA-m-X"
colnames(new_table)[22] <-	"fBA-m-Y"
colnames(new_table)[23] <-	"fBA-m-Z"
colnames(new_table)[24] <-	"fBA-mFreq-X"
colnames(new_table)[25] <-	"fBA-mFreq-Y"
colnames(new_table)[26] <-	"fBA-mFreq-Z"
colnames(new_table)[27] <-	"fBAJ-m-X"
colnames(new_table)[28] <-	"fBAJ-m-Y"
colnames(new_table)[29] <-	"fBAJ-m-Z"
colnames(new_table)[30] <-	"fBAJ-mFreq-X"
colnames(new_table)[31] <-	"fBAJ-mFreq-Y"
colnames(new_table)[32] <-	"fBAJ-mFreq-Z"
colnames(new_table)[33] <-	"fBG-m-X"
colnames(new_table)[34] <-	"fBG-m-Y"
colnames(new_table)[35] <-	"fBG-m-Z"
colnames(new_table)[36] <-	"fBG-mFreq-X"
colnames(new_table)[37] <-	"fBG-mFreq-Y"
colnames(new_table)[38] <-	"fBG-mFreq-Z"
colnames(new_table)[39] <-	"fBAMag-m"
colnames(new_table)[40] <-	"fBAMag-mFreq"
colnames(new_table)[41] <-	"fBBAJMag-m"
colnames(new_table)[42] <-	"fBBAJMag-mFreq"
colnames(new_table)[43] <-	"fBBGMag-m"
colnames(new_table)[44] <-	"fBBGMag-mFreq"
colnames(new_table)[45] <-	"fBBGJMag-m"
colnames(new_table)[46] <-	"fBBGJMag-mFreq"
colnames(new_table)[47] <-	"tBA-std-X"
colnames(new_table)[48] <-	"tBA-std-Y"
colnames(new_table)[49] <-	"tBA-std-Z"
colnames(new_table)[50] <-	"tGRA-std-X"
colnames(new_table)[51] <-	"tGRA-std-Y"
colnames(new_table)[52] <-	"tGRA-std-Z"
colnames(new_table)[53] <-	"tBAJ-std-X"
colnames(new_table)[54] <-	"tBAJ-std-Y"
colnames(new_table)[55] <-	"tBAJ-std-Z"
colnames(new_table)[56] <-	"tBG-std-X"
colnames(new_table)[57] <-	"tBG-std-Y"
colnames(new_table)[58] <-	"tBG-std-Z"
colnames(new_table)[59] <-	"tBGJ-std-X"
colnames(new_table)[60] <-	"tBGJ-std-Y"
colnames(new_table)[61] <-	"tBGJ-std-Z"
colnames(new_table)[62] <-	"tBAMag-std"
colnames(new_table)[63] <-	"tGRAMag-std"
colnames(new_table)[64] <-	"tBAJMag-std"
colnames(new_table)[65] <-	"tBGMag-std"
colnames(new_table)[66] <-	"tBGJMag-std"
colnames(new_table)[67] <-	"fBA-std-X"
colnames(new_table)[68] <-	"fBA-std-Y"
colnames(new_table)[69] <-	"fBA-std-Z"
colnames(new_table)[70] <-	"fBAJ-std-X"
colnames(new_table)[71] <-	"fBAJ-std-Y"
colnames(new_table)[72] <-	"fBAJ-std-Z"
colnames(new_table)[73] <-	"fBG-std-X"
colnames(new_table)[74] <-	"fBG-std-Y"
colnames(new_table)[75] <-	"fBG-std-Z"
colnames(new_table)[76] <-	"fBAMag-std"
colnames(new_table)[77] <-	"fBBAJMag-std"
colnames(new_table)[78] <-	"fBBGMag-std"
colnames(new_table)[79] <-	"fBBGJMag-std"


new_table <- as.data.frame(new_table)

finalTable <- ddply(new_table, c("Activities", "Subjects"), numcolwise(mean))

View(finalTable)

write.csv(finalTable, file = "finalTable.txt")
