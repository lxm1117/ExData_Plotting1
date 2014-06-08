header<- read.table("household_power_consumption.txt", sep=";", head=T, skip=0, nrows=1)
subdata<- read.table("household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2880, col.names=names(header))

days<-paste(subdata$Date, subdata$Time)
days<-as.POSIXlt(days, format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480, units="px")
par(mar=c(5.5,4,4,3))
plot(days, x, type="l", lwd=1, ylab="Global Active Power (killowatts)", xlab="  " )
dev.off()
