#Read data and select row

#Read data and select row
      #read data
            setwd("D:\\CORSO_DATA_SCIENCES\\4_MODULO\\week_1\\PROGETTO")
            dati <- read.csv("household_power_consumption.txt"
                       , header=T
                       , sep=';'
                       , na.strings=c("","NA")
                       , stringsAsFactors=FALSE)

      #modify Date variable
            dati$Date <- as.Date(dati$Date, format="%d/%m/%Y")
      #modify Typ
      #select subset
            dati1 <- subset(dati, Date >="2007-2-1" & Date <="2007-2-2" )
      
#remove originale dataframe
      rm("dati")
            
#convertig dates
      datetime <- paste(as.Date(dati1$Date), dati1$Time)
      dati1$Datetime <- as.POSIXct(datetime)

#plot2
      #change weekdays from Italian to English
            Sys.setlocale()
            weekdays(Sys.Date()+0:6)
            Sys.setlocale("LC_TIME","English")
            weekdays(Sys.Date()+0:6)

      #plot
            plot(dati1$Global_active_power~dati1$Datetime, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
      
      #saving png      
            dev.copy(png, file="plot2.png", width=480, height=480)
            dev.off()
      