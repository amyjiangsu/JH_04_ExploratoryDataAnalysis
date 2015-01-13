# Get graphdata object
source('ReadData.R')

# Open png file device
png(filename = 'plot3.png')

graphdata.date.time <- strptime(paste(graphdata.df$Date,graphdata.df$Time),format="%Y-%m-%d %H:%M:%S")

# Make plot
plot(graphdata.date.time, graphdata.df$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(graphdata.date.time, graphdata.df$Sub_metering_2, col='red')
lines(graphdata.date.time, graphdata.df$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off png file device
dev.off()
