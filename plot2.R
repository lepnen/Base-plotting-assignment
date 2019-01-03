library(lubridate)
library(dplyr)
dat <- read.csv2("./week1/household_power_consumption.txt")

dat$Date <- as.POSIXct(strptime(dat$Date, "%d/%m/%Y"))
dat_2 <- dat %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")
dat_2$Global_active_power <- as.numeric(as.character(dat_2$Global_active_power))
dat_2$datetime <- as_datetime(paste(dat_2$Date, dat_2$Time))

png("./week1/plot2.png")
with(dat_2, plot(x = datetime, y = Global_active_power, type =  "l", ylab = "Global Active Power (kilowatts)", main = "", xlab = ""))
dev.off()
