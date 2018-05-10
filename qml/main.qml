import QtQuick 2.7
import QtQuick.Window 2.2

import QtLocation 5.6
import QtPositioning 5.6


Window {
    width: 512
    height: 512
    visible: true

    Plugin {
        id: mapPlugin
        name: "mapboxgl" // "osm", "mapboxgl", "esri", ...
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14

        MapCircle {
            center: QtPositioning.coordinate(59.91, 10.75) // Oslo
            radius: 100.0
            color: 'black'
            opacity: 0.5
            border.width: 0.5
        }
    }
}
