# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

ndvOver <- function(x, y) 
{
	ndvi <- (y - x) / (x + y)
	return(ndvi)
}

calculateNDVI = function(x)
{
	return(overlay(x= x[["Red"]], y=x[["NIR"]], fun=ndvOver))
}