library(graphics)

plot4 <- function(){
        
        fileName        <- "C:/Users/sg0441538/Documents/Ramji/R/eda/household_power_consumption.txt"

        ## READ DATA
        consumptionData <- read.csv(fileName, sep=";", header=T, stringsAsFactors = F)
        limitedData     <- subset(consumptionData, as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
        limitedData$x   <- paste(limitedData$Date, limitedData$Time)

        ## SET DEVICE TYPE TO PNG, RUN GRAPHIC, UNSET DEVICE
        png(file = "plot4.png")
        
        par(mfrow=c(2,2))

        ## DoW Vs Global Active Power
        plot(strptime(limitedData$x,  "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Global_active_power), xlab="", ylab="Global Active Power", cex.lab=.9, type="n")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Global_active_power))
        
        ## DateTime Vs Voltage
        plot(strptime(limitedData$x,  "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Voltage), xlab="datetime", ylab="Voltage", cex.lab=.9, type="n")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Voltage))
        
        ## DoW Vs Energy sub Metering
        plot(strptime(limitedData$x,  "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_1), xlab="", ylab="Energy sub metering", cex.lab=.9, type="n")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_1), col="black")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_2), col="red")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Sub_metering_3), col="blue")
        legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n", cex=.75)

        ## DateTime Vs Global Reactive power
        plot(strptime(limitedData$x,  "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power", cex.lab=.9, type="n")
        lines(strptime(limitedData$x, "%d/%m/%Y %H:%M:%S", tz="America/Chicago"), as.numeric(limitedData$Global_reactive_power))
        
        dev.off()
}