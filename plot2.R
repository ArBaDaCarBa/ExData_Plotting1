source('load_project_data.R')  # Loads data

png('plot2.png') # Default size is OK (480x480px)

# Second plot is a plot of Global active power over time
plot(
    hpc.data$Time, hpc.data$Global_active_power,
    type='l',
    xlab='',
    ylab='Global active power (kilowatts)',
)

dev.off()
