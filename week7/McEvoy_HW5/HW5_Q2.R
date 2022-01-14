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
cancer<-read.csv(csvfile, na.strings = '?')
summary(cancer)
View(cancer)

cancer$Class = factor(cancer$Class, labels = c('benign','malignant'))

idx<-sort(sample(nrow(cancer), as.integer(0.7*nrow(cancer))))
training<-cancer[idx,]
test<-cancer[-idx,]

View(training)
cart_cancer<-rpart(Class~., data=training)
cart_cancer

plot(cart_cancer)
prp(cart_cancer)

cancer_predict<-predict(cart_cancer, test, type='class')
cancer_predict

table(Actual=test[,1],CART=cancer_predict)
CART_wrong<-sum(test[,11]!=cancer_predict)
CART_error_rate<-CART_wrong/length(test[,11])
CART_error_rate
CART_predict2<-predict(cart_cancer,test, type="class")
CART_wrong2<-sum(test[,11]!=CART_predict2)
CART_error_rate2<-CART_wrong2/length(test[,4])
CART_error_rate2

fancyRpartPlot(cart_cancer)
