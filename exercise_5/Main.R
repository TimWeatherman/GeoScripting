# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0

#open gdal and raster packages
library(rgdal)
library(raster)

#getting the functions
source("functions/ndvover.R")
source("functions/cloud2NA.R")
source("functions/removeNDVIextremes.R")
source("functions/detectLandsat.R")

#check working directory
getwd()

plotNDVIdifference = function(linkformer, linklatter)
{
		
	#download the files
	#1990-04-08 (acquisition_date)
	download.file(url = linkformer, destfile = 'files/former.tar.gz', method = 'wget')
	#2014-04-19 (acquisition_date)
	download.file(url = linklatter, destfile = 'files/latter.tar.gz', method = 'wget')
	
	
	#untar the files
	untar("files/former.tar.gz", exdir = "files")
	untar("files/latter.tar.gz", exdir = "files")
	
	#put all the bands in a list
	listformer = list.files('files', pattern = glob2rx('LT*.tif'), full.names = TRUE)
	listlatter = list.files('files', pattern = glob2rx('LC*.tif'), full.names = TRUE)
	
	#Combine all rasters in a rasterbrick
	rasterformer = lapply(listformer, raster)
	rasterlatter = lapply(listlatter, raster)
	
	brickformer = brick(rasterformer)
	bricklatter = brick(rasterlatter)
	
	brickformer = getCFmaskRedNIR(brickformer)
	bricklatter = getCFmaskRedNIR(bricklatter)
	
	#substract the 2 NDVI images.
	#landsat 5
	#landsat 8
	
	NDVIformer = calculateNDVI(brickformer)
	NDVIlatter = calculateNDVI(bricklatter)
	
	#remove the clouds from the images 
	#band 1 (2 & 4) for landsat 5
	#band 1 (2 & 4) for landsat 8
	#overwritten NDVIformer and NDVIlatter to save memory space
	
	NDVIformer = cloud2NA(NDVIformer, brickformer[[1]])
	NDVIlatter = cloud2NA(NDVIlatter, bricklatter[[1]])
	
	#removed the extremes to get a clear image. A couple of pixels with unlikely high/low values.
	NDVIformer = removeNDVIextremes(NDVIformer)
	NDVIlatter = removeNDVIextremes(NDVIlatter)
	
	#Give both input files the same extent
	
	cropformer = crop(NDVIformer, NDVIlatter)
	croplatter = crop(NDVIlatter, NDVIformer)
	
	cropstack = stack(list(cropformer, croplatter))
	result = (cropstack[[2]] - cropstack[[1]])
	
	#plot result
	plot(result)
	print("The positive NDVI values show a growth in vegetation and the negative NDVI numbers show a decrease in vegetation")
	
	#done
	print("Good job!")
	return(result)
}

plotNDVIdifference('https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz', 
									 'https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz')