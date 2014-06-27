source("./rBindAllCols.R")
require(gtools)

arbitragePermCombos <- function(currCodes) {
    selectionLength <- length(currCodes)
    
    a <- data.frame(matrix(0,nrow=1,ncol=selectionLength))
    
    for(i in 2:selectionLength) {
        a <- rbind.all.columns(a,data.frame(permutations(n=selectionLength,r=i)))
    }
       a
}