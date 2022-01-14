rm(list=ls())

## define the initial weights, input and sigmoid function

weight_ih<- c(0.5, 0.6, 0.8, 0.6, 0.2, 0.7 ,0.9, 0.8, 0.4, 0.2)
Mw_ih<- matrix(weight_ih , nrow = 5, ncol = 2,byrow = FALSE)
weight_ho<-c(0.5,0.85,0.85)
Mw_ho<-matrix(weight_ho,nrow=3,ncol=1)

i<-c(1,	0.4, 0.7, 0.7, 0.2) 

sigmoid <-function(x )
{ z=1/(1+exp(-x))
return(z)                              
}


# i %*% Mw_ih
out_hiddenL<-  sigmoid (i %*% Mw_ih) 
input_outputL<- c(1,out_hiddenL)
is.vector(input_outputL)
out_outL<-  sigmoid (  input_outputL%*% Mw_ho )

## Back propagation calculation
Actual<-.85
eta<- .1
e<-out_outL-Actual
delta<- -1*(out_outL)*(1-out_outL)*e
DELTA<-eta*delta%*%input_outputL
New_ho<-Mw_ho+t(DELTA)
e_hidden<-Mw_ho[-1]%*%delta
delta_h<- (t(e_hidden)*(-1*(out_hiddenL)*(1-out_hiddenL))) 
DELTA<-eta*(as.matrix(i)%*%delta_h)




