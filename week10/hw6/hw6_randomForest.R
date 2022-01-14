
# clear the environment
rm(list=ls())

# select the data
# filename<-file.choose()
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/week10/hw6/breast-cancer-wisconsin.csv'
cancer<-read.csv(filename,
                 colClasses=c("Sample"="character",
                              "F1"="factor","F2"="factor","F3"="factor",
                              "F4"="factor","F5"="factor","F6"="factor",
                              "F7"="factor","F8"="factor","F9"="factor",
                              "Class"="factor"))
cancer<-na.omit(cancer)

# split data
index<-sort(sample(nrow(cancer), round(.3*nrow(cancer))))
training<-cancer[-index,]
test<-cancer[index,]

# random forest
library('randomForest')
summary(cancer)
fit<-randomForest(Class~., data=training, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
Prediction<-predict(fit, test)
table(actual=test[,11],Prediction)

wrong<-(test[,11]!=Prediction)
error_rate<-sum(wrong)/length(wrong)
error_rate

