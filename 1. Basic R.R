############################
####### Basic R
############################

####################
# Defining variables
####################

a=1
a<-1

#########################
# Mathmatical computation
##########################
x<-11
y<- 3

x+y
x*y
x/y
x^y
x%%y

# User of Math Functions
pi
sqrt(2)

abs(-5)
floor(1.2)
ceiling(1.5)
round(1.6)
factorial(3)


#######################
# Set working Directory
#######################

#Defining Working Directory
## Folder shall be existed before following job
getwd()
setwd("D://git_master//09. R_Git")


############################
####### Data Type
############################

# Creating vector
vec1<-c(1,2,3,4)
vec2<-c(1.0,1,"ss")
class(vec1)

# indexing (default indexing)
vec1[1]
class(vec2)

# indexing (name indexing)
names(vec1) <- c("first","second")
vec1["first"]

vec1

append(vec1,5,6)

# Create vector
seq(from=0, to=10, by=1)
rep(1,10)

# Data manipulation
x<- 1:4
y<- 5:8

cbind(x,y)
rbind(x,y)

############################
# Creating Dataframe

dateIndex = c('2017-12-01','2017-12-02','2017-12-03',
              '2017-12.04','2017-12-05','2017-12-06')
productNameList = c('REF','TV','MOBILE','REF','MOBILE','TV')
volumeList = c(1000,2000,1500,1200,1700,1000)

testDf <- data.frame( date = dateIndex,
                      product = productNameList,
                      volume = volumeList)

class(testDf)



############################
# grammar

# for 
tvList = c('UN40EN001', 'UN40EN002', 'UN40EN003', 'UN40EN004')

preFix = "LED_"

for (i in 1:length(tvList)){
  tvList[i] = paste0(preFix,tvList[i])
}

# while

tvList = c('UN40EN001', 'UN40EN002', 'UN40EN003', 'UN40EN004')

preFix = "LED_"
i=1
listSize = length(tvList)
while(i <= listSize){
  tvList[i] = paste0(preFix,tvList[i])
  i=i+1
}

###############################
# Practice
###############################

#.....


# if
#install.packages("stringr")
#https://cran.r-project.org/web/packages/stringr/stringr.pdf
library(stringr)

tvList = c('UN40EN001', 'UN40EN002', 
           'LEDTV_UN40EN003', 'LEDTV_UN40EN004')

preFix = "LEDTV_"


for (i in 1:length(tvList)){
  
  if( str_count(tvList[i],preFix) >= 1 ){
    tvList[i] = 
      str_replace(tvList[i], preFix, "")
  }
}

###############################
# Practice
###############################

targetScore = 80
grade <-"D"

if(targetScore >= 90){
  grade <- "C"
}else if(targetScore >= 80){
  grade <- "B"
}else{
  grade <- "C"
}


############################
####### Use Of Function
############################

### Generate Function
## Define of Function
g <- function (a,b) {
  u = a+b
  v = a-b
  # Do not use return
  v / u}

## Use of Function
g(3,2)


###############################
# Practice
###############################

#install.packages("ISOweek")
library(ISOweek)

Sys.Date()

dates <- as.Date(dates, "%Y%m%d")

#install.packages("ISOweek")
library(ISOweek)
## get current date
currdate = Sys.Date()
## convert date to week
currweek = ISOweek(currdate)

### Get next Week of YYYYWW (caution!! ii can't be over 52)
PostWeek = function(curweek, ii) {
 answer = 201511
 answer
}
