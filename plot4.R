# plot4.R         -- Student author: codetravel -- May-2014.
## Coursera:Exploratory Data Analysis-Assignment-1. 
## Read "household_power_consumption.txt" file and
##      - plot 4 graphs
##      - save plot as plot4.png

#--read file--
f<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#--subset file to get data for 2 required days--
f1<-subset(f,Date=='1/2/2007')
f2<-subset(f,Date=='2/2/2007')
f3<-rbind(f1,f2)

#--remove files from memory--
rm(f,f1,f2)

#--get columns in the correct format--
f3$Time<-strptime(paste(f3$Date, f3$Time),"%d/%m/%Y %H:%M:%S")
f3$Date <- as.Date(f3$Date,"%d/%m/%Y")
f3$Global_active_power<- as.numeric(as.character(f3$Global_active_power))
f3$Global_reactive_power<- as.numeric(as.character(f3$Global_reactive_power))
f3$Voltage<- as.numeric(as.character(f3$Voltage))
f3$Sub_metering_1<- as.numeric(as.character(f3$Sub_metering_1))
f3$Sub_metering_2<- as.numeric(as.character(f3$Sub_metering_2))
f3$Sub_metering_3<- as.numeric(as.character(f3$Sub_metering_3))


#--open file to capture the graph; set parameters--
png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0)) 
   # mfrow: # 4 graphs 2x2; mar:margin; oma: outer margin

#plot-1
plot(f3$Time, f3$Global_active_power, type='l', 
     xlab="", ylab="Global Active Power")

#plot-2
plot(f3$Time, f3$Voltage, type='l', 
     xlab="datetime", ylab="Voltage")

#plot-3
plot(f3$Time, f3$Sub_metering_1, type='l', 
     xlab="", ylab="Energy sub metering")
points(f3$Time, f3$Sub_metering_2, type='l',col="red")
points(f3$Time, f3$Sub_metering_3, type='l',col="blue")

legend("topright", lwd=2.5, bty="n",  col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot-4
plot(f3$Time, f3$Global_reactive_power, type='l', 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()                       # close file

##----end of program------
