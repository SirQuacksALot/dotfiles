import Qt5Compat.GraphicalEffects
import QtQuick // for Text
import QtQuick.Layouts
import Quickshell // for PanelWindow
import Quickshell.Services.UPower
import Quickshell.Widgets

RowLayout {
    // Disabled for now as this will be an optinal setting in the future
    /*
    Text {
        text: batteryPertentage + "%"
        color: "#fff"
        layer.enabled: true
        layer.effect: shadowComp

        font {
            family: root.defaultFamily
            letterSpacing: root.defaultLetterSpacing
            pixelSize: root.defaultPixelSize
            weight: root.defaultWeight
        }

      }*/

    property int iconWidth: 20
    property int iconHeight: 20
    property string assetsPath: "file:///home/sebastian/.config/quickshell/assets/"
    property int batteryPertentage: Math.round(UPower.displayDevice.percentage * 100)
    property Component shadowComp

    // battery Status icon name mapping
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
        width: iconWidth
        height: iconHeight
        source: assetsPath + batteryIconName()
        layer.enabled: true
        layer.effect: shadowComp
    }

    shadowComp: DropShadow {
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 16
        color: "#000"
    }

}
