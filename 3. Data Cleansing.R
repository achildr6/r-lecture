library(data.table)

#Defining Working Directory
getwd()
setwd("D://git_master//09. R_Git")
#################### READ FILE
sales_csv_file <- file.path(getwd(), 
                            "//data//sample_kopo.csv")
?fread
# datatable
salesDt <- fread(sales_csv_file)
class(salesDt)

salesDf <- data.frame(salesDt)
class(salesDf)

#dataframe
salesDf <- read.csv(sales_csv_file, header = TRUE, sep = ",")
class(salesDf)

#########################
## selecting Specific Row
#########################
## [condition]
testDtSelectRows = salesDt[
  product %in% 
    c("PRODUCT1","PRODUCT2") & 
    sales_qty >= 1000]

testDfSelectRows = subset(
  salesDf,product %in% 
    c("PRODUCT1","PRODUCT2") & 
    sales_qty >= 1000)

#############################
## selecting Specific Columns
#############################
## Data table
testDtSelectColumns = 
  salesDt[,
          .(product,year)]

## Data table
testDfSelectColumns = 
  salesDf[, 
          c('product','year')]

###############################
# Practice 1
###############################


###############################
# Practice 2
###############################

#########################
## Manupulating Value
#########################

testDtManipulValue = 
  salesDt[Capa=="-", Capa := 999]

salesDf$Capa[salesDf$Capa=="-"] <- 999
testDfManipulValue <- salesDf


#########################
## Sorting value
#########################

## Defining Seg
seg <- c('subsidiary', 'product' ,'model')

## Sorting Data
by.var <- c(seg, 'year','mon')
sortedDt <- setkeyv(salesDt, by.var)

sortedDf = salesDf[
  order( salesDf$subsidiary, salesDf$product, salesDf$model,
         salesDf$year, salesDf$mon),]

########################
## Grouping Data
########################

# DataTable
seg <- c('subsidiary', 'product')

by.var <- c(seg, 'year', 'mon')
testDtGroupValue <- salesDt[
  ,  .(sales_qty = mean(sales_qty)), 
  by = by.var, with = T]

setkeyv(testDtGroupValue, by.var)

# DataFrame
testDfGroupValue = 
  aggregate(sales_qty~subsidiary+product+year+mon, salesDf, mean )
testDfGroupValue

#######################
## Joining Data
########################
# Outer join: merge(x = df1, y = df2, by = "join key", all = TRUE)
# Left outer: merge(x = df1, y = df2, by = "join key", all.x = TRUE)
# Right outer: merge(x = df1, y = df2, by = "join key", all.y = TRUE)
# Cross join: merge(x = df1, y = df2, by = NULL)

library(data.table)
join1_csv_file <- file.path(getwd(), 
                            "//data//join_kopo_product_volume.csv")
join1_csv_file
?fread
# datatable
join1Dt <- fread(join1_csv_file)

join2_csv_file <- file.path(getwd(), 
                            "//data//join_region_master.csv")
join2_csv_file
?fread
# datatable
join2Dt <- fread(join2_csv_file)

joinKey = c('REGIONID')
joinInnerResult =  merge(
  x=join1Dt, y=join2Dt, 
  by = joinKey, 
  all=FALSE)


joinLeftResult =  merge(
  x=join1Dt, y=join2Dt, 
  by = joinKey, 
  all.x=TRUE)



testDfMergeValue =  merge(
  x=salesDf, y=testDfGroupValue, 
  by = c(seg,"year","mon"), 
  all.x=TRUE)

#######################
## Union Data
########################

dtRbind <- rbind(
  testDtMergeValue,
  testDtMergeValue)

dfRbind <- rbind(
  testDfMergeValue,
  testDfMergeValue)

#######################
## Unique Data
#######################

uniqDt <- unique(dtRbind)
uniqDf <- unique(dfRbind)

