power <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?")

power[,1] <- as.Date(power[,1],"%d/%m/%Y")

powerday <- subset(power,(Date>="2007-02-01" & Date<="2007-02-02"))

dates <- powerday[,1]
times <- powerday[,2]

datetime <- paste(dates,times)

datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

plot(datetime,powerday$Global_active_power,type="l", xlab="",ylab="Global Active Power")

plot(datetime,powerday$Voltage,type="l", xlab="datetime",ylab="Voltage")

plot(datetime,powerday$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(datetime,powerday$Sub_metering_2,type="l",col="red")
points(datetime,powerday$Sub_metering_3,type="l",col="blue")
rotulos <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colores <- c("black","red","blue")
legend(x="topright", legend=rotulos,col=colores,lty=1,box.lty=0)

plot(datetime,powerday$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,"Plot4.png") 
dev.off()
