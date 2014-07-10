columns<-c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric")
hhpc = read.table("household_power_consumption.txt", sep=";", header = TRUE,colClasses = columns, na.strings = "?")
#head(hhpc)
hhpc$Date_Time = strptime(paste(hhpc$Date, hhpc$Time),format="%d/%m/%Y %H:%M:%S")
hhpc <- subset(hhpc,as.Date(Date_Time) >= as.Date("2007-02-01") & as.Date(Date_Time) <= as.Date("2007-02-02"))

png("plot1.png", height=480, width=480)
hist(hhpc$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off() 
