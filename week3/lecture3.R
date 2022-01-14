# Lecture 3
# CS 513
# Luke McEvoy
# 9/14/2021


### simple statement ####
x <- 25
x

hello <- "Hello World"
print(hello)
hello

# to clear the console, ctrl-L
### getting help ####
help()
help(c)
?c()
example(c)
help.start()


### use c ####
x <- c(1,2,2,NA,5,10)
x <- c(1,2,2,5,5,10)
x
min(x)
max(x)
mean(x)


### class exercise 1 ####
x <- c(1,2,3,3,3,6)
x
min(x)
max(x)
mean(x)

?min()


### class exercise 2 ####
x <- c(NA,2,3,3,3,6)
x
min(x)
max(x)
mean(x)


### class exercise 3 ####
# find min, max, min, without NA
x <- c(NA,2,3,3,3,6)
x
min(x, na.rm = TRUE)
max(x, na.rm = TRUE)
mean(x, na.rm = TRUE)


### class exercise 4 ####
?summary()
summary(x)

?length()
hello
length(hello) # size of elements in a vector, therefore equals 1

nchar(hello) # the length of the element within the vector, equals 11


### ls() ####
?ls()
ls()

### rm() ####
?rm()
rm('x')
rm('hello')
rm('ll')
