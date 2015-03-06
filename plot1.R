# Loads the project data, assuming it's in data/household_power_consumption.txt
library(sqldf)  # To avoid loading the whole file in memory

# Loading data of interest from file
hpc.data <<- read.csv.sql(
    file = 'data/household_power_consumption.txt',
    sql="SELECT Global_active_power
            FROM file
            WHERE Date in ('1/2/2007','2/2/2007')",
    sep=';')

png('plot1.png', width=480, height=480, bg='transparent')

# Histogram of global power activity values
hist(
    hpc.data$Global_active_power,
    xlab='Global Active Power (kilowatts)',
    main='Global Active Power',
    col='red',  
)

dev.off()
