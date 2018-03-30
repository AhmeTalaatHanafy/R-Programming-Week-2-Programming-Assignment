pollutantmean <- function(directory, pollutant, id = 1:332)
{
   ##kindly extract the specdata.zip directly in your working directory 
 alldata <- data.frame()
 for (i in id) 
 {
         ##read 1st 09 csv files
          if(i < 10)
          {
             ##using paste to concatinate the file path name
            data1 <- read.csv(paste("./",directory,"/00", as.character(i), ".csv", sep = ""), as.is = T, header = T)
            alldata <- rbind(alldata, data1)
          }
         ##read from 10 to 99 csv files
          else if(i < 100)
          {
           data1 <- read.csv(paste("./",directory,"/0", as.character(i), ".csv", sep = ""), as.is = T, header = T)
           alldata <- rbind(alldata, data1)
          }
         ##read from 100 to 332 csv files
          else
          {
           data1 <- read.csv(paste("./",directory,"/", as.character(i), ".csv", sep = ""), as.is = T, header = T)
           alldata <- rbind(alldata, data1)
          }
 }
 ##returning the mean with removing th NAs
 return(mean(alldata[, pollutant], na.rm = T))
}