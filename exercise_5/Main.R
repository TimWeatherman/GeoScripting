# Team Rython - Dainius Masiliunas - Tim Weerman
# 8 January 2016
# Apache license 2.0


#open gdal and raster packages
library(rgdal)
library(raster)
source("functions/ndvover.R")

#check working directory
getwd()

#download the files
#2014-04-19 (acquisition_date)
download.file(url = 'https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz', destfile = 'files/2014.tar.gz', method = 'wget')
#1990-04-08 (acquisition_date)
download.file(url = 'https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz', destfile = 'files/1990.tar.gz', method = 'wget')

#untar the files
untar("files/1990.tar.gz", exdir = "files")
untar("files/2014.tar.gz", exdir = "files")

#put all the bands in a list
list1990 = list.files('files', pattern = glob2rx('LT*.tif'), full.names = TRUE)
list2014 = list.files('files', pattern = glob2rx('LC*.tif'), full.names = TRUE)

#give both files the same extent: x and y values
raster1990 = lapply(list1990, raster)
raster2014 = lapply(list2014, raster)

brick1990 = brick(raster1990)
brick2014 = brick(raster2014)

#substract the 2 NDVI images. Note that the landsat 8 has different band number than the landsat 5 ones
#landsat 5, bands 6 & 7. 6 is red and 7 is NIR.
#landsat 8, bands 

NDVI1990 = calculateNDVI5(brick1990)


#remove the clouds from the images 
#band 1 (2 & 4) for landsat 5
#band 1 (2 & 4) for landsat 8





#good job!

