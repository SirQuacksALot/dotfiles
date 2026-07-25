import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Quickshell.Widgets
import "../components"

// NOTE: Diese Item als component standartisieren (BaseWidget)
Item {
    property string border_color: root.color_border
    property string background: root.color_surface
    property int borderWidth: 1
    property int padding: 5
    property int radius: 12
    property var wifiIcons: ["wifi-zero.svg", "wifi-low.svg", "wifi-high.svg", "wifi.svg"]

    implicitHeight: box.height
    implicitWidth: box.width

    Rectangle {
        id: box
        radius: parent.radius
        color: parent.background
        border.width: parent.borderWidth
        border.color: parent.border_color

        width:  Math.ceil(child.implicitWidth)  + parent.padding * 2
        height: Math.ceil(child.implicitHeight) + parent.padding * 2

        RowLayout {
            id: child

            x: Math.round((parent.width  - width)  / 2)
            y: Math.round((parent.height - height) / 2)

            readonly property string iconName: {
                const state = NetStatus.connectionState;
                if (state === "wired")
                    return "ethernet-port.svg";

                if (state === "none")
                    return "wifi-off.svg";

                const level = NetStatus.signalLevel;
                if (level < 0 || level >= parent.parent.wifiIcons.length)
                    return "wifi.svg";

                return parent.parent.wifiIcons[level];
            }

            spacing: 6

            IconImage {
                width: 18
                height: 18
                source: root.assetsPath + parent.iconName
                layer.enabled: true
                layer.effect: DropShadow {
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 8
                    samples: 16
                    color: "#000"
                }
                onStatusChanged: {
                    if (status === Image.Error)
                        console.warn("Icon fehlt:", source);

                }
            }

            /*
            Text {
                text: NetStatus.ssid
                color: "#fff"
                }
            */

        }
    }
}
