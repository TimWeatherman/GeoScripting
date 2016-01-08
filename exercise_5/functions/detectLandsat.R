# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

#finds the index of the raster layer
findlayername = function(rasterbrick, query){
	return(which(sapply(names(rasterbrick), function(x) any (grepl(query, x))))[[1]])
}

#returns a subset of the rasterbrick needed for NDVI caluclations
getCFmaskRedNIR = function(rasterbrick){
	result = brick()
	landsatversion = substr(names(rasterbrick)[[1]], 1, 3)
	if (landsatversion == "LT5") 
	{
		#search for CFmask
		searchresult = which(sapply(names(rasterbrick), function(x) any (grepl("cfmask", x))))[[1]]
		result = addLayer(result, rasterbrick[[searchresult]])
		searchresult = which(sapply(names(rasterbrick), function(x) any (grepl("band3", x))))[[1]]
		result = addLayer(result, rasterbrick[[searchresult]])
		searchresult = which(sapply(names(rasterbrick), function(x) any (grepl("band4", x))))[[1]]
		result = addLayer(result, rasterbrick[[searchresult]])
		names(result) = c("CFmask", "Red", "NIR")
		return(result)
	}
	if (landsatversion == "LC8") 
	{
		#search for CFmask
		searchresult = which(sapply(names(rasterbrick), function(x) any (grepl("cfmask", x))))[[1]]
		result = addLayer(result, rasterbrick[[searchresult]])
		searchresult = which(sapply(names(rasterbrick), function(x) any (grepl("band4", x))))[[1]]
		result = addLayer(result, rasterbrick[[searchresult]])
		searchresult = which(sapply(names(rasterbrick), function(x) any (grepl("band5", x))))[[1]]
		result = addLayer(result, rasterbrick[[searchresult]])
		names(result) = c("CFmask", "Red", "NIR")
		return(result)
	}
	else stop("error, input is not from landsat 5 or 8")
}
	
	