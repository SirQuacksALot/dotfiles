import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Quickshell.Services.UPower
import Quickshell.Widgets
import "../components"

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

            function batteryIconName() {
                if (UPower.displayDevice.state === UPowerDeviceState.Charging)
                    return "battery-charging.svg";
                else if (UPower.displayDevice.state === UPowerDeviceState.FullyCharged)
                    return "battery-full.svg";
                else if (batteryPertentage < 74)
                    return "battery-medium.svg";
                else if (batteryPertentage < 49)
                    return "battery-low.svg";
                else if (batteryPertentage < 24)
                    return "battery.svg";
                else if (batteryPertentage < 9)
                    return "battery-warning.svg";
                return "battery-full.svg";
            }

            spacing: 6

            IconImage {
                width: 18
                height: 18
                source: root.assetsPath + parent.batteryIconName()
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
}
