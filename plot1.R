make_plot1.png <- function(path){
  
  big_file <- read.csv(path,sep=";")
  
  big_file$Date <- as.character(big_file$Date)
  big_file$Date<-as.Date(big_file$Date,format ="%d/%m/%Y")
  
  big_file_subset1 <- subset(big_file,big_file$Date=="2007/02/01")
  big_file_subset <- subset( big_file,big_file$Date=="2007/02/02")
  
  global_subset <- rbind(big_file_subset1,big_file_subset)
  global_subset$Global_active_power<-as.numeric(as.character(global_subset$Global_active_power)) #transform ? in NA
  
  plot.new()
  png("plot1.png", width=8, height=7.5, units="in", res=70)
  
  par(mar=c(5,5,4,4))
  hist(global_subset$Global_active_power,col="red",xlab="Global active power (kilowatts)",ylab="Frequency",main="Global Active Power",cex.lab=1) #hist of the two days together excluding NA
  
  dev.off()
  
}
make_plot1.png("put your path here!")


