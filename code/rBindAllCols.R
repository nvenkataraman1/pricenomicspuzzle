rbind.all.columns <- function(x, y) {
    
    x.diff <- setdiff(colnames(x), colnames(y))
    y.diff <- setdiff(colnames(y), colnames(x))
    
    x[, c(as.character(y.diff))] <- 0
    
    y[, c(as.character(x.diff))] <- 0
    
    return(rbind(x, y))
}