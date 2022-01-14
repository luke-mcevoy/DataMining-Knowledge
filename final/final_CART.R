# clear the environment
rm(list=ls())

# select the data
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/final/addiction.csv'
addiction<-read.csv(filename, 
                    na.strings = "?",
                    colClasses = c("Ethnicity"="factor", 
                                             "Age"="factor",
                                             "Alcohol"="factor",
                                             "Cocaine"="factor",
                                             "Heroin"="factor"))
View(addiction)

#addiction_df<-data.frame(addiction)
#addiction_df$Age.Ca.tegory <- ifelse(addiction_df$Age.Ca.tegory == 'Old', 1, 0)
#View(addiction_df)


#install.packages("rpart")
#install.packages("rpart.plot")     # Enhanced tree plots
#install.packages("rattle")         # Fancy tree plot
#install.packages("RColorBrewer")   # colors needed for rattle

library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

index<-sort(sample(nrow(addiction),round(.30*nrow(addiction))))
training<-addiction[-index,]
test<-addiction[index,]

CART_class<-rpart(Alcohol~. ,data=training)
rpart.plot(CART_class, box.palette="blue")
CART_predict2<-predict(CART_class,test, type="class")
df<-as.data.frame(cbind(test,CART_predict2))
table(Actual=test[,"Age"],CART=CART_predict2)

CART_wrong<-sum(test[,"Age"]!=CART_predict2)

error_rate=CART_wrong/length(test$Class)

