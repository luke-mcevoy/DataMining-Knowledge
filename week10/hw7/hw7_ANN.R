# clear the environment
rm(list=ls())

# select the data
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/week10/hw7/wisc_bc_ContinuousVar.csv'
cancer<-read.csv(filename)
View(cancer)
# cancer_df<-data.frame(lapply(cancer[,-1], as.numeric))
cancer$diagnosis[cancer$diagnosis=="M"]<-0
cancer$diagnosis[cancer$diagnosis=="B"]<-1
cancer_df<-data.frame(lapply(na.omit(cancer),as.numeric))
cancer_df<-cancer_df[-1]
View(cancer_df)

normalized_cancer_df<-as.data.frame(apply(cancer_df[,1:ncol(cancer_df)], 2, function(x) (x-min(x))/(max(x)-min(x))))
View(normalized_cancer_df)


# split data
index<-sort(sample(nrow(normalized_cancer_df), round(.3*nrow(normalized_cancer_df))))
training<-normalized_cancer_df[-index,]
test<-normalized_cancer_df[index,]

library("neuralnet")
net_cancer<-neuralnet(diagnosis~., training, hidden=5, threshold=0.01)

plot(net_cancer)

pred<-predict(net_cancer, test)
pred

ann<-compute(net_cancer, test)
ann$net.result
length(ann$net.result)

ann_cat<-ifelse(ann$net.result<1.5,1,2)
ann_cat<-ifelse(ann$net.result <0.5,0,1)
length(ann_cat)

table(Actual=test$diagnosis, predict=ann_cat)

wrong<-(test$diagnosis!=ann_cat)
error_rate<-sum(wrong)/length(wrong)
error_rate
