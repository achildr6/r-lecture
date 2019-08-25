######################## Dataframe select ###################

#Loading Library
#install.packages("data.table")
library(data.table) 

##############################
# file
##############################

#Defining Working Directory
getwd()
setwd("D://git_master//09. R_Git")

#Loading Data from csv
sales_csv_file <- file.path(getwd(), 
                            "//data//feature_regression_example.csv")
?fread
salesDf <- fread(sales_csv_file)


## Data Handling
head(salesDf)

# Data Table
salesDf[,.(min=min(YEARWEEK), max=max(YEARWEEK))]
### max = 201714
### min = 201501

# Data Frame
max(salesDf$YEARWEEK)
min(salesDf$YEARWEEK)

## Split Data (Training Set)
trainingSet <- salesDf[YEARWEEK <= 201630]

## Split Data (Test Set)
testSet <- salesDf[YEARWEEK > 201630 &
                     YEARWEEK < 201700]


## Generate Model
model <- lm(QTY~ PROMOTION+PRO_PERCENT+HOLIDAY , data=trainingSet)
summary(model)

cor(trainingSet$QTY, trainingSet$PRO_PERCENT)

## Multicollinearity), 다중공선성 > 4 BIG
#install.packages("car")
library(car)
vif(model)

## Generate Model
model_simple <- lm(QTY~ PRO_PERCENT+HOLIDAY , data=trainingSet)
anova(model, model_simple)

## Predict
testFeatures <- testSet[,.(PROMOTION,
                           PRO_PERCENT,
                           HOLIDAY),]
predictResult <- predict(model, 
                         testFeatures, 
                         interval="prediction")

prediction <- as.data.frame(predictResult)

finalResult <- cbind(testSet,prediction)

#install.packages('Metrics')
library('Metrics')

rmse(finalResult$QTY, finalResult$fit)
mae(finalResult$QTY, finalResult$fit)
mape(finalResult$QTY, finalResult$fit)

accuracy_measure <- finalResult[,.(actual=QTY, predict=finalResult$fit)]
correlation_accuraty <- cor(accuracy_measure)

mape <- mean(abs((accuracy_measure$predict - accuracy_measure$actual)) /
               accuracy_measure$actual)
mape

min_max_accuracy <- mean(apply(accuracy_measure,1,min) / 
                           apply(accuracy_measure, 1,max))
min_max_accuracy

library(ggplot2)

ggplot(finalResult, aes(x = YEARWEEK, y = QTY)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red")

ggplot(finalResult, aes(x = QTY, y = fit)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red")

class(finalResult)

sapply(finalResult, class)
  