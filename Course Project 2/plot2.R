# Exploratory Data Analysis - Peer Assessment 2
# Amy Jiang November 20, 2014

# Q2. Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == 24510) from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

# Loading provided datasets - loading from local folder
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting data for Baltimore
baltimore.emission <- subset(NEI, fips == "24510")

# Getting Baltimore's total emission by year
baltimore.emission.by.year <- tapply(baltimore.emission$Emissions, baltimore.emission$year, sum)

# Plotting the figure
png(filename = "plot2.png", 
    width = 600, height = 600, 
    units = "px")
par("mar"=c(5,5,5,5))
plot(names(baltimore.emission.by.year), baltimore.emission.by.year/1e6, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions ('000,000 tons)"),
     main=expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), col="Steel Blue")
dev.off()