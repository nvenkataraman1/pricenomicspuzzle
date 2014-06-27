source("./ratePick.R")
source("./arbitragePermCombos.R")
source("./replaceCurrLabels.R")

require(combinat)
require(dplyr)

## creating a permutation of potential exchange rate sequences
#rate_sequence <- permn(colnames(ratematrix))

rate_sequence <- arbitragePermCombos(currCodes)
#print(rate_sequence)

## setting up a linear sequence flow of exchange rates
## appending base currency at the end
#rate_sequence <- data.frame(matrix(unlist(rate_sequence),ncol=4,byrow=T))
#rate_sequence[,"X5"] <- rate_sequence[,1]

rate_sequence <- rate_sequence[2:dim(rate_sequence)[1],]

#print(rate_sequence)

startAmt <- 1 ## starting amount in base currency

for(i in 1:dim(rate_sequence)[1]) {
    
    zeroBound <- length(which(rate_sequence[i,]!=0))+1
    
    if(zeroBound <= length(currCodes)) {
        rate_sequence[i,zeroBound] <- rate_sequence[i,1]
        rate_sequence[i,"X5"] <- 0
    }
    else {
        rate_sequence[i,"X5"] <- rate_sequence[i,1]
    }
        
    
    rate_sequence[i,"ValueGain"] <- round(as.numeric(startAmt *
                                     conversionValue(rate_sequence[i,1],rate_sequence[i,2]) *
                                     conversionValue(rate_sequence[i,2],rate_sequence[i,3]) *
                                     conversionValue(rate_sequence[i,3],rate_sequence[i,4]) *
                                     conversionValue(rate_sequence[i,4],rate_sequence[i,5])),6) - startAmt
}

#print(rate_sequence)

result <- rate_sequence %>% 
                filter(ValueGain > 0) %>% 
                    mutate(PercentGain = paste(round((ValueGain*100/startAmt),2),"%"))

names(result)[1:5] <- c("C1","C2","C3","C4","C5")

result <- replaceCurrLabels(result,currCodes)

print(result)