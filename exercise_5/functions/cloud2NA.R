# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

cloud2NA <- function(x, y){
	x[y != 0] <- NA
	return(x)
}
