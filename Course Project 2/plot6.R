# Exploratory Data Analysis - Peer Assessment 2
# Amy Jiang November 20, 2014

# Q6. Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == 06037). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Loading required libraries
library(ggplot2)
library(plyr)

# Loading provided datasets - loading from local folder
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting NEI data for Baltimore and LA with type == "ON-ROAD"
LA.baltimore.mv.emission.data = subset(NEI, (fips == "24510" | fips == "06037" & type == "ON-ROAD"))
LA.baltimore.mv.emission.data[,7]  <-  ifelse(LA.baltimore.mv.emission.data$fips == "24510", "Baltimore", "LA")
colnames(LA.baltimore.mv.emission.data)[7]  <- "Region"

# Getting Baltimore and LA total motor vehicle emission by year
LA.baltimore.mv.emission.by.year <- ddply(LA.baltimore.mv.emission.data, .(year, Region), function(x) sum(x$Emissions))
colnames(LA.baltimore.mv.emission.by.year)[3]  <- "Total.Emission"

# Plotting the figure
png(filename = "plot6.png", 
    width = 600, height = 600, 
    units = "px")
par("mar"=c(5,5,5,5))

qplot(year, Total.Emission, data=LA.baltimore.mv.emission.by.year, color=Region, geom ="line") + 
        ggtitle(expression("LA andBaltimore" ~ PM[2.5] ~ "Emmission by Motor Vehicle from 1999 to 2008")) + 
        xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))


dev.off()
