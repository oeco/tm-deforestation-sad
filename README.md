## Fires from Imazon SAD

This is the TileMill project for the map of fires provided by Imazon SAD.

Imazon publishes monthly deforestation alerts at this page:

http://www.imazongeo.org.br/doc/downloads.php

### How to update the map

Clone this repository locally:

    git clone https://github.com/oeco/tm-deforestation-sad.git

Create a symlink to TileMill project folder:

    ln -s /full/path/to/repository/tm-deforestation-sad ~/Documents/MapBox/project

In the `tile/deforestation-sad/data` folder you'll find a file named `alerts.shp`, which has all Imazon SAD information to date.

If you need to update this file, follow the instructions:

1) Download the latest file and unzip it to `data` folder. You should have only two shapefiles at you data folder, `alerts.shp` and the new one from Imazon SAD;<br>
2) Open QGIS and select menu 'Vector' / 'Data Management Tools' / 'Merge Shapefile to One';<br>
3) Select the `data` folder as the input directory;<br>
4) Save the output shapefile as `alerts-new.shp` at `data` folder;<br>
5) Open this file in QGIS, and use the code bellow in the the field calculator to update `area_ha` field: <br>

```
    CASE 
        WHEN area_a> 0 THEN area_a
        ELSE toReal(toInt(AREA * 10000)) /100
    END
```

6) Finally, in QGIS, save `alerts-new.shp` as `alerts.shp`, overwriting the old file;<br>
7) Regenerate the map at TileMill;<br>
8) Upload it to Mapbox;<br>
9) Delete old files and commit changes to this repository.<br>

If you need to download all source files again, run these commands inside `tilemill\deforestion-sad\data` folder:

	wget -r -nd -A "imazon_sad_desmatamento*.zip" -P sources http://www.imazongeo.org.br/doc/downloads.php
	unzip -j sources/\*.zip -d sources-expanded -j

You'll find the shapefiles uncompressed in `tilemill\deforestion-sad\data\sources-expanded`.