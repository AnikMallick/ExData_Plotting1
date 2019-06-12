source("giveData.R")

df <- giveData("household_power_consumption.txt")

png("plot3.png",width = 480,height = 480)

#plot 3
text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(df,plot(Date_Time,Sub_metering_1,type = "n",
             ylab = "Energy sub metering",
             xlab = ""))
with(df,lines(Date_Time,Sub_metering_1,col="black"))
with(df,lines(Date_Time,Sub_metering_2,col="red"))
with(df,lines(Date_Time,Sub_metering_3,col="blue")) 
legend('topright',lty = 1,lwd=2,col=c("black","red","blue"),
       legend = text)

dev.off()