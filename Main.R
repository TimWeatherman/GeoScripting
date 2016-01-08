# Tim Weerman
# January 2016
# Apache license 2.0


#open gdal and raster packages
library(rgdal)
library(raster)

#check working directory
getwd()

#download the files
#2014-04-19 (acquisition_date)
download.file(url = 'https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz', destfile = '2014.tar.gz', method = 'wget')
#1990-04-08 (acquisition_date)
download.file(url = 'https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz', destfile = '1990.tar.gz', method = 'wget')

#untar the files
untar("1990.tar.gz")
untar("2014.tar.gz")


#put all the bands in a list
list.files()


#give both files the same extent: x and y values


#remove the clouds from the images


#substract the 2 NDVI images. Note that the landsat 8 has different band number than the landsat 5 ones


#good job!