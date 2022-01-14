
###  Company  : Stevens 
#  Project    : CS 513 HW2
#  Purpose    : EDA of Breast Cancer Data
#  First Name	: Luke
#  Last Name	: McEvoy
#  Id			    : 10439121
#  Date       : 9/27/2021
#  Comments   : I pledge my honor that I have abided by the Stevens Honors System

rm(list=ls())
######     simple statement  ####

# Load the csv
csv_path <- '/Users/lukemcevoy/Develop/stevens/f21/dataMining/week4/breast-cancer-wisconsin.csv'
df <- read.csv(csv_path)
df

######  Summarize each column   #####
column <- 0
missingValues <- c()
for (i in colnames(df)){
  
  currentCol <- df[[i]]
  column <- column + 1
  
  if (is.integer(currentCol)) {
    min <- min(currentCol, na.rm=TRUE)
    max <- max(currentCol,na.rm=TRUE)
    mean <- mean(currentCol,na.rm=TRUE)
    print(paste(colnames(df[i]), '| min ->', min, '| max ->', max, '| mean ->', mean))
  } else {
    typeof(currentCol)
    currentCol
    row <- 0
    for (datapoint in currentCol) {
      row <- row + 1
      if ('?' == datapoint) {
        print(paste('BEFORE - column:', column, 'row:', row, 'data:', df[[column]][row]))
        missingValues <- append(missingValues, c(column,row))
        df[[column]][row] = mean
        print(paste('AFTER  - column:', column, 'row:', row, 'data:', df[[column]][row]))
      }
    }
  }
  
  df[[i]] <- as.integer(type.convert(df[[i]]))
}
print(missingValues)

######  Frequency table of Class vs F6  #####
table(df$Class, df$F6)

######  Scatter Plot of F1 to F6   #####
pairs(df[,2:9])

######  Histogram F7 to F9   #####
f7 <- hist(df$F7)
f8 <- hist(df$F8)
f9 <- hist(df$F9)


######     simple statement  ####
rm(list=ls())
csv_path <- '/Users/lukemcevoy/Develop/stevens/f21/dataMining/week4/breast-cancer-wisconsin.csv'
df <- read.csv(csv_path)

######     Remove all rows with a missing value  ####
column <- 0
colnames(df)
for (i in colnames(df)){
  currentCol <- df[[i]]
  column <- column + 1
  row <- 0
  for (datapoint in currentCol) {
    row <- row + 1
    if ('?' == datapoint) {
      print(paste(datapoint, column, row))
      df <- df[-c(row),]
    }
  }
  
  df[[i]] <- as.integer(type.convert(df[[i]]))
}

row <- 0
for (d in df[[i]]) {
  row <- row + 1
  if ('?' == d) {
    print('ERROR: Invalid data still remains')
  }
}

