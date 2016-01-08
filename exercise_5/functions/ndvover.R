# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

ndvOver <- function(x, y) {
	ndvi <- (y - x) / (x + y)
	return(ndvi)
}

calculateNDVI5 = function(x, LandsatNum){
	if (LandsatNum == 5)
	return(overlay(x= x[[6]], y=x[[7]], fun=ndvOver))#redo the numbers
	else if (LandsatNum == 8) 
	return(overlay(x= x[[4]], y=x[[5]], fun=ndvOver))#redo the numbers
}