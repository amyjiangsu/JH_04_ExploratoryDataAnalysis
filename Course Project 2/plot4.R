# Exploratory Data Analysis - Peer Assessment 2
# Amy Jiang November 20, 2014

# Q4. Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# Loading provided datasets - loading from local folder
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Finding SCC code for coal combusion-related emission
coal.emission.code <- grep("coal", SCC$Short.Name, ignore.case = T)
coal.emission.code  <- SCC[coal.emission.code,]

# Subsetting NEI data using coal.emission.code
coal.emission.data <- NEI[NEI$SCC %in% coal.emission.code$SCC, ]

# Getting total coal emission by year
coal.emission.by.year <- tapply(coal.emission.data$Emissions, coal.emission.data$year, sum)

# Plotting the figure
png(filename = "plot4.png", 
    width = 600, height = 600, 
    units = "px")
par("mar"=c(5,5,5,5))

plot(names(coal.emission.by.year), coal.emission.by.year/1e5, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission in '00,000 tons"), col="Steel Blue")

dev.off()
