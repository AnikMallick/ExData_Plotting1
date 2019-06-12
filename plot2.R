source("giveData.R")

df <- giveData("household_power_consumption.txt")

png("plot2.png",width = 480,height = 480)

#plot 2
with(df,plot(Date_Time,Global_active_power,
                 type = "n",xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
with(df,lines(Date_Time,Global_active_power))


dev.off()