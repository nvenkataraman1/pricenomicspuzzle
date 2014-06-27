source("./rateMatrix.R")

ratePick <- function(fromCurr=0, toCurr=0) {
    
    if(fromCurr==0 || toCurr==0) {
        1
    }
    else {
        ratematrix[fromCurr,toCurr]
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


conversionValue <- function(fromCurr=0, toCurr=0,convAmt=1) {
    #print(fromCurr)
    #print(toCurr)
    convAmt * ratePick(fromCurr,toCurr)
}