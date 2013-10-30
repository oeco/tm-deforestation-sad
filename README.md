## Deforestation from Imazon SAD

This is the TileMill project for the map of deforestation provided by Imazon SAD.

Imazon publishes monthly deforestation alerts at this page:

http://www.imazongeo.org.br/doc/downloads.php

This repository contains a script that regenerate all data needed for the map. 

### Requirements

* Tilemill
* Spatialite

```
    # linux install
    sudo apt-get install spatialite-bin
```

### How to update the map

Clone this repository locally:

    git clone https://github.com/oeco/tm-deforestation-sad.git

Create a symlink to TileMill project folder:

    ln -s /full/path/to/repository/tm-deforestation-sad ~/Documents/MapBox/project/tm-deforestation-sad

Run `./regenerate.sh` to generate map data.

### Layer configuration

When exporting the map from TileMill, you should use the following configs to show the map properly at Infoamazonia.org: 

* Name: Deforestation data from Imazon SAD
* Zoom level: 5 to 13
* Center: (-59.8755l,-6.5773,6)
* Map bounds: -74.6191, -17.8951, -45.835, 4.6531
