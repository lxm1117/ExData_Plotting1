header<- read.table("household_power_consumption.txt", sep=";", head=T, skip=0, nrows=1)
subdata<- read.table("household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2880, col.names=names(header))

days<-paste(subdata$Date, subdata$Time)
days<-as.POSIXlt(days, format="%d/%m/%Y %H:%M:%S")


png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(days, subdata$Global_active_power, type="l", xlab=" ", ylab="Global Active Power", main="  ")
plot(days, subdata$Voltage, type="l", xlab="datetime ", ylab="Voltage", main="  ")
plot(days, subdata$Sub_metering_1, type="l", xlab="  ", ylab="Energy sub metering", main="  ")
lines(days, subdata$Sub_metering_2, col="red")> lines(days, subdata$Sub_metering_3, col="blue")> legend("topright", pch=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd=0)
plot(days,subdata$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power", main="  ") 
dev.off()

