
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
covid<-read.csv(file, na.strings="?", colClasses=c("Infected"="factor"))
covid_clean<-na.omit(covid)
covid_clean$MaritalStatus<-NULL

index<-sort(sample(nrow(covid_clean), round(0.3*nrow(covid_clean))))
training<-covid_clean[-index,]
test<-covid_clean[index,]

library(kknn)
predict_k5<-kknn(formula=Infected~., training[,c(-1)], test[,c(-1)], k=5, kernel='rectangular')

fit<-fitted(predict_k5)
table(test$Infected, fit)

wrong<-test$Infected != fit
rate<-sum(wrong)/length(wrong)
rate
