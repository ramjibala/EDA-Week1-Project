library(graphics)

plot3 <- function(){
        
        fileName        <- "C:/Users/sg0441538/Documents/Ramji/R/eda/household_power_consumption.txt"

        ## READ DATA
        consumptionData <- read.csv(fileName, sep=";", header=T, stringsAsFactors = F)[,c("Date","Time","Sub_metering_1","Sub_metering_2", "Sub_metering_3")]
        limitedData     <- subset(consumptionData, as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
        limitedData$x   <- paste(limitedData$Date, limitedData$Time)
        minX            <- min(limitedData$x)
        maxX            <- max(limitedData$x)

        ## SET DEVICE TYPE TO PNG, RUN GRAPHIC, UNSET DEVICE
        png(file = "plot3.png")

        plot(strptime(limitedData$x,  "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_1), xlab="", ylab="Energy sub metering",  type="n")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_1), col="black")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_2), col="red")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_3), col="blue")
        legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

        dev.off()
}