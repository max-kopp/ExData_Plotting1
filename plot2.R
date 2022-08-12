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
power <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", na.strings="?")
power_sub <- subset(power, is.element(power$Date, c("1/2/2007", "2/2/2007")))

# Convert the Date and Time variables
power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")
#power_sub$Time <- strptime(power_sub$Time, format="%H:%M:%S")
time <- as.POSIXct(paste(power_sub$Date, power_sub$Time))

# Prepare file
png(file="plot2.png", width=480, height=480)

# Create plot
plot.new()
plot(time, power_sub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

# Save file
dev.off()


