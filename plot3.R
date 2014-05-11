# plot3.R         -- Student author: codetravel -- May-2014.
## Coursera:Exploratory Data Analysis-Assignment-1. 
## Read "household_power_consumption.txt" file and
##      - plot line graph for Sub_metering_1 ,Sub_metering_2 ,Sub_metering_3
##      - save plot as plot3.png

#--read file--
f<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#--subset file to get data for 2 required days; and required fields--
f1<-subset(f,Date=='1/2/2007',
        select =c(Date ,Time ,Sub_metering_1 ,Sub_metering_2 ,Sub_metering_3) )
f2<-subset(f,Date=='2/2/2007',
        select =c(Date ,Time ,Sub_metering_1 ,Sub_metering_2 ,Sub_metering_3) )
f3<-rbind(f1,f2)

#--remove unnecessary files from memory--
rm(f,f1,f2)

#--reformat columns to proper R data types--
f3$Time<-strptime(paste(f3$Date, f3$Time),"%d/%m/%Y %H:%M:%S")
f3$Date <- as.Date(f3$Date,"%d/%m/%Y")
f3$Sub_metering_1<- as.numeric(as.character(f3$Sub_metering_1))
f3$Sub_metering_2<- as.numeric(as.character(f3$Sub_metering_2))
f3$Sub_metering_3<- as.numeric(as.character(f3$Sub_metering_3))

#--open file to capture the graph--
png(file="plot3.png",width=480, height=480)  

#--create line plot--
plot(f3$Time, f3$Sub_metering_1, type='l', 
     xlab="", ylab="Energy sub metering")
points(f3$Time, f3$Sub_metering_2, type='l',col="red")  #adding 2nd field
points(f3$Time, f3$Sub_metering_3, type='l',col="blue") #adding 3rd field

#--add legends to graph--
legend("topright", lwd=2.5,   col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()                       # close file

##----end of program------