library(graphics)

plot2 <- function(){
        
        fileName        <- "C:/Users/sg0441538/Documents/Ramji/R/eda/household_power_consumption.txt"

        ## READ DATA
        consumptionData <- read.csv(fileName, sep=";", header=T, stringsAsFactors = F)[,c("Date","Time","Global_active_power")]
        limitedData     <- subset(consumptionData, as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
        limitedData$x   <- paste(limitedData$Date, limitedData$Time)

        ## SET DEVICE TYPE TO PNG, RUN GRAPHIC, UNSET DEVICE
        png(file = "plot2.png")
        plot(strptime(limitedData$x,  "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="n")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Global_active_power))
        dev.off()
}