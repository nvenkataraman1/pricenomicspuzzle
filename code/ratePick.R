source("./rateMatrix.R")

ratePick <- function(fromCurr="USD", toCurr=NULL) {
    
    print(fromCurr)
    print(toCurr)
    print(ratematrix[fromCurr,toCurr])
    
    if(!is.null(toCurr)) {
        ## to return a specific exchange rate
        ratematrix[fromCurr,toCurr]
    }
    else {
        ## to return a matrix row
        ratematrix[fromCurr,]
    }
}

conversionValue <- function(fromCurr="USD", toCurr=NULL,convValue=1) {
    a <- convValue * ratePick(fromCurr,toCurr)
    print(a)
    a
}