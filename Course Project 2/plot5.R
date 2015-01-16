# Exploratory Data Analysis - Peer Assessment 2
# Amy Jiang November 20, 2014

# Q5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Loading provided datasets - loading from local folder
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting NEI data by Baltimore and type == "ON-ROAD"
baltimore.mv.emission.data = subset(NEI, fips == "24510" & type == "ON-ROAD")

# Getting Baltimore total motor vehicle emission by year
baltimore.mv.emission.by.year <- tapply(baltimore.mv.emission.data$Emissions, baltimore.mv.emission.data$year, sum)

# Plotting the figure
png(filename = "plot5.png", 
    width = 600, height = 600, 
    units = "px")
par("mar"=c(5,5,5,5))

plot(names(baltimore.mv.emission.by.year), baltimore.mv.emission.by.year, type = "l", xlab = "Year", 
     main = "Baltimore's Total Emissions From Motor Vehicle\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission in tons"), col="Steel Blue")

dev.off()
