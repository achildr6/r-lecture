######################## Dataframe select ###################

#Loading Library
install.packages("data.table")
library(data.table) 

##############################
# file
##############################

#Defining Working Directory
getwd()
setwd("D://git_master//09. R_Git")

#Loading Data from csv
sales_csv_file <- file.path(getwd(), 
                            "//data//sample_kopo.csv")
?fread
salesDf <- fread(sales_csv_file)

#dataframe
salesDf2 <- read.csv(sales_csv_file, header = TRUE, sep = ",")
class(salesDf2)

class(salesDf)

read.csv(sales)

write.csv(salesDf, file = "test.csv")

##############################
# Mysql
##############################
#https://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf
#install.packages("RMySQL")
library(RMySQL)
library(DBI)

# Load data
con <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = 'kopo',
  host = '13.209.112.251',
  port = 3306,
  user = 'kopo',
  password = 'kopo')

# list of tables in the databases  
dbListTables(con)

indata <- dbGetQuery(con, "SELECT * FROM kopo_product_volume limit 3")
indata <- dbReadTable(con, "kopo_product_volume")

dbListTables(con)

dbWriteTable(con, "salesdf_20190527", salesDf, 
             row.names = FALSE,
             overwrite = TRUE)

dbGetQuery(con, "SELECT * FROM salesdf_20190527 limit 3")

  
##############################
# Postgresql
##############################
#install.packages("RPostgreSQL")
library("RPostgreSQL")

# Load data
con <- dbConnect(
  drv = RPostgreSQL::PostgreSQL(),
  dbname = 'postgres',
  host = '13.209.112.251',
  port = 5432,
  user = 'haiteam',
  password = 'haiteam')

# list of tables in the databases 
dbListTables(con)

dbGetQuery(con, "SELECT * FROM kopo_product_volume limit 3")

indata <- dbReadTable(con, "kopo_product_volume")

# list of tables in the databases  

dbWriteTable(con, "test2", indata, 
             row.names = FALSE,
             overwrite = TRUE)

dbGetQuery(con, "SELECT * FROM test2 limit 3")

###############################
# Practice
###############################
  
#Loading Data from csv
feature_csv_file <- file.path(getwd(), 
                            "//data//feature_regression_example.csv")
feature_csv_file
?fread
