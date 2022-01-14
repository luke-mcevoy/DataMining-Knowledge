# clear the environment
rm(list=ls())

# select the data
filename<-file.choose()
cancer<-read.csv(filename, na.strings = "?",
                 colClasses=c("Sample"="character",
                              "F1"="factor","F2"="factor","F3"="factor",
                              "F4"="factor","F5"="factor","F6"="factor",
                              "F7"="factor","F8"="factor","F9"="factor",
                              "Class"="factor"))

# split data
index<-sort(sample(nrow(cancer), round(.3*nrow(cancer))))
training<-cancer[-index,]
test<-cancer[index,]

sigmoid <-function(x )
{ z=1/(1+exp(-x))
return(z)                              
}