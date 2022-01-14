#  Course          : Data Mining
#  First Name      : Luke
#  Last Name       : McEvoy
#  Id              : 10439121
#  purpose         : apply Naive Bayes to breast cancer dataset

#### Step 0: Clean Up ####
rm(list=ls())


#### Step 1: Import Naive Bayes ####
#install.packages('e1071', dependencies = TRUE)
library(e1071)
library(class) 


#### Step 2: Import Data ####
csvfile<-file.choose()
cancer<-read.csv(csvfile, na.strings = '?')
summary(cancer)


#### Step 3: Clean Data ####
cancer_nomissing <- na.omit(cancer)


#### Step 4: Factorize Data ####
cancer_nomissing$Class <- factor(cancer_nomissing$Class, levels=c(2,4), labels=c('benign', 'malignant'))
View(cancer_nomissing)


#### Step 5: Split Data ####
split_idx <- sort(sample(sample(nrow(cancer_nomissing),as.integer(.7*nrow(cancer_nomissing)))))
training <- cancer_nomissing[split_idx,]
test <- cancer_nomissing[-split_idx,]


#### Step 6: Naive Bayes ####
naive_bayes <- naiveBayes(Class~., training)
category_all <- predict(naive_bayes, test)

#### Step 7: Review Results ####
table(naive_bayes=category_all, Class=test$Class)
NB_wrong<-sum(category_all!=test$Class)
NB_error_rate<-NB_wrong/length(category_all)

NB_wrong
NB_error_rate

