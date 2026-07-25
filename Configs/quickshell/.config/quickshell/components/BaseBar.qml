import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell

PanelWindow {
    // Defult values
    property int border_width: 1
    property string border_color: root.color_border
    property string background: root.color_surface

    implicitHeight: 40
    color: "transparent"
    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 5
        left: 7
        right: 7
    }

    Rectangle {
        anchors.fill: parent
        radius: 18
        color: background
        border.width: parent.border_width
        border.color: parent.border_color
        layer.enabled: true
        layer.effect: DropShadow {
            horizontalOffset: 1
            verticalOffset: 1
            radius: 4
            samples: 17
            color: "#80000000"   // halbtransparentes Schwarz
        }
    }
}
