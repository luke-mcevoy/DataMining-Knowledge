#  First Name      : Luke
#  Last Name       : McEvoy
#  Id              : 10439121
#  purpose         : Applying SVM to Breast Cancer data

rm(list=ls())
# file<-file.choose()
file<-'/Users/lukemcevoy/Develop/stevens/f21/dataMining/week12/wisc_bc_ContinuousVar.csv'

bc_raw<-  read.csv(file, na.strings = "?",)
summary(bc_raw) 
summary(bc_raw$diagnosis)
table(bc_raw$diagnosis)

mmnorm2 <-function(x)
{z<-((x-min(x))/(max(x)-min(x)))
return(z)                              
}

bc<- data.frame(diagnosis=as.factor(bc_raw$diagnosis) 
                ,     	radius_mean =mmnorm2(	bc_raw$radius_mean)
                ,      texture_mean=mmnorm2(bc_raw$texture_mean)
                ,      perimeter_mean=mmnorm2(bc_raw$perimeter_mean)
                ,      area_mean=mmnorm2(bc_raw$area_mean)
                ,      smoothness_mean=mmnorm2(bc_raw$smoothness_mean)
                ,      compactness_mean=mmnorm2(bc_raw$compactness_mean)
                ,      concavity_mean=mmnorm2(bc_raw$concavity_mean)
                ,      concave.points_mean=mmnorm2(bc_raw$concave.points_mean)
                ,      symmetry_mean=mmnorm2(bc_raw$symmetry_mean)
                ,      fractal_dimension_mean=mmnorm2(bc_raw$fractal_dimension_mean)
                ,      radius_se=mmnorm2(bc_raw$radius_se)
                ,      perimeter_se=mmnorm2(bc_raw$perimeter_se)
                ,      texture_se=mmnorm2(bc_raw$texture_se)
                ,      area_se=mmnorm2(bc_raw$area_se)
                ,      smoothness_se=mmnorm2(bc_raw$smoothness_se)
                ,      compactness_se=mmnorm2(bc_raw$compactness_se)
                ,      concavity_se=mmnorm2(bc_raw$concavity_se)
                ,      concave.points_se =mmnorm2(bc_raw$concave.points_se)
                ,      symmetry_se=mmnorm2(bc_raw$symmetry_se)
                ,       fractal_dimension_se=mmnorm2(bc_raw$fractal_dimension_se)
                ,       radius_worst=mmnorm2(bc_raw$radius_worst)
                ,       texture_worst=mmnorm2(bc_raw$texture_worst)
                ,       perimeter_worst=mmnorm2(bc_raw$perimeter_worst)
                ,       area_worst=mmnorm2(bc_raw$area_worst)
                ,       smoothness_worst=mmnorm2(bc_raw$smoothness_worst)
                ,       compactness_worst=mmnorm2(bc_raw$compactness_worst)
                ,       concavity_worst=mmnorm2(bc_raw$concavity_worst)
                ,       concave.points_worst=mmnorm2(bc_raw$concave.points_worst)
                ,      	symmetry_worst=mmnorm2(bc_raw$symmetry_worst)
                ,       fractal_dimension_worst=mmnorm2(bc_raw$fractal_dimension_worst)
) 




# create test and training dataset
index <- seq (1,nrow(bc),by=3)
test<-bc[index,]
training<-bc[-index,]
ncol(test)
ncol(training)
library(e1071)
?svm()
## svm
svm.model <- svm( diagnosis~., data = training  )
svm.pred <- predict(svm.model,  test)

table(actual=test[,5],svm.pred )
SVM_wrong<- (test$diagnosis!=svm.pred)
SVM_wrong
rate<-sum(SVM_wrong)/length(SVM_wrong)
rate

