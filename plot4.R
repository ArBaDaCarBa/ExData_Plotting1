# Making sure the labels are in english and not localized
Sys.setlocale("LC_TIME", "C")

# Loads the project data, assuming it's in data/household_power_consumption.txt
library(sqldf)  # To avoid loading the whole file in memory

# Loading data of interest from file
hpc.data <<- read.csv.sql(
    file = 'data/household_power_consumption.txt',
    sql="SELECT *
            FROM file
            WHERE Date in ('1/2/2007','2/2/2007')",
    sep=';')

hpc.data$Date <- as.Date(hpc.data$Date, format('%d/%m/%Y'))
hpc.data$Time <- strptime(paste(hpc.data$Date, hpc.data$Time),
                          format='%Y-%m-%d %H:%M:%S')
# And there is no longer need of Date
hpc.data$Date <- NULL

png('plot4.png', width=480, height=480, bg='transparent')

par(mfrow=c(2, 2))

# First plot (upper left)
with(hpc.data, plot(Time, Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power'))

# Second plot (upper right)
with(hpc.data, plot(Time, Voltage,
     type='l',
     xlab='datetime'))

# Third plot (Lower left)
# See plot3.R for more details
with(hpc.data,
     plot(Time, Sub_metering_1,
          type='l',
          xlab='',
          ylab='Energy sub metering'))
with(hpc.data,
     lines(Time, Sub_metering_2, type='l', col='red'))
with(hpc.data,
     lines(Time, Sub_metering_3, type='l', col='blue'))
legend('topright',
       lwd=1,
       lty=1,
       bty='n',
       col=c('black', 'red', 'blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),)

# Fourth plot (Lower right)
with(hpc.data, plot(Time, Global_reactive_power,
     type='l',
     xlab='datetime'))

dev.off()
