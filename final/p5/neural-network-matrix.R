# Problem 5

# Part A

rm(list=ls())
## define the initial weights, input and sigmoid function

# Hidden Input Layer
weight_ih<- c(0.5, 0.6, 0.8, 0.6, 0.2, 0.7 ,0.9, 0.8, 0.4, 0.2)
weight_ih
Mw_ih<- matrix(weight_ih , nrow = 5, ncol = 2,byrow = FALSE)
Mw_ih

# Hidden Output Layers
weight_ho<-c(0.5,0.9,0.9)
weight_ho
Mw_ho<-matrix(weight_ho,nrow=3,ncol=1)
Mw_ho

# Input Layer
i<-c(1,	0.4, 0.7, 0.7, 0.2) 
i


# Sigmoid Function
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
Actual<-.90
eta<- .1
# error
e<-out_outL-Actual
e

# Little delta
delta<- -1*(out_outL)*(1-out_outL)*e
delta

# Large delta
DELTA<-eta*delta%*%input_outputL
DELTA

# Update Hidden Output with Large delta
New_ho<-Mw_ho+t(DELTA)
New_ho
e_hidden<-Mw_ho[-1]%*%delta
delta_h<- (t(e_hidden)*(-1*(out_hiddenL)*(1-out_hiddenL))) 
delta_h
DELTA<-eta*(as.matrix(i)%*%delta_h)
DELTA

# Part B with altered weights

rm(list=ls())

## define the initial weights, input and sigmoid function

# Hidden Input Layer
weight_ih<- c(0.5, 0.6, 0.8, 0.6, 0.2, 0.7 ,0.9, 0.8, 0.4, 0.2)
weight_ih
Mw_ih<- matrix(weight_ih , nrow = 5, ncol = 2,byrow = FALSE)
Mw_ih

# Hidden Output Layers
weight_ho<-c(0.5,0.85,0.85)
weight_ho
Mw_ho<-matrix(weight_ho,nrow=3,ncol=1)
Mw_ho

# Input Layer
i<-c(1,	0.4, 0.7, 0.7, 0.2) 
i

# Sigmoid Function
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
e
delta<- -1*(out_outL)*(1-out_outL)*e
delta
DELTA<-eta*delta%*%input_outputL
DELTA
New_ho<-Mw_ho+t(DELTA)
New_ho
e_hidden<-Mw_ho[-1]%*%delta
delta_h<- (t(e_hidden)*(-1*(out_hiddenL)*(1-out_hiddenL))) 
delta_h
DELTA<-eta*(as.matrix(i)%*%delta_h)
DELTA






