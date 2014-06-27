source("./rateMatrix.R")

ratePick <- function(fromCurr=NULL, toCurr=NULL) {
    
    if(!is.null(toCurr) && !is.null(fromCurr)) {
        ## to return a specific exchange rate
        ratematrix[fromCurr,toCurr]
    }
    else if (!is.null(fromCurr)) {
        ## to return a matrix row
        ratematrix[fromCurr,]
    }
    else {
        ratematrix[,toCurr]
    }
}

## Usage patterns
## 1. conversionValue(f, t, v) - when requesting exchange values with a start amt > 1
## 2. conversionValue(f) - when requesting vector for exchange values 
##                          for a base currency
## 3. conversionValue(,t) - when requesting vector for inverse exchange values 
##                          for a base currency
## 4. conversionValue(f,,c) - when requesting vector for exchange values and amt > 1
## 5. conversionValue(,t,c) - when requesting vector for inverse exchange values and amt > 1


conversionValue <- function(fromCurr=NULL, toCurr=NULL,convAmt=1) {
    convAmt * ratePick(fromCurr,toCurr)
}