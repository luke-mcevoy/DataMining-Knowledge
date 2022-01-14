
# clear the environment
rm(list=ls())

# select the data
# filename<-file.choose()
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/week10/hw6/breast-cancer-wisconsin.csv'
cancer<-read.csv(filename, na.strings = "?",
                 colClasses=c("Sample"="character",
                              "F1"="factor","F2"="factor","F3"="factor",
                              "F4"="factor","F5"="factor","F6"="factor",
                              "F7"="factor","F8"="factor","F9"="factor",
                              "Class"="factor"))

# split data
index<-sort(sample(nrow(cancer), round(.3*nrow(cancer))))
training<-cancer[-index,]
test<-cancer[index,]

# C50 classification
library('C50')
summary(cancer)
C50_class <- C5.0(Class~., data=cancer)

summary(C50_class)
C50_predict<-predict(C50_class, test, type="class")
table(actual=test[,11], C50=C50_predict)
wrong<-(test[,11]!=C50_predict)
C50_rate<-sum(wrong)/length(test[,11])
C50_rate
