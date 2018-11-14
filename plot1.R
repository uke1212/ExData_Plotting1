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
      
      #select subset
      dati1 <- subset(dati, Date >="2007-2-1" & Date <="2007-2-2" )

      #remove originale dataframe
      rm("dati")
      
#plot1
      #numeric globalActivePower
      globalActivePower <- as.numeric(dati1$Global_active_power)
      
      #plot
      hist(globalActivePower, col = "red", main="Global Active Power"
           ,xlab="Global Active Power (kilowatts)")
      
      #save png
      dev.copy(png, file="plot1.png", width=480, height=480)
      dev.off()

   