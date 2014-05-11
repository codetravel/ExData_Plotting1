## plot1.R         -- Student author: codetravel -- May-2014.
## Coursera:Exploratory Data Analysis-Assignment-1. 
## Read "household_power_consumption.txt" file and
##      - plot histogram for Global_active_power
##      - save plot as plot1.png

#--read file--
f<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#--subset file to get data for 2 required days; and required fields--
f1<-subset(f,Date=='1/2/2007',
        select =c(Date ,Time ,Global_active_power) )
f2<-subset(f,Date=='2/2/2007',
           select =c(Date ,Time ,Global_active_power) )
f3<-rbind(f1,f2)

#--remove unnecessary files from memory--
rm(f,f1,f2)

#--reformat columns to proper R data types--
f3$Time<-strptime(paste(f3$Date, f3$Time),"%d/%m/%Y %H:%M:%S")
f3$Date <- as.Date(f3$Date,"%d/%m/%Y")
f3$Global_active_power<- as.numeric(as.character(f3$Global_active_power))

#--create histogram--
hist(f3$Global_active_power,xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power")

dev.copy(png,file="plot1.png")  # copy graph to file
dev.off()                       # close file

##----end of program------
