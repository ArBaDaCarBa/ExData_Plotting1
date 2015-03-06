# Making sure the labels are in english and not localized
Sys.setlocale("LC_TIME", "C")

# Loads the project data, assuming it's in data/household_power_consumption.txt
library(sqldf)  # To avoid loading the whole file in memory

# Loading data of interest from file
hpc.data <<- read.csv.sql(
    file = 'data/household_power_consumption.txt',
    sql="SELECT Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3
            FROM file
            WHERE Date in ('1/2/2007','2/2/2007')",
    sep=';')

hpc.data$Date <- as.Date(hpc.data$Date, format('%d/%m/%Y'))
hpc.data$Time <- strptime(paste(hpc.data$Date, hpc.data$Time),
                          format='%Y-%m-%d %H:%M:%S')
# And there is no longer need of Date
hpc.data$Date <- NULL

png('plot3.png', width=480, height=480, bg='transparent')

# Third plot is a merge of three plots and a legend
# First plot
with(hpc.data,
    plot(Time, Sub_metering_1,
         type='l',
         xlab='',
         ylab='Energy sub metering'))

# Adds the second plot, in red
with(hpc.data,
     lines(Time, Sub_metering_2, type='l', col='red'))

# And the third plot, in blue
with(hpc.data,
     lines(Time, Sub_metering_3, type='l', col='blue'))

# Then the legend
legend('topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd=1,
       col=c('black', 'red', 'blue'))

dev.off()
