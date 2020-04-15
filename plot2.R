make_plot2.png <- function(path){#this is the function to make the plot using your own path and save it in as a png file in your wd
  
  big_file <- read.csv(path,sep=";")  #open the file
  big_file$Date<-as.Date(big_file$Date,format ="%d/%m/%Y")   #convert the dates from the factor class to the date class
  
  
  big_file_subset1 <- subset(big_file,big_file$Date=="2007/02/01")#this line is to take only the first day to examinate
  big_file_subset <- subset( big_file,big_file$Date=="2007/02/02")#this take the second day
  
  global_subset <- rbind(big_file_subset1,big_file_subset)  #here a date frame composed by the two previous day is created with rbind(data.frame())
  global_subset$Global_active_power<-as.numeric(as.character(global_subset$Global_active_power)) #transform ? in NA
  global_subset$Time <- as.character(global_subset$Time)
  global_subset$Date <- paste(global_subset$Date,global_subset$Time)  #because both the days and the times are repeated but their combination are unique. Here I then pasted the times and the dates to obtain unique values
  global_subset$Date <- as.POSIXct(global_subset$Date, format="%Y-%m-%d %H:%M:%S") #conversion from character to date
  
  plot.new()
  png("plot2.png", width=8, height=7, units="in", res=70) #png device declaring also the dimension and the resolution of the image
  
  par(mar=c(4,5,5,4))   #define the margins of the image
  plot(global_subset$Date,global_subset$Global_active_power,type= "l",ylab="Global Active Power (kilowatts)",xlab="",cex.lab=1)
  
  dev.off()
}
make_plot2.png("put your path here!")
