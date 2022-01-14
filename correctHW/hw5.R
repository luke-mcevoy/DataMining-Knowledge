rm(list=ls())

file<-file.choose()
bc<-read.csv(file,
             na.strings='?',
             colClasses=c('Sample'='character',
                          'F1'='factor', 'F2'='factor', 'F3'='factor',
                          'F4'='factor', 'F5'='factor', 'F6'='factor',
                          'F7'='factor', 'F8'='factor', 'F9'='factor',
                          'Class'='factor'))
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

index<-sort(sample(nrow(bc), round(0.3*nrow(bc))))
training<-bc[-index,]
test<-bc[index,]

CART_class<-rpart(Class~., data=training[,-1])
rpart.plot(CART_class)
CART_predict2<-predict(CART_class, test, type='class')
df<-as.data.frame(cbind(test, CART_predict2))
table(Actual=test[,'Class'], CART=CART_predict2)

CART_wrong<-sum(test[,'Class']!=CART_predict2)

error_rate=CART_wrong/length(test$Class)

