complete <- function(directory, id1 = 1:332)
{
   ##kindly extract the specdata.zip directly in your working directory 
   finalData <- data.frame()
   for (i in id1) 
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
      
      ##calculating the completed cases in nobs
      nobs <- sum(complete.cases(data1))
      ##assign the calculated record into dataFrame of 2 Cols (id, nobs)
      id <- i ##storing value of i into id to assign it to the col id in dataFrame
      dataFrame <- data.frame(id, nobs)
      ##comining to finalData 
      finalData <- rbind(finalData, dataFrame)
   }
   return(finalData)
}