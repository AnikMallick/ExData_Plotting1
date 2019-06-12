library(dplyr)
library(lubridate)
df_hpc <- tbl_df(read.table("household_power_consumption.txt",
                            header = TRUE, sep = ";",na.strings = "?",
                            stringsAsFactors = FALSE))

backup_df_hcp <- df_hpc
#date formate DD/MM/YYYY
df_hpc <- filter(df_hpc, Date == "1/2/2007" | Date == "2/2/2007")

date_time <- df_hpc %>% 
    select(Date,Time) %>% 
    (function(data) data.frame("Date_Time" = paste(data$Date,data$Time,sep = "-"))) %>%
    transform(Date_Time = dmy_hms(Date_Time))

df_hpc <- df_hpc %>% mutate(Date_Time = date_time$Date_Time) %>%
    select(Date_Time,everything()) %>%arrange(Date_Time)

#plot 2

with(df_hpc,plot(Date_Time,Global_active_power,
                 type = "n",xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
with(df_hpc,lines(Date_Time,Global_active_power))

#plot 1
hist(df_hpc$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",col = "red")

#plot 3
png(file= "plot3.png",width = 480,height = 480)
text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(df_hpc,plot(Date_Time,Sub_metering_1,type = "n",
                 ylab = "Energy sub metering"))
with(df_hpc,lines(Date_Time,Sub_metering_1,col="black"))
with(df_hpc,lines(Date_Time,Sub_metering_2,col="red"))
with(df_hpc,lines(Date_Time,Sub_metering_3,col="blue")) 
legend('topright',lty = 1,lwd=1,col=c("black","red","blue"),
       legend = text)
dev.off()


#Plot 4
par(mfrow=c(2,2),mar=c(4,4,2,1))
##1
with(df_hpc,plot(Date_Time,Global_active_power,
                 type = "n",xlab = "",
                 ylab = "Global Active Power"))
with(df_hpc,lines(Date_Time,Global_active_power))

#2
with(df_hpc,plot(Date_Time,Voltage,
                 type = "n",xlab = "datetime",
                 ylab = "Voltage"))
with(df_hpc,lines(Date_Time,Voltage))

#3

text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(df_hpc,plot(Date_Time,Sub_metering_1,type = "n",
                 ylab = "Energy sub metering"))
with(df_hpc,lines(Date_Time,Sub_metering_1,col="black"))
with(df_hpc,lines(Date_Time,Sub_metering_2,col="red"))
with(df_hpc,lines(Date_Time,Sub_metering_3,col="blue")) 
legend('topright',lty = 1,lwd=1,col=c("black","red","blue"),
       legend = text)

#4

with(df_hpc,plot(Date_Time,Global_reactive_power,
                 type = "n",xlab = "datetime",
                 ylab = "Global_reactive_power"))
with(df_hpc,lines(Date_Time,Global_reactive_power))







