#set working directory where contents of the class project files were unzipped to
#C:\JohnsHopkins\Class4_EDA\Project1
setwd("C:/JohnsHopkins/Class4_EDA/Project1")
getwd()
#Reference files from a set working directory location
#Load the entire dataset
mydataEDA<- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

head(mydataEDA)

#Format the data to clean it up
mydataEDA$Date <- as.Date(mydataEDA$Date, format="%d/%m/%Y")
head(mydataEDA)

#Review the dataset
dim(mydataEDA)
head(mydataEDA)
View(mydataEDA)

## Subsetting the data
mydataEDA2 <- subset(mydataEDA, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dim(mydataEDA2)
head(mydataEDA2)
View(mydataEDA2)
##Remove full dataset (don't need it anymore)
rm(mydataEDA)

## Converting dates
datetime <- paste(as.Date(mydataEDA2$Date), mydataEDA2$Time)
mydataEDA2$Datetime <- as.POSIXct(datetime)
str(mydataEDA2)

#################################################################################
## Plot 1
hist(mydataEDA2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

################################################################################