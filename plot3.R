source('load_project_data.R')  # Loads data
Sys.setlocale("LC_TIME", "C")  # Otherwise labels will be localized

png('plot3.png') # Default size is OK (480x480px)

# Third plot is a merge of three plots and a legend
# First plot
with(hpc.data,
    plot(Time, Sub_metering_1,
         type='l',
         xlab='',
         ylab='Energy sub metering'))
# Adds the second plot
with(hpc.data,
     lines(Time, Sub_metering_2, type='l', col='red'))
# And the third
with(hpc.data,
     lines(Time, Sub_metering_3, type='l', col='blue'))

# Then the legend
legend('topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd=1,
       col=c('black', 'red', 'blue'))

dev.off()
