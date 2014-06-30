replaceCurrLabels <- function(rateOutput,currCodes) {
    
    currCodesLength <- (length(currCodes)+1)
    
    rateOutput[,1:currCodesLength] <- replace(rateOutput[,1:currCodesLength],rateOutput[,1:currCodesLength] == 0,"")
    
    for(j in 1:(length(currCodes)+1)) {
        rateOutput[,1:currCodesLength] <- replace(rateOutput[,1:currCodesLength],rateOutput[,1:currCodesLength] == j,currCodes[j])        
    }
    rateOutput
}