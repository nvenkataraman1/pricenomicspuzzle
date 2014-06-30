if(!grep("code",getwd(),ignore.case=TRUE))
    setwd(paste(getwd(),"code",sep="/"))

source("./ratePick.R")
source("./arbitragePermCombos.R")
source("./replaceCurrLabels.R")

require(combinat)
require(dplyr)

rate_sequence <- arbitragePermCombos(currCodes)

## setting up a linear sequence flow of exchange rates
## appending base currency at the end

rate_sequence <- rate_sequence[2:dim(rate_sequence)[1],]

startAmt <- 1 ## starting amount in base currency

for(i in 1:dim(rate_sequence)[1]) {
    
    zeroBound <- length(which(rate_sequence[i,]!=0))+1
    
    currCodesLength <- length(currCodes)
    
    if(zeroBound <= currCodesLength) {
        rate_sequence[i,zeroBound] <- rate_sequence[i,1]
        
        for(j in (zeroBound+1):(currCodesLength+1))
            rate_sequence[i,paste("X",j,sep="")] <- 0
    }
    else {
            rate_sequence[i,paste("X",(currCodesLength+1),sep="")] <- rate_sequence[i,1]
    }
        
    multValue <- 1
    
    for (j in (1:(zeroBound-1))) {
        multValue <- multValue * conversionValue(rate_sequence[i,j],rate_sequence[i,j+1])
    }
    
    rate_sequence[i,"ValueGain"] <- round((startAmt * multValue),6) - startAmt
    
}

result <- rate_sequence %>% 
                filter(ValueGain > 0) %>% 
                    mutate(PercentGain = paste(round((ValueGain*100/startAmt),2),"%"))

result <- replaceCurrLabels(result,currCodes)

print(result)