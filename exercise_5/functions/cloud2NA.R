# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

cloud2NA <- function(input, CFmask){
	input[CFmask == 2]  <- NA
	input[CFmask == 4]  <- NA
	return(input)
}
