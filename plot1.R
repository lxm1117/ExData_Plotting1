header<- read.table("household_power_consumption.txt", sep=";", head=T, skip=0, nrows=1)
subdata<- read.table("household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2880, col.names=names(header))

x<- subdata$Global_active_power
png(filename="plot1.png", width=480, height=480, units="px")
hist(x, main="Global Active Power", xlim=range(0:6), xlab="Global Active Power (kilowatts)", col="red")
dev.off()



