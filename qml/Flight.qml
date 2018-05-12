import QtQuick 2.7

import QtLocation 5.6


FocusScope {
    anchors.fill: parent

    signal flightRequested
    signal waypointAdded(variant point)

    property int waypointIndex: 0
    property alias pointsModel: uavRouteModel


    RouteModel {
        id: uavRouteModel
        autoUpdate: true
    }

    Timer {
        id: flightTimer
        interval: 1000
        repeat: true
        onTriggered: {
            if (waypointIndex < waypointLine.path.length) {
                uav.center = waypointLine.path[waypointIndex]
                ++waypointIndex
            } else {
                flightTimer.stop()
                return
            }
        }
    }

    onWaypointAdded: {
        waypointLine = Qt.createQmlObject('import QtLocation 5.3;\
                                           MapPolyline {line.width: 3; line.color: "blue"}', map)
        waypointLine.path = uavRouteModel.query.waypoints
        map.addMapItem(waypointLine)
    }

    onFlightRequested: flightTimer.start()
}
