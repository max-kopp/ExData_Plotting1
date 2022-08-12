# Download files
setwd("C:/Users/mk11_/Desktop/Coursera/John Hopkins Data Science/ExploratoryDataAnalysis/ExData_Plotting1")
fileName <- "electricData"
if(!file.exists(fileName)&!file.exists("household_power_consumption.txt")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, fileName)
}
if(!file.exists("household_power_consumption.txt")) {
    unzip(fileName)
    unlink(fileName)
}

# Load in data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
power_sub <- subset(power, is.element(power$Date, c("1/2/2007", "2/2/2007")))

# Prepare file
png(file="plot1.png", width=480, height=480)

# Create plot
hist(as.numeric(power_sub$Global_active_power), main="Global Active Power", 
     col="red", xlab="Global Active Power(kilowatts)")

# Save image
dev.off()



