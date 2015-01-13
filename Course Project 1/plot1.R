# Get graphdata object
source('ReadData.R')

# Open png file device
png(filename = 'plot1.png')

# Make plot
hist(graphdata.df$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off png file device
dev.off()
