# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

ndvOver <- function(x, y) {
	ndvi <- (y - x) / (x + y)
	return(ndvi)
}

calculateNDVI = function(x, LandsatNum){
	if (LandsatNum == 5)
	return(overlay(x= x[[6]], y=x[[7]], fun=ndvOver))#band 3 red and band 4 NIR
	else if (LandsatNum == 8) 
	return(overlay(x= x[[5]], y=x[[6]], fun=ndvOver))#band 4 red and band 5 NIR
}