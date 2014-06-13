#assume in the working directory
header<- read.table("household_power_consumption.txt", sep=";", head=T, skip=0, nrows=1)
subdata<- read.table("household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2880, col.names=names(header))

days<-paste(subdata$Date, subdata$Time)
days<-as.POSIXlt(days, format="%d/%m/%Y %H:%M:%S")

#plot the graph
png(filename="plot3.png", width=480, height=480, units="px")
plot(days, subdata$Sub_metering_1, type="l", lwd=1, col="Black", xlab=" ", ylab="Energy sub metering")

lines(days, subdata$Sub_metering_2, col="Red")
lines(days, subdata$Sub_metering_3, col="Blue")
legend("topright", pch=1, col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

