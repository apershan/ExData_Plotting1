#### Load the data

data<-read.csv('household_power_consumption.txt',na.strings='?',sep=';')
household_power<-subset(data,data$Date %in% c('1/2/2007','2/2/2007')) 
#only need 2-1-2007 and 2-2-2007, data in DD/MM/YYYY format

#### Create the histogram plot
with(household_power,hist(Global_active_power,xlab='Global Active Power (kilowatts)',col='red',main='Global Active Power'))

####Create 480x480 png file with plot

#if previously created histogram on screen
dev.copy(png,'plot1.png')
dev.off()
#if running for the first time
png(file='plot1.png') #open png device
with(household_power,hist(Global_active_power,xlab='Global Active Power (kilowatts)',col='red',main='Global Active Power'))
dev.off()