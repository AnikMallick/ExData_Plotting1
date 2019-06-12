source("giveData.R")

df <- giveData("household_power_consumption.txt")

png("plot1.png",width = 480,height = 480)

#plot 1
hist(df$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",col = "red",
     main = "Global Active Power")

dev.off()
