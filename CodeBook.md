---
title: "CodeBook"
author: "JAGV"
date: '2023-01-18'
output: html_document
---

This code book is intended to explain everything about the course project for the course *Getting and cleaning data*. 

In this project, a data set created by Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita from the Smartlab - Non Linear Complex Systems Laboratory of the DITEN - Università degli Studi di Genova. For more insights about this data set you can visit [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

# Description of the variables

The data was obtained from an **accelerometer** and a **gyroscope** from which 3-axial (*i.e.* in the $x$, $y$ and $z$ axes) raw signals can be measure. 10299 people were selected and measures were taken as they were wearing a smartphone (Samsung Galaxy S II) on the waist. Those signals were filtered using a median filter and a 3rd order low pass Butterworth filter (using a corner frequency of 20 Hz) to remove noise and also to separate the acceleration signal into two signals: body and gravity acceleration signals. The latter was done by means of another low pass Butterworth filter (using a corner frequency of 0.3 Hz.

The jerk signals were obtained by derivation of the body acceleration and the angular velocity, whereas their magnitud was computed using the Euclidean norm in $\mathbb{R}^3$. In addition, a **Fast Fourier Transform** (*FFT*) was applied to some of these signals, to transform the time domain signals to a frequency domain signals.

Almost all variable names (except the "Activities" variable) were named, in order to be descriptive, according to the syntaxis:

\[
[Function][Measurement]\text{in}[Domain]\text{domain in the}[Axis]\text{axis}
\]

where: 

- "*Function*" can be `mean()` or `std()`, the **mean** or **standard deviation** of the measurement "*Measurement*" in the domain "*Domain*" in the axis "*Axis*".
- "*Measurement*" is the measurement taken with the accelerometer or gyroscope, and can be "body acceleration", "gravity acceleration", "body acceleration jerk", "body angular velocity" or "body angular velocity jerk".  
- "*Domain*", can be "**time**" or "**frequency**", according to the domain of the signal.  
- "*Axis*" can be $x$, $y$ or $z$ according to the axis where the measurement was taken. 

The list of the $66$ variables obtained (please note that I have used white spaces to make the names readable even though they are not suggested to be used in variable names, because they can be removed easily with the `strip()` function) with this syntaxis is then: 

- **mean body acceleration in time domain in x axis** stands for the mean body acceleration in time domain in the $x$ axis.
- **mean body acceleration in time domain in y axis** stands for the mean body acceleration in time domain in the $y$ axis.
- **mean body acceleration in time domain in z axis** stands for the mean body acceleration in time domain in the $z$ axis.
- **standard deviation body acceleration in time domain in x axis** stands for the standard deviation of the body acceleration in time domain in the $x$ axis.
- **standard deviation body acceleration in time domain in y axis** stands for the standard deviation of the body acceleration in time domain in the $y$ axis.
- **standard deviation body acceleration in time domain in z axis** stands for the standard deviation of the body acceleration in time domain in the $z$ axis.

- **mean body acceleration in frequency domain in x axis** stands for the mean body acceleration in frequency domain in the $x$ axis.
- **mean body acceleration in frequency domain in y axis** stands for the mean body acceleration in frequency domain in the $y$ axis.
- **mean body acceleration in frequency domain in z axis** stands for the mean body acceleration in frequency domain in the $z$ axis.
- **standard deviation body acceleration in frequency domain in x axis** stands for the standard deviation of the body acceleration in frequency domain in the $x$ axis.
- **standard deviation body acceleration in frequency domain in y axis** stands for the standard deviation of the body acceleration in frequency domain in the $y$ axis.
- **standard deviation body acceleration in frequency domain in z axis** stands for the standard deviation of the body acceleration in frequency domain in the $z$ axis.
- **mean gravity acceleration in time domain in x axis** stands for the mean gravity acceleration in time domain in the $x$ axis.
- **mean gravity acceleration in time domain in y axis** stands for the mean gravity acceleration in time domain in the $y$ axis.
- **mean gravity acceleration in time domain in z axis** stands for the mean gravity acceleration in time domain in the $z$ axis.
- **standard deviation gravity acceleration in time domain in x axis** stands for the standard deviation of the gravity acceleration in time domain in the $x$ axis.
- **standard deviation gravity acceleration in time domain in y axis** stands for the standard deviation of the gravity acceleration in time domain in the $y$ axis.
- **standard deviation gravity acceleration in time domain in z axis** stands for the standard deviation of the gravity acceleration in time domain in the $z$ axis.
- **mean body acceleration jerk in time domain in x axis** stands for the mean body acceleration jerk in time domain in the $x$ axis.
- **mean body acceleration jerk in time domain in y axis** stands for the mean body acceleration jerk in time domain in the $y$ axis.
- **mean body acceleration jerk in time domain in z axis** stands for the mean body acceleration jerk in time domain in the $z$ axis.
- **standard deviation body acceleration jerk in time domain in x axis** stands for the standard deviation of the body acceleration jerk in time domain in the $x$ axis.
- **standard deviation body acceleration jerk in time domain in y axis** stands for the standard deviation of the body acceleration jerk in time domain in the $y$ axis.
- **standard deviation body acceleration jerk in time domain in z axis** stands for the standard deviation of the body acceleration jerk in time domain in the $z$ axis.
- **mean body acceleration jerk in frequency domain in x axis** stands for the mean body acceleration jerk in frequency domain in the $x$ axis.
- **mean body acceleration jerk in frequency domain in y axis** stands for the mean body acceleration jerk in frequency domain in the $y$ axis.
- **mean body acceleration jerk in frequency domain in z axis** stands for the mean body acceleration jerk in frequency domain in the $z$ axis.
- **standard deviation body acceleration jerk in frequency domain in x axis** stands for the standard deviation of the body acceleration jerk in frequency domain in the $x$ axis.
- **standard deviation body acceleration jerk in frequency domain in y axis** stands for the standard deviation of the body acceleration jerk in frequency domain in the $y$ axis.
- **standard deviation body acceleration jerk in frequency domain in z axis** stands for the standard deviation of the body acceleration jerk in frequency domain in the $z$ axis.

- **mean body angular velocity in time domain in x axis** stands for the mean body angular velocity in time domain in the $x$ axis.
- **mean body angular velocity in time domain in y axis** stands for the mean body angular velocity in time domain in the $y$ axis.
- **mean body angular velocity in time domain in z axis** stands for the mean body angular velocity in time domain in the $z$ axis.
- **standard deviation body angular velocity in time domain in x axis** stands for the standard deviation of the body angular velocity in time domain in the $x$ axis.
- **standard deviation body angular velocity in time domain in y axis** stands for the standard deviation of the body angular velocity in time domain in the $y$ axis.
- **standard deviation body angular velocity in time domain in z axis** stands for the standard deviation of the body angular velocity in time domain in the $z$ axis.

- **mean body angular velocity in frequency domain in x axis** stands for the mean body angular velocity in frequency domain in the $x$ axis.
- **mean body angular velocity in frequency domain in y axis** stands for the mean body angular velocity in frequency domain in the $y$ axis.
- **mean body angular velocity in frequency domain in z axis** stands for the mean body angular velocity in frequency domain in the $z$ axis.
- **standard deviation body angular velocity in frequency domain in x axis** stands for the standard deviation of the body angular velocity in frequency domain in the $x$ axis.
- **standard deviation body angular velocity in frequency domain in y axis** stands for the standard deviation of the body angular velocity in frequency domain in the $y$ axis.
- **standard deviation body angular velocity in frequency domain in z axis** stands for the standard deviation of the body angular velocity in frequency domain in the $z$ axis.
- **mean body angular velocity jerk in time domain in x axis** stands for the mean body angular velocity jerk in time domain in the $x$ axis.
- **mean body angular velocity jerk in time domain in y axis** stands for the mean body angular velocity jerk in time domain in the $y$ axis.
- **mean body angular velocity jerk in time domain in z axis** stands for the mean body angular velocity jerk in time domain in the $z$ axis.
- **standard deviation body angular velocity jerk in time domain in x axis** stands for the standard deviation of the body angular velocity jerk in time domain in the $x$ axis.
- **standard deviation body angular velocity jerk in time domain in y axis** stands for the standard deviation of the body angular velocity jerk in time domain in the $y$ axis.
- **standard deviation body angular velocity jerk in time domain in z axis** stands for the standard deviation of the body angular velocity jerk in time domain in the $z$ axis.
- **mean body acceleration magnitude in time domain** stands for the mean body acceleration magnitude in time domain.
- **standard deviation body acceleration magnitude in time domain** stands for the standard deviation of the body acceleration magnitude in time domain.
- **mean body acceleration magnitude in frequency domain** stands for the mean body acceleration magnitude in frequency domain.
- **standard deviation body acceleration magnitude in frequency domain** stands for the standard deviation of the body acceleration magnitude in frequency domain.
- **mean gravity acceleration magnitude in time domain** stands for the mean gravity acceleration magnitude in time domain.
- **standard deviation gravity acceleration magnitude in time domain** stands for the standard deviation of the gravity acceleration magnitude in time domain.
- **mean body acceleration jerk magnitude in time domain** stands for the mean body acceleration jerk magnitude in time domain.
- **standard deviation body acceleration jerk magnitude in time domain** stands for the standard deviation of the body acceleration jerk magnitude in time domain.
- **mean body acceleration jerk magnitude in frequency domain** stands for the mean body acceleration jerk magnitude in frequency domain.
- **standard deviation body acceleration jerk magnitude in frequency domain** stands for the standard deviation of the body acceleration jerk magnitude in frequency domain.
- **mean body angular velocity magnitude in time domain** stands for the mean body angular velocity magnitude in time domain.
- **standard deviation body angular velocity magnitude in time domain** stands for the standard deviation of the body angular velocity magnitude in time domain.
- **mean body angular velocity magnitude in frequency domain** stands for the mean body angular velocity magnitude in frequency domain.
- **standard deviation body angular velocity magnitude in frequency domain** stands for the standard deviation of the body angular velocity magnitude in frequency domain.
- **mean body angular velocity jerk magnitude in time domain** stands for the mean body angular velocity jerk magnitude in time domain.
- **standard deviation body angular velocity jerk magnitude in time domain** stands for the standard deviation of the body angular velocity jerk magnitude in time domain.
- **mean body angular velocity jerk magnitude in frequency domain** stands for the mean body angular velocity jerk magnitude in frequency domain.
- **standard deviation body angular velocity jerk magnitude in frequency domain** stands for the standard deviation of the body angular velocity jerk magnitude in frequency domain.

And finally, the variable 

- **Activities** which depicts the activity being done by the user of the phone when the measurement was taken.
