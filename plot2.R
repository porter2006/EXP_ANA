##Read in CSV file
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Get Data within appropriate dates
small_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Change dates within small_data
datetime <- paste(as.Date(small_data$Date), small_data$Time)
small_data$Datetime <- as.POSIXct(datetime)

## Create Plot 
plot(small_data$Global_active_power~small_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save .PNG file
dev.copy(png, file="plot2.png", height=480, width=400)
dev.off()
