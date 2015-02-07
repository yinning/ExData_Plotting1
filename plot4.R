wd <- "D:\\Dropbox\\Coursera\\01 Data Science\\04 Exploratory Data Analysis\\Programming Assignment 1"
setwd(wd)

### Read in the data; change the date and time format
data <- read.table("./data/household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")

### Convert Dates for x axis
date_and_time <- paste(data$Date,data$Time)
data$DateTime <- strptime(date_and_time, format="%d/%m/%Y %H:%M:%S", tz="")
data$DateTime <- as.POSIXct(data$DateTime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

### Subset the data
sub <- data[data$Date>= "2007-02-01" & data$Date <= "2007-02-02",]

### Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,2))

## Top Left
with(sub, plot(Global_active_power~DateTime, ylab="Global Active Power", xlab="", type="l"))

## Top Right
with(sub, plot(Voltage~DateTime, ylab="Voltage", xlab="datetime",type="l"))

## Bottom Left
with(sub, plot(Sub_metering_1~DateTime, ylab="Energy sub metering", xlab="", type="l"))
with(sub, points(Sub_metering_2~DateTime, type="l", col="red"))
with(sub, points(Sub_metering_3~DateTime, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1,lwd=2,cex=0.6,bty="n")

## Bottom Right
with(sub, plot(Global_reactive_power~DateTime, ylab="Global_reactive_power", xlab="datetime",type="l"))

###Saving the file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
