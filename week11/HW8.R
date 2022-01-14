# clear the environment
rm(list=ls())

# select the data
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/week10/hw7/wisc_bc_ContinuousVar.csv'
cancer<-read.csv(filename)
# cancer$diagnosis[cancer$diagnosis=="M"]<-0
# cancer$diagnosis[cancer$diagnosis=="B"]<-1
cancer_df<-data.frame(lapply(na.omit(cancer),as.numeric))
cancer_df<-cancer_df[-1]
cancer_df<-cancer_df[-1]
View(cancer_df)

normalized_cancer_df<-as.data.frame(apply(cancer_df[,1:ncol(cancer_df)], 2, function(x) (x-min(x))/(max(x)-min(x))))
View(normalized_cancer_df)

# split data
index<-sort(sample(nrow(normalized_cancer_df), round(.3*nrow(normalized_cancer_df))))
training<-normalized_cancer_df[-index,]
test<-normalized_cancer_df[index,]

cancer_dist<-dist(normalized_cancer_df[,-ncol(normalized_cancer_df)])
hclust_resutls<-hclust(cancer_dist)
plot(hclust_resutls)
dev.off()
hclust_2<-cutree(hclust_resutls,2)
table(hclust_2,normalized_cancer_df[,ncol(normalized_cancer_df)])

tabulate(hclust_2)
