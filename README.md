# MRShops
Model Railway Shops - Map

This is a directory of known model train-related shops.

The structure is simple, geographically split in continents, countries and states.

To generate the map simply run the generate.sh script, which will put together the general context from 
*template_start.kml* and *template_end.kml* and will iterate through the subfolders looking for *.kml* files. 
It expects one shop entry per file.

Finally the script will zip the resulting KML file and the content of the images folder to create the KMZ 
(**ModelRailwayShops.kmz**), ready to be embedded in a Google Map.
