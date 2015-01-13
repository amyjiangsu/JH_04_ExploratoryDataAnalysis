# Get graphdata object
source('ReadData.R')

# Open png file device
png(filename = 'plot2.png')

graphdata.date.time <- strptime(paste(graphdata.df$Date,graphdata.df$Time),format="%Y-%m-%d %H:%M:%S")

# Make plot
plot(graphdata.date.time, graphdata.df$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off png file device
dev.off()