
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
#                    colClasses=c('ID'='character',
#                                 'Age'='factor', 'Exposure'='factor', 
#                                 'MaritalStatus'='factor', 'Cases'='factor', 
#                                 'MonthAtHospital'='factor', 'Infected'='factor'))

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

library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

index<-sort(sample(nrow(covid), round(0.3*nrow(covid))))
training<-covid[-index,]
test<-covid[index,]

CART_class<-rpart(Infected~., data=training[,-1])
rpart.plot(CART_class)
CART_predict2<-predict(CART_class, test, type='class')
df<-as.data.frame(cbind(test, CART_predict2))
table(Actual=test[,'Infected'], CART=CART_predict2)

CART_wrong<-sum(test[,'Infected']!=CART_predict2)

error_rate=CART_wrong/length(test$Infected)

