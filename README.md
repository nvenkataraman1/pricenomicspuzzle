Solution for the Currency Arbitrage puzzle
=================

Problem Statement: Given an N-currency set, find all currency transfer combinations that result in a profit.

Sample Rate Matrix (custom prepared thru this program)

![](https://github.com/nvenkataraman1/pricenomicspuzzle/blob/master/ratematrix.png "rate matrix")

Link: http://priceonomics.com/jobs/puzzle/

1. Run the code in arbitrageCalc.R by sourcing it

2. Output is a filtered list with currency sequences and corresponding arbitrage values for a N-currency pair set
 
3. Output Format
C1 : CN | ValueGain | PercentGain

where

    * C1 : CN is the currency flow sequence
    * ValueGain is the arbitrage value gain in base currency
    * PercentGain is the percentage gain in arbitrage

Sample Run

![](https://github.com/nvenkataraman1/pricenomicspuzzle/blob/master/sample%20run.png "Sample run")
