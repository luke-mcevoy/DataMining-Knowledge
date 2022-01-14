# Lecture 4
# CS 513
# Luke McEvoy
# 9/21/2021

rm(list=ls()) # do this at top every time
x1<-c(10,5,6,6,6,7)
x1
mode(x1)

x2<-c(1,2,3,4)
x2

x3<-(x1+x2)
x3

?seq()
x4 <- seq(from=10.2, to=26.5, by=2.1)
mode(x4)
typeof(x4)

x5 <- c(1,2,3,4,5,6)
mode(x5)

x6 <- seq(from=1, to=6, by=1)
x6
typeof(x6)

x7 <- 1:6
x7
typeof(x7)

x8 <- as.integer(x6)
x8
typeof(x8)

typeof(x5)
typeof(x6)
typeof(x7)
typeof(x8)

combx6_x7 <- x6 + x7
combx6_x7
mode(combx6_x7)


?typeof()
?as.integer()
?integer()
x<-5
typeof(x)
is.integer(x)
y<-integer(length=0)
y
typeof(y)
is.integer(y)


ls()
?rm()
rm(list=c('x4', 'x5'))
object<-ls()
?rm()
rm(list=ls())

### Next part of lecture ####
rm(list=ls()) # do this at top every time

myfirstname <- "Luke"
myfirstname
mylastname <- 'McEvoy'
mylastname

myfirstlast <- c(myfirstname, mylastname)
myfirstlast

rm('myfirstname')
myfirstname
myfirstlast

myfirstname <- 'Jack'

myfirstlast


### vector ####
x <- 1:9
mode(x)
typeof(x)
is.vector(x)
length(x)

avector <- c(1,2,3,4)
avector

names(avector) <- c('one', 'two', 'three', 'four')
avector

typeof(avector)
elementnames <- names(avector)
elementnames

names(avector) <- c('new1', 'new2', 'new3', 'new4')
avector
names(avector)
myvectornames <- names(avector)
myvectornames

### Factor() ####
?factor()

cat <- c('good', 'bad', 'bad', 'bad', 'bad', 'good')
cat

typeof(cat)
mode(cat)

cat2 <- factor(cat)
cat2
typeof(cat2)


cat3 <- factor(cat, levels=(c('good', 'bad'))) # specifiy sorting order
cat3
cat4 <- factor(cat) # sorted on lexicographical
cat4
catnumb <- as.numeric(cat3)
catnumb


days <- c('M', 'T', 'W', 'Th', 'F', 'Sat', 'Sun')
days
