library(lubridate)
library(dplyr)
dat <- read.csv2("./week1/household_power_consumption.txt")

dat$Date <- as.POSIXct(strptime(dat$Date, "%d/%m/%Y"))
dat_2 <- dat %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")
dat_2$Sub_metering_1 <- as.numeric(as.character(dat_2$Sub_metering_1))
dat_2$Sub_metering_2 <- as.numeric(as.character(dat_2$Sub_metering_2))
dat_2$Sub_metering_3 <- as.numeric(as.character(dat_2$Sub_metering_3))

dat_2$datetime <- as_datetime(paste(dat_2$Date, dat_2$Time))

png("./week1/plot3.png")
with(dat_2, plot(x = datetime, y = Sub_metering_1, type =  "l", ylab = "Energy sub metering", main = "", xlab = ""))
with(dat_2, lines(x = datetime, y = Sub_metering_2, col = "red"))
with(dat_2, lines(x = datetime, y = Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
