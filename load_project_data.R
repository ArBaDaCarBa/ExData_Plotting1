# Loads the project data

library(sqldf)  # To avoid loading the whole file in memory

# Loading data of interest from file
hpc.data <<- read.csv.sql(
    file = 'data/household_power_consumption.txt',
    sql="SELECT * FROM file WHERE Date in ('1/2/2007','2/2/2007')",
    sep=';')

hpc.data$Date <- as.Date(hpc.data$Date, format('%d/%m/%Y'))
