#  Course          : Data Mining
#  First Name      : Luke
#  Last Name       : McEvoy
#  Id              : 10439121
#  purpose         : decision trees

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

#install.packages("rpart")  # CART standard package
?install.packages()

#install.packages("rpart")
#install.packages("rpart.plot")     # Enhanced tree plots
#install.packages("rattle")         # Fancy tree plot
#install.packages("RColorBrewer")   # colors needed for rattle
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

csvfile<-file.choose()
workers<-read.csv(csvfile, na.strings = '?')
summary(workers)
View(workers)

idx<-sort(sample(nrow(workers), as.integer(0.7*nrow(workers))))
training<-workers[idx,]
test<-workers[-idx,]

cart_workers<-rpart(Salary~., data=training)
cart_workers

prp(cart_workers)
rpart.plot(cart_workers, box.palette = 'blue')
CART_predict2<-predict(cart_workers, test, type="class") 
table(Actual=test[,1],CART=CART_predict2)
table(Actual=test[,2],CART=CART_predict2)
table(Actual=test[,3],CART=CART_predict2)
table(Actual=test[,4],CART=CART_predict2)
table(Actual=test[,5],CART=CART_predict2)

workers_predict<-predict(cart_workers, test, type='class')
workers_predict

table(Actual=test[,1],CART=workers_predict)
CART_wrong<-sum(test[,5]!=workers_predict)
CART_error_rate<-CART_wrong/length(test[,5])
CART_error_rate
CART_predict2<-predict(cart_workers,test, type="class")
CART_wrong2<-sum(test[,5]!=CART_predict2)
CART_error_rate2<-CART_wrong2/length(test[,4])
CART_error_rate2

