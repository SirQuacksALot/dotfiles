import Qt5Compat.GraphicalEffects
import QtQuick // for Text
import QtQuick.Layouts
import Quickshell // for PanelWindow
import Quickshell.Services.UPower
import Quickshell.Widgets

RowLayout {
    property Component shadowComp

    Text {
        text: Qt.formatDateTime(clock.date, "ddd, dd. MMMM  hh:mm")
        color: "#fff"
        layer.enabled: true
        layer.effect: shadowComp
        font.family: root.defaultFamily
        font.letterSpacing: root.defaultLetterSpacing
        font.pixelSize: root.defaultPixelSize
        font.weight: root.defaultWeight
    }

    shadowComp: DropShadow {
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 16
        color: "#000"
    }

}
