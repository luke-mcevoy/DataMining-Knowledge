remove(list=ls())

file<-file.choose()
bc<-read.csv(file, na.strings="?", colClasses=c("Class"="factor"))
is.factor(bc$Class)
bc_clean<-na.omit(bc)

index<-sort(sample(nrow(bc_clean), round(0.3*nrow(bc_clean))))
training<-bc_clean[-index,]
test<-bc_clean[index,]

library(kknn)
predict_k1<-kknn(formula=Class~., training[,c(-1)], test[,c(-1)], k=1, kernel='rectangular')

fit<-fitted(predict_k1)
table(test$Class, fit)

wrong<-test$Class != fit
rate<-sum(wrong)/length(wrong)
rate

for (i in c(1,2,3,4,5,10,15,20,25)) {
  predict<-kknn(formula=Class~., training[,c(-1)], test[,c(-1)], k=i, kernel="rectangular")
  fit<-fitted(predict)
  
  wrong<-test$Class!=fit
  rate<-sum(wrong)/length(wrong)
  rate
  print('***********')
  print(i)
  print(table(test$Class, fit))
  print(rate)
  print('***********')
}
