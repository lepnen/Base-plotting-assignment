library(dplyr)
dat <- read.csv2("./week1/household_power_consumption.txt")

dat$Date <- as.POSIXct(strptime(dat$Date, "%d/%m/%Y"))
dat_2 <- dat %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")
dat_2$Global_active_power <- as.numeric(as.character(dat_2$Global_active_power))

png("./week1/plot1.png")
with(dat_2, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
