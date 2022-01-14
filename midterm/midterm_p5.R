
###  Company  : Stevens 
#  Project    : CS 513 Midterm
#  Purpose    : Midterm
#  First Name	: Luke
#  Last Name	: McEvoy
#  Id			    : 10439121
#  Date       : 10/30/2021
#  Comments   : I pledge my honor that I have abided by the Stevens Honors System

rm(list=ls())

file<-file.choose()
covid_raw<-read.csv(file,
                 na.strings='?')
#                 colClasses=c('ID'='character',
 #                             'Age'='factor', 'Exposure'='factor', 
  #                           'MonthAtHospital'='factor', 'Infected'='factor'))

is.factor(covid_raw)
covid<-na.omit(covid_raw)


index = 1
for (month in covid$MonthAtHospital) {
  if (month < 6) {
    covid$MonthAtHospital[index] = 'less than 6'
  } else {
    covid$MonthAtHospital[index] = '6 or more months'
  }
  index = index + 1
}

index = 1
for (age in covid$Age) {
  if (age < 35) {
    covid$Age[index] = 'less than 35'
  } else if(age > 35 && age < 50) {
    covid$Age[index] = '35 to 50'
  } else {
    covid$Age[index] = '51 and over'
  }
  index = index + 1
}

index<-sort(sample(nrow(covid), as.integer(0.7*nrow(covid))))

training<-covid[index,]
test<-covid[-index,]

library(e1071)

nBayes<-naiveBayes(factor(Infected)~., data=training[,-1])
category_all<-predict(nBayes,test[,-1])


table(NBayes=category_all, Survived=test$Infected)
NB_wrong<-sum(category_all!=test$Infected)
NB_error_rate<-NB_wrong/length(category_all)
NB_error_rate
