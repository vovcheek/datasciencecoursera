pollutantmean <- function(directory, pollutant, id = 1:332) {
  location <- paste(getwd(), "/", directory, sep = '')
  
  monitors <- list.files(location)
  fileP = file.path(paste(getwd(), "/", directory, "/", monitors[id[1]], sep = ''))
  workSet <- read.csv(fileP, header = TRUE, sep=',')
  
  if(length(id) > 1){
    for(i in id[2:length(id)]) {
      fileP = file.path(paste(getwd(), "/", directory, "/", monitors[i], sep = ''))
      workSet <- rbind(workSet, read.csv(fileP, header = TRUE, sep=','))
    }
  }
  
  workSetNoNA <- workSet[complete.cases(workSet),]
  meanPollutant <- mean(workSetNoNA[[pollutant]])
  
  return(meanPollutant)
}
