# Making sure the labels are in english and not localized
Sys.setlocale("LC_TIME", "C")

# Loads the project data, assuming it's in data/household_power_consumption.txt
library(sqldf)  # To avoid loading the whole file in memory

# Loading data of interest from file
hpc.data <<- read.csv.sql(
    file = 'data/household_power_consumption.txt',
    sql="SELECT Date, Time, Global_active_power
            FROM file
            WHERE Date in ('1/2/2007','2/2/2007')",
    sep=';')

hpc.data$Date <- as.Date(hpc.data$Date, format('%d/%m/%Y'))
hpc.data$Time <- strptime(paste(hpc.data$Date, hpc.data$Time),
                          format='%Y-%m-%d %H:%M:%S')
# And there is no longer need of Date
hpc.data$Date <- NULL

png('plot2.png', width=480, height=480, bg='transparent')

# Plot of Global active power over time
plot(
    hpc.data$Time, hpc.data$Global_active_power,
    type='l',
    xlab='',
    ylab='Global Active Power (kilowatts)',
)

dev.off()
