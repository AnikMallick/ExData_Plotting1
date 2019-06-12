library(dplyr)
library(lubridate)

giveData<- function(path){
    df_hpc <- tbl_df(read.table(path,
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
    return(df_hpc)
}