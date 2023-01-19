---
title: "ReadME"
author: "JAGV"
date: '2023-01-19'
output: html_document
---

# Course: Getting and Cleaning data Project.

In this project, a data set created by Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita from the Smartlab - Non Linear Complex Systems Laboratory of the DITEN - Università degli Studi di Genova. For more insights about this data set you can visit [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Context pf the problem: about the data sets.

The data was obtained from an **accelerometer** and a **gyroscope** from which 3-axial (*i.e.* in the $x$, $y$ and $z$ axes) raw signals can be measure. 10299 people were selected and measures were taken as they were wearing a smartphone (Samsung Galaxy S II) on the waist. Those signals were filtered using a median filter and a 3rd order low pass Butterworth filter (using a corner frequency of 20 Hz) to remove noise and also to separate the acceleration signal into two signals: body and gravity acceleration signals. The latter was done by means of another low pass Butterworth filter (using a corner frequency of 0.3 Hz.

The jerk signals were obtained by derivation of the body acceleration and the angular velocity, whereas their magnitud was computed using the Euclidean norm in $\mathbb{R}^3$. In addition, a **Fast Fourier Transform** (*FFT*) was applied to some of these signals, to transform the time domain signals to a frequency domain signals.

## About the code.

The script `run_analysis.R` consist on a single script with several functions used to manipulate the data. 

**The first step** was collecting the data, for which I used the `read.table()` function and store some quantities such as **features**, because they will be used to name the columns when reading the data set, as it can be seen with the use of the `col.names` parameter of the `read.table()` function. This way, both the **train** and **test** variables were created to contain the train and test data, respectively, as well as the labels of the activities, found in the `x_test.txt` and `y_test.txt` files.

**The second step** was the merging of the data sets. For that end, the `rbind` function was used and store the data set in the variable **completedata**. For the activity labels, a similar approach was used and store the labels in the **Activitieslabels** variable.

**The third step** was subsetting the **completedata** set by selecting only the measurements with the `mean` and `std` strings on them. Such measurements are those in the `features.txt` file that have the `mean()` and `std()` strings on them. **Note**: I decided not to include those measurements where the word `mean` was found (e.g. `fBodyAccMag-meanFreq()` and `angle(tBodyGyroMean,gravityMean)`) because according to the `Readme.txt` file of the authors, they where not measured by applying the `mean()` function to the signal. 

The subsetting was done by means of the `select()` and the `grep()` functions, where for the latter the **metacharacter** `mean[.*]|std[.*]` where used to avoid that the search includes cases as the ones mentioned in the previous note.

**The fourth step** consisted on giving descriptive names to the activities. **Note**: I decided no to use periods to splits words, as it was adviced by the instructors of the course. Neverthelesss, they could be removed when you find this special metacharacter. I used the following correspondence to do that:

- 1 was substituted for "walking"
- 2 was substituted for "walkingupstairs"
- 3 was substituted for "walkingdownstairs"
- 4 was substituted for "sitting"
- 5 was substituted for "standing"
- 6 was substituted for "landing"

In the code, this was done by using a **numbercode** variable, with the numbers from 1 to 6, and a **activitylabel** array with the strings mentioned in the bullets. Finally, the `gsub()` function was used to replace the element in **numbercode** for the element in **activitylabel** in the column **V1** of the list **Activitieslabels** created before. This new column with the activities names was added to the data set **subsetdata** using the command `subsetdata$Activities <- Activitieslabels$V1`

**The fifth step** consisted on give appropriate names to the variables. To than end, I used an array with *keywords* to be used to replace with *newwords*. For instance, if the variable begins with `f`, then that indicates that the measurement was reported in a *frequency domain*, and whenever a column name starts with `f`, then the string "in frequency domain" is added to the variable name. You can check the complete explanation of the way to name the variables in the `CodeBook.md` file. A new array, **newnames** is created to store the variable names and is converted to character. The creation of the names was done by using the `for` statement along the `grep` function (to find the indexes where the string is found) and `paste` functions (to create the new names). This creates a "NA " string at the beginning of each name, but it can be easily removed as I will explain soon. The "Activity" column is is created and the `NA`s created by my code were removed via the `gsub` function. With the new variable names, the **subsetdata** data set is then created by changing the names of its columns. 


On the final step, **the sixth step**, we load the `reshape` library to use the `melt` and `dcast` functions. Previous to do that, a subject column is created to provide an ID for the subject in the data set, using the `nrow` function to assure that the number of rows match. A new data set, called **AvgData** is created using the `cbind` function to have the **subject** ID in the first column of the data set. To reshape the data, I used the melt function with parameters `id = ` the **subject** and **Activity** variables and `measure.vars = ` the rest of variables in the **AvgData** data set. The required tidy data set, **TidyAvgData** was obtained by using the `dcast` function and it is created by the `write.csv` function.
