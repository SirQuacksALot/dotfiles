import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell

Item {
    property string format: "ddd, dd. MMMM  hh:mm"
    property string border_color: root.color_border
    property string background: root.color_surface
    property int borderWidth: 1
    property int padding: 5
    property int radius: 14

    implicitHeight: box.height
    implicitWidth: box.width

    SystemClock {
        id: clock

        precision: SystemClock.minutes
    }

    Rectangle {
        id: box
        radius: parent.radius
        color: parent.background
        border.width: parent.borderWidth
        border.color: parent.border_color

        width:  Math.ceil(child.implicitWidth)  + parent.padding * 2
        height: Math.ceil(child.implicitHeight) + parent.padding * 2

        Text {
            id: child

            x: Math.round((parent.width  - width)  / 2)
            y: Math.round((parent.height - height) / 2)

            color: root.color_text
            text: Qt.formatDateTime(clock.date, parent.parent.format)
            font {
                family: "SF Mono"
                letterSpacing: -1
                pixelSize: 14
                weight: 600
            }
            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 1
                verticalOffset: 1
                radius: 8
                samples: 16
                color: "#000"
            }
        }
    }
}
