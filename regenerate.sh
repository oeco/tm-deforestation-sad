#!/bin/bash

# Download source files
wget -r -nd -A "imazon_sad_desmatamento*.zip" -P data/sources http://www.imazongeo.org.br/doc/downloads.php
wget -r -nd -P data/sources http://www.imazongeo.org.br/downloads/imazon_sad_desmatamento_2015-06_amazonia.zip 

# The shapefile for 2009/01 is broken, delete it
rm data/sources/imazon_sad_desmatamento_2009-01_amazonia.zip

# # Unzip shapefiles
unzip -jo data/sources/\*.zip -d data/sources-expanded

# # Delete old and create new database
rm data/alerts.sqlite
spatialite data/alerts.sqlite < sql/create.sql

# # Import 2007
spatialite_tool -i -shp data/sources-expanded/sad2007 -d data/alerts.sqlite -t temp -c UTF-8 -s 4326
spatialite data/alerts.sqlite < sql/parse-2007.sql

# # Import 2008-2013
for file in data/sources-expanded/imazon_sad_desmatamento_*.shp
do

	# Left just in case we need to filter by filename
	# if [[ $filename < "imazon_sad_desmatamento_2014-04_amazonia.shp" ]]; then
	# 	spatialite_tool -i -shp ${file%.*} -d data/alerts.sqlite -t temp -c UTF-8 -s 4326 -g Geometry
	# fi

	echo "Processing $file..."
	spatialite_tool -i -shp ${file%.*} -d data/alerts.sqlite -t temp -c UTF-8 -s 4326 -g Geometry
	spatialite data/alerts.sqlite < sql/parse-2008-2013.sql
done
