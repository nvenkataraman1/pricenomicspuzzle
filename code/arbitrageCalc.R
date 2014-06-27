source("./ratePick.R")
require(combinat)
require(dplyr)

## creating a permutation of potential exchange rate sequences
rate_sequence <- permn(colnames(ratematrix))

## setting up a linear sequence flow of exchange rates
## appending base currency at the end
rateseqdf <- data.frame(matrix(unlist(rate_sequence),ncol=4,byrow=T))
rateseqdf[,"X5"] <- rateseqdf[,1]

startAmt <- 100 ## starting amount in base currency

for(i in 1:dim(rateseqdf)[1])
    rateseqdf[i,"Value"] <- (startAmt *
                    conversionValue(rateseqdf[i,1],rateseqdf[i,2]) *
                        conversionValue(rateseqdf[i,2],rateseqdf[i,3]) *
                            conversionValue(rateseqdf[i,3],rateseqdf[i,4]) *
                                conversionValue(rateseqdf[i,4],rateseqdf[i,5])) - startAmt

result <- rateseqdf %>% 
                filter(Value > 0) %>% 
                    mutate(Gain = paste(round((Value*100/startAmt),2),"%"))

print(result)