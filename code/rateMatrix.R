require(httr)
require(jsonlite)
require(reshape2)

## Fetch rate data from priceonomics website in JSON format
## Read into dataframe
fxdata <- as.data.frame(fromJSON("http://fx.priceonomics.com/v1/rates/"))

#print(fxdata)


## Separate currency labels
fromcurr <- substr(names(fxdata),1,3)
tocurr <- substr(names(fxdata),5,7)

## Transposing fxdata to fetch rates
tfxdata <- t(fxdata)

## Fetching rates from transposed matrix in from-to currency format
#rates <- as.numeric(t(fxdata)[1:dim(tfxdata)[1],1])

rates <- as.numeric(tfxdata[,1])

## Combining currency and rates into a dataframe
rateframe <- data.frame(fromcurr,tocurr,rates)

## Reshaping currency data into matrix form for operations
mfxdata <- melt(rateframe,id.vars=c("fromcurr","tocurr"))
ratematrix <- acast(mfxdata,fromcurr ~ tocurr)
currCodes <- colnames(ratematrix)
#print(currCodes)