#  Course          : Data Mining
#  First Name      : Luke
#  Last Name       : McEvoy
#  Id              : 10439121
#  purpose         : apply knn to breast cancer dataset


#### Step 0: Clean Up ####
rm(list=ls())


#### Step 1: Import KNN ####
installed.packages()
install.packages("kknn")
library(kknn)


#### Step 2: Import Data ####
csv_path <- '/Users/lukemcevoy/Develop/stevens/f21/dataMining/week6/breast-cancer-wisconsin.csv'
cancer <- read.csv(csv_path, na.strings = "?")
summary(cancer)


#### Step 3: Remove all NA from Data ####
cancer_missing <- cancer
cancer_notmissing <- na.omit(cancer_missing)
View(cancer_notmissing)


#### Step 3.5: Not Normalize the Data ####
cancer_normalized <- as.data.frame (
  cbind( Sample=cancer_notmissing[,1],
         F1=(cancer_notmissing[,2]),
         F2=(cancer_notmissing[,3]),
         F3=(cancer_notmissing[,4]),
         F4=(cancer_notmissing[,5]),
         F5=(cancer_notmissing[,6]),
         F6=(cancer_notmissing[,7]),
         F7=(cancer_notmissing[,8]),
         F8=(cancer_notmissing[,9]),
         F9=(cancer_notmissing[,10]),
         Class=factor(cancer_notmissing[,11], levels=c(2,4), labels=c('benign', 'malignant'))
  )
)
# dataframe is not normalized, just leaves user the option to normalize
# without changing variable names in Steps 5 and later
# To normalize data, uncomment Step 4 below
View(cancer_normalized)


#### Step 4: Normalize the Data ####
#mmnorm <-function(x,minx,maxx) {z<-((x-minx)/(maxx-minx))
#return(z) 
#}

#cancer_normalized <- as.data.frame (
#  cbind( Sample=cancer_notmissing[,1],
#         F1=mmnorm(cancer_notmissing[,2],min(cancer_notmissing[,2]),max(cancer_notmissing[,2])),
#         F2=mmnorm(cancer_notmissing[,3],min(cancer_notmissing[,3]),max(cancer_notmissing[,3])),
#         F3=mmnorm(cancer_notmissing[,4],min(cancer_notmissing[,4]),max(cancer_notmissing[,4])),
#         F4=mmnorm(cancer_notmissing[,5],min(cancer_notmissing[,5]),max(cancer_notmissing[,5])),
#         F5=mmnorm(cancer_notmissing[,6],min(cancer_notmissing[,6]),max(cancer_notmissing[,6])),
#         F6=mmnorm(cancer_notmissing[,7],min(cancer_notmissing[,7]),max(cancer_notmissing[,7])),
#         F7=mmnorm(cancer_notmissing[,8],min(cancer_notmissing[,8]),max(cancer_notmissing[,8])),
#         F8=mmnorm(cancer_notmissing[,9],min(cancer_notmissing[,9]),max(cancer_notmissing[,9])),
#         F9=mmnorm(cancer_notmissing[,10],min(cancer_notmissing[,10]),max(cancer_notmissing[,10])),
#         Class=factor(cancer_notmissing[,11], levels=c(2,4), labels=c('benign', 'malignant'))
#      )
#)
#View(cancer_normalized)


#### Step 5: Split Data (Test = 0.3, Training = 0.7) ####
idx<-sort(sample(nrow(cancer_normalized),as.integer(.7*nrow(cancer_normalized))))
test<-cancer_normalized[idx,]
training <-cancer_normalized[-idx,]


#### Step 6: Run KNN (k=3) ####
predict_k3 <- kknn(formula=Class~., training, test[,-11], k=3,kernel ="rectangular" )
fit <- fitted(predict_k3)
table(Actual=test$Class,Fitted=fit)


#### Step 7: Run KNN (k=5) ####
predict_k5 <- kknn(formula=Class~., training, test[,-11], k=5,kernel ="rectangular" )
fit <- fitted(predict_k5)
table(Actual=test$Class,Fitted=fit)


#### Step 6: Run KNN (k=7) ####
predict_k7 <- kknn(formula=Class~., training, test[,-11], k=7,kernel ="rectangular" )
fit <- fitted(predict_k7)
table(Actual=test$Class,Fitted=fit)

