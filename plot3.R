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

### Plot 3
with(sub, plot(Sub_metering_1~DateTime, ylab="Energy sub metering",type="l"))
with(sub, points(Sub_metering_2~DateTime, type="l", col="red"))
with(sub, points(Sub_metering_3~DateTime, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, pt.cex=0.5)

###Saving the file
dev.copy(png, file="plot3.png")
dev.off()

