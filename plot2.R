
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

### Plot 2
with(sub, plot(Global_active_power~DateTime, ylab="Global Active Power (kilowatts)",type="l"))

###Saving the file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
