
power <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?")

power[,1] <- as.Date(power[,1],"%d/%m/%Y")

powerday <- subset(power,(Date>="2007-02-01" & Date<="2007-02-02"))

hist(powerday$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)")

dev.copy(png,"Plot1.png")
dev.off()