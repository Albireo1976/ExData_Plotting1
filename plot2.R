power <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?")

power[,1] <- as.Date(power[,1],"%d/%m/%Y")

powerday <- subset(power,(Date>="2007-02-01" & Date<="2007-02-02"))

dates <- powerday[,1]
times <- powerday[,2]

datetime <- paste(dates,times)

datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")




plot(datetime,powerday$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,"Plot2.png")
dev.off()