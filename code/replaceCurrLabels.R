replaceCurrLabels <- function(rateOutput,currCodes) {
    
    rateOutput[,1:5] <- replace(rateOutput[,1:5],rateOutput[,1:5] == 0,"")
    
    for(j in 1:(length(currCodes)+1)) {
        rateOutput[,1:5] <- replace(rateOutput[,1:5],rateOutput[,1:5] == j,currCodes[j])        
    }
    rateOutput
}