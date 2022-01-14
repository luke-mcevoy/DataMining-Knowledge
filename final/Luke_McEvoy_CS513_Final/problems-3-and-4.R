#### Problem 3

# clear the environment
rm(list=ls())

# select the data
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/final/p3-4/k-means-data.csv'
data<-read.csv(filename)

kmeans_2<- kmeans(data[,2:4],2,nstart = 1)
kmeans_2$cluster
kmeans_2$centers
table(kmeans_2$cluster,data[,1])


# Part A
#   Members of each cluster are 
#     Cluster 1 = (a,e,g)
#     Cluster 2 = (b,c,d,f)

# Part B
#   Coordinates for each cluster center
#                    X        Y        Z
#   Cluster 1     1.333333 1.333333 1.333333
#   Cluster 2     4.250000 3.500000 4.250000



# Problem 4

# clear the environment
rm(list=ls())

# select the data
filename<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/final/p3-4/k-means-data.csv'
data<-read.csv(filename)

data_dist<-dist(data[2:4])
hclust_resutls<-hclust(data_dist)
plot(hclust_resutls)
dev.off()
hclust_2<-cutree(hclust_resutls,2)
table(hclust_2,data[,1])
round(hclust_resutls$height,2)


# Part A
#   Members of each cluster are 
#     Cluster 1 = (a,e,g)
#     Cluster 2 = (b,c,d,f)

# Part B
#   Coordinates for each cluster center
#     1.00 1.00 1.00 1.73 1.73 5.83