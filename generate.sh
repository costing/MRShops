#!/bin/bash

(
    cat template_start.kml

    find . -mindepth 2 -name \*.kml | sort | cut -c 3- | while read placefile; do
	folder=`dirname $placefile`
	if [ "$folder" != "$PREVFOLDER" ]; then
	    if [ ! -z "$PREVFOLDER" ]; then
		echo "</Folder>"
	    fi

	    echo "<Folder>"
	    echo "<name>"
	    echo "$folder" | awk -F/ '{for (i=2; i<=NF; i++) {printf("%s", $i); if (i<NF) printf("%s", ", ");}}'
	    echo "</name>"
	fi
	echo "<Placemark>"
        echo "<styleUrl>#icon-1716-A52714</styleUrl>"
	cat "$placefile"
	echo "</Placemark>"
	PREVFOLDER="$folder"
    done

    cat template_end.kml
) > ModelRailwayShops.kml

zip ModelRailwayShops.kmz ModelRailwayShops.kml images/*
