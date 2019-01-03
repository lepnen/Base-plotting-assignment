library(lubridate)
library(dplyr)
dat <- read.csv2("./week1/household_power_consumption.txt")

dat$Date <- as.POSIXct(strptime(dat$Date, "%d/%m/%Y"))
dat_2 <- dat %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")
dat_2$Global_active_power <- as.numeric(as.character(dat_2$Global_active_power))
dat_2$Voltage <- as.numeric(as.character(dat_2$Voltage))
dat_2$Global_reactive_power <- as.numeric(as.character(dat_2$Global_reactive_power))
dat_2$Sub_metering_1 <- as.numeric(as.character(dat_2$Sub_metering_1))
dat_2$Sub_metering_2 <- as.numeric(as.character(dat_2$Sub_metering_2))
dat_2$Sub_metering_3 <- as.numeric(as.character(dat_2$Sub_metering_3))

dat_2$datetime <- as_datetime(paste(dat_2$Date, dat_2$Time))

png("./week1/plot4.png")

par(mfrow = c(2,2))
# top left
with(dat_2, plot(x = datetime, y = Global_active_power, type =  "l", ylab = "Global Active Power (kilowatts)", main = "", xlab = ""))
# top right
with(dat_2, plot(x = datetime, y = Voltage, type =  "l", ylab = "Voltage", main = "", xlab = "datetime"))
# bottom left
with(dat_2, plot(x = datetime, y = Sub_metering_1, type =  "l", ylab = "Energy sub metering", main = "", xlab = ""))
with(dat_2, lines(x = datetime, y = Sub_metering_2, col = "red"))
with(dat_2, lines(x = datetime, y = Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# bottom right
with(dat_2, plot(x = datetime, y = Global_reactive_power, type =  "l", ylab = "Global_reactive_power", main = "", xlab = "datetime"))

dev.off()
