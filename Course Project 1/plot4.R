# Get graphdata object
source('ReadData.R') 

# Open png file device
png(filename = 'plot4.png')

graphdata.date.time <- strptime(paste(graphdata.df$Date,graphdata.df$Time),format="%Y-%m-%d %H:%M:%S")

## Make plots
par(mfrow=c(2,2))

# Top left
plot(graphdata.date.time, graphdata.df$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(graphdata.date.time, graphdata.df$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(graphdata.date.time, graphdata.df$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(graphdata.date.time, graphdata.df$Sub_metering_2, col='red')
lines(graphdata.date.time, graphdata.df$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Bottom right
plot(graphdata.date.time, graphdata.df$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off png file device
dev.off()