# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

removeNDVIextremes <- function(input){
	input[input < 0]  <- NA
	input[input > 6]  <- NA
	return(input)
}