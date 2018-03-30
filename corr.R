corr <- function(directory, threshold = 0)
{
   ##kindly extract the specdata.zip directly in your working directory 
   corrl_vct <- NULL
   for (i in 1:332) 
   {
      ##read 1st 09 csv files
      if(i < 10)
      {
         ##using paste to concatinate the file path name
         data1 <- read.csv(paste("./",directory,"/00", as.character(i), ".csv", sep = ""), as.is = T, header = T)
      }
      ##read from 10 to 99 csv files
      else if(i < 100)
      {
         data1 <- read.csv(paste("./",directory,"/0", as.character(i), ".csv", sep = ""), as.is = T, header = T)
      }
      ##read from 100 to 332 csv files
      else
      {
         data1 <- read.csv(paste("./",directory,"/", as.character(i), ".csv", sep = ""), as.is = T, header = T)
      }
      
      data2 <- data1[complete.cases(data1),]
      if(nrow(data2) > threshold)
      {
         corrl_vct <- c(corrl_vct, cor(data2[, "sulfate"], data2[, "nitrate"]))
      }
   }
   return(corrl_vct)
}