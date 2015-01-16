# Exploratory Data Analysis - Peer Assessment 2
# Amy Jiang November 20, 2014

# Q1. Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Loading provided datasets - loading from local folder
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Getting total emission by year
total.emission.by.year <- tapply(NEI$Emissions, NEI$year, sum)

# Plotting the figure
png(filename = "plot1.png", 
    width = 600, height = 600, 
    units = "px")
par("mar"=c(5,5,5,5))
plot(names(total.emission.by.year), total.emission.by.year/1e6, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions ('000,000 tons)"),
     main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"), col="Steel Blue")
dev.off()