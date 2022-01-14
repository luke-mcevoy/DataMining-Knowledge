
###  Company  : Stevens 
#  Project    : CS 513 Midterm
#  Purpose    : Midterm
#  First Name	: Luke
#  Last Name	: McEvoy
#  Id			    : 10439121
#  Date       : 10/30/2021
#  Comments   : I pledge my honor that I have abided by the Stevens Honors System

#########################################################
##  Step 0: Clear the environment
##           
##
#########################################################
rm(list=ls())


#########################################################
##  Step 1: Load the relavent packages
##           
##
#########################################################
installed.packages()

csvfile<-file.choose()
covid<-read.csv(csvfile, na.strings = '?')
View(covid)

# Summarize each column
summary(covid)

# Identify missing values
is.na(covid)
missingAge<-covid[is.na(covid$Age),]
missingMonth<-covid[is.na(covid$MonthAtHospital),]

# replace the numerical missing values with the 'mode' of the corresponding cols
library(modeest)

# age
covid[is.na(covid$Age), 'Age']<-mfv1(covid$Age,na_rm = TRUE)
age_mfv_value<-mfv(covid$Age)

# month at hospital
covid[is.na(covid$MonthAtHospital), 'MonthAtHospital']<-mfv1(covid$MonthAtHospital,na_rm = TRUE)
monthAtHospital_mfv_value<-mfv(covid$MonthAtHospital)


# scatter plot of 'Age', 'Exposure' and 'MonthAtHospital' one pair at a time
age <- covid$Age
exposure <- covid$Exposure
months <- covid$MonthAtHospital

# Age vs Exposure
plot(age,exposure, main='Age vs Exposure', xlab='Age', ylab='Exposure', pch=19, frame=FALSE)
abline(lm(exposure~age, data=covid), col="blue")

# Age vs MonthAtHospital
plot(age,months, main='Age vs Months', xlab='Age', ylab='Months', pch=19, frame=FALSE)
abline(lm(months~age, data=covid), col="blue")

# Exposure vs MonthAtHospital
plot(exposure,months, main='Exposure vs Months', xlab='Expsoure', ylab='Months', pch=19, frame=FALSE)
abline(lm(months~exposure, data=covid), col="blue")

# box plots for 'Age' and 'MonthAtHospital'
boxplot(covid$Age, covid$MonthAtHospital, main='COVID', names=c('Age', 'Months at Hospital'))
