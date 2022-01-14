# clear the environment
rm(list=ls())

# select the data
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/final/p4/hcluster-data.csv'
data<-read.csv(filename)
data<-data[-1]
View(data)

kmeans_3<- kmeans(data[,-3],2, nstart=1)
kmeans_3$cluster
kmeans_3$centers
table(kmeans_3$cluster,data[,3])
