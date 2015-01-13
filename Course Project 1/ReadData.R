# Read data from home directory
graphdata.df  <- read.table('household_power_consumption.txt',header = T, na.strings ='?',
                            sep = ';',  stringsAsFactors = F)
        
# Convert date format
graphdata.df$Date  <- as.Date (graphdata.df$Date, format = "%d/%m/%Y")
        
# Getting data for the defined period
graphdata.df <- subset(graphdata.df, Date >= as.Date('2007-02-01', format = '%Y-%m-%d') 
                       & Date <= as.Date('2007-02-02', format = '%Y-%m-%d'))
