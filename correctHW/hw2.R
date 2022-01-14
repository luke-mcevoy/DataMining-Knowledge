remove(list=ls())

file<-file.choose()
bc<-read.csv(file, na.strings="?")

summary(bc)
is.na(bc)
missing<-bc[is.na(bc$F6),]

rm('mfv')

library(modeest)
?mfv
bc[is.na(bc$F6), 'F6']<-mfv1(bc$F6,na_rm = TRUE)
bc[is.na(bc$F6), 'F6']<-5

summary(bc)
mfv_value<-mfv(bc$F6)

# bc[is.na(bc$F6), "F6"]<-mfv_value[1]

table(Class=bc$Class, Sixth_Feature=bc$F6)

pairs(bc[c(2:5,11)], main="Breast Cancer Graph", pch=21, bg=c("red", "green"[factor(bc$Class)])

boxplot(bc[2:5])
boxplot(bc[6:9])

clnms<-colnames(bc)
paste('Breast Cancer column=')
for(i in 2:3) {
  hist(bc[[i]], main=paste('Breast Cancer column= ', clnms[i]))
}
