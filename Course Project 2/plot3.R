# Exploratory Data Analysis - Peer Assessment 2
# Amy Jiang November 20, 2014

# Q3. Of the four types of sources indicated by the type (point, 
# nonpoint, onroad, nonroad) variable, which of these four sources have 
# seen decreases in emissions from 1999–2008 for Baltimore City? Which 
# have seen increases in emissions from 1999–2008? Use the ggplot2 plotting
# system to make a plot answer this question

# Loading required libraries
library(ggplot2)
library(plyr)

# Loading provided datasets - loading from local folder
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting data for Baltimore
baltimore.emission <- subset(NEI, fips == "24510")

# Getting Baltimore's total emission by year by type
baltimore.emission.by.year.by.type <- ddply(baltimore.emission, .(year, type), function(x) sum(x$Emissions))

# Adding column name to emission total column
colnames(baltimore.emission.by.year.by.type) [3]  <- "Emission.Total"

# Plotting the figure
png(filename = "plot3.png", 
    width = 600, height = 600, 
    units = "px")
par("mar"=c(5,5,5,5))

qplot(year, Emission.Total, data=baltimore.emission.by.year.by.type, color=type, geom ="line") + 
        ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by Type and Year")) + 
        xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))

dev.off()