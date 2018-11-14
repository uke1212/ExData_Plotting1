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
      table(dati1$Sub_metering_1)
      
#modify sub_metering_1/2 from character to numeric
      dati1$Sub_metering_1 <- as.numeric(dati1$Sub_metering_1)
      dati1$Sub_metering_2 <- as.numeric(dati1$Sub_metering_2)
      
#plot3
      with(dati1, {
              plot(Sub_metering_1~Datetime, type="l",
                 ylab="Global Active Power (kilowatts)", xlab="")
              lines(Sub_metering_2~Datetime,col='Red')
              lines(Sub_metering_3~Datetime,col='Blue')
      })
#save png
      dev.copy(png, file="plot3.png", width=480, height=480)
      dev.off()
      