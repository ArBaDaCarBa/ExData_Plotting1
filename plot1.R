source('load_project_data.R')  # Loads data

png('plot1.png') # Default size is OK (480x480px)

# First plot is a simple histogram of global power activity values
hist(
    hpc.data$Global_active_power,
    xlab='Global active power (kilowatts)',
    main='Global active power',
    col='red',  
)

dev.off()
