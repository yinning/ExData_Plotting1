
wd <- "D:\\Dropbox\\Coursera\\01 Data Science\\04 Exploratory Data Analysis\\Programming Assignment 1"
setwd(wd)

### Read in the data; change the date and time format
data <- read.table("./data/household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

### Subset the data
sub <- data[data$Date>= "2007-02-01" & data$Date <= "2007-02-02",]

### Plot 1
hist(sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

###Saving the file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
