source("giveData.R")

df <- giveData("household_power_consumption.txt")

png("plot4.png",width = 480,height = 480)

#plot 4

par(mfrow=c(2,2),mar=c(4,4,2,1))
##1
with(df,plot(Date_Time,Global_active_power,
                 type = "n",xlab = "",
                 ylab = "Global Active Power"))
with(df,lines(Date_Time,Global_active_power))

#2
with(df,plot(Date_Time,Voltage,
                 type = "n",xlab = "datetime",
                 ylab = "Voltage"))
with(df,lines(Date_Time,Voltage))

#3

text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(df,plot(Date_Time,Sub_metering_1,type = "n",
             ylab = "Energy sub metering",
             xlab =""))
with(df,lines(Date_Time,Sub_metering_1,col="black"))
with(df,lines(Date_Time,Sub_metering_2,col="red"))
with(df,lines(Date_Time,Sub_metering_3,col="blue")) 
legend('topright',lty = 1,lwd=2,col=c("black","red","blue"),legend = text)

#4

with(df,plot(Date_Time,Global_reactive_power,
                 type = "n",xlab = "datetime",
                 ylab = "Global_reactive_power"))
with(df,lines(Date_Time,Global_reactive_power))


dev.off()