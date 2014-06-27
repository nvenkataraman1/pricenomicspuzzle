source("./rBindAllCols.R")
require(gtools)

arbitragePermCombos <- function(currCodes) {
    selectionLength <- length(currCodes)
    
    temp_df <- data.frame(matrix(0,nrow=1,ncol=selectionLength))
    
    for(i in 2:selectionLength) {
        temp_df <- rbind.all.columns(a,data.frame(permutations(n=selectionLength,r=i)))
    }
       
    temp_df
}