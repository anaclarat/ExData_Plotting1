#Setting working directory
setwd('D:/DataScienceSpecialization/4-Exploratory_Data_Analysis/Week1/Project/ExData_Plotting1')

#Downloading data

if (!file.exists('./data'))
{dir.create('./data')}

url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url,destfile = './data/data.zip',method = 'curl')

#Unzip data
if (!file.exists('./data/household_power_consumption.txt'))
{unzip('./data/data.zip',exdir = './data')}

#Reading data and formatting
data <- read.csv('./data/household_power_consumption.txt',sep=';')
head(data)
data$Date <- as.Date(data$Date,'%d/%m/%Y')
head(data)
data$Time <- as.POSIXlt(data$Time,'%H:%M:%S')

#Subsetting
subdata <- subset(data,Date == '2007-02-01' | Date == '2007-02-02')
subdata

#Plotting
png(filename = 'plot1.png',bg= 'transparent')
hist(as.numeric(subdata$Global_active_power),col = 'red',ylab = 'Frequency',
     xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')
dev.off()