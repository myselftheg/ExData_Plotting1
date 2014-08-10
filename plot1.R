readData<-function(){
  data<-read.table("household_power_consumption.txt",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),header=TRUE,na.string="?",strip.white=TRUE,sep=";")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data$Time<-strptime(data$Time,format="%H:%M:%S")
  z<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",]
  z
}
plot1<-function(){
  z<-readData();
  hist(z$Global_active_power,xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red");
  dev.copy(png,file=fileName,width=480,height=480);
  dev.off();
}