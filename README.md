# Project-Getting-and-Cleaning-Data-

1) Initially I am reading the files from the train data set.

2) y-train.txt has the Activities with Numbers.
I am using the file activity_labels.txt to exchange the numbers with words.

3)From the train data set I eventually have 3 data frames (Activities, Meseurements (X-train.txt) and Subject Ids (subject_train.txt)).

4) I make one data frame by cbind the above data frames.

5) I am reading the column names from the file feature.txt and I am using for loop to add a name on every column.

6) I reapeat the same procedure for the test data set. (step 1-5)

7) I join the two big tables with rbind since the Subjects can fit together (One set has 1,3,5 for example and the other 2,4,6)

8)Now that I have the big table I use "grep" to find all the columns with mean or std on their name (2 diferent data frames)

9)I join the above data Frames with the data frame (1X1) for Activities and (1X1) Subjects.

10) This is a (10,2999 X 81) data frame

11) I am using brute force to rename the column (There is a better way for this I am working on it)

12) I summarize the column by Subjects and Activities using
" ddply(new_table, c("Activities", "Subjects"), numcolwise(mean)) "

13) The final table is 180 X 81


Activities: Name of activities
Subjects: Subject ID
Name conversion: 
B -> Book
A -> Acc
J -> Jerk
Gravity -> GR
mean -> m
Gyro -> G

example tBA-m-Z -> tBodyAcc-mean-Z

Units:
If the name contains Acc (acceleralion), m/s^2
If the name contain G (Triaxial Angular velocity), m/s^2
