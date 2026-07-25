import Qt5Compat.GraphicalEffects
import QtQuick // for Text
import QtQuick.Layouts
import Quickshell // for PanelWindow
import Quickshell.Services.UPower
import Quickshell.Widgets
import "../components"

RowLayout {
    property int iconWidth: 20
    property int iconHeight: 20
    property string assetsPath: "file:///home/sebastian/.config/quickshell/assets/"
    property Component shadowComp
    property var wifiIcons: ["wifi-zero.svg", "wifi-low.svg", "wifi-high.svg", "wifi.svg"]
    readonly property string iconName: {
        const state = NetStatus.connectionState;
        if (state === "wired")
            return "ethernet-port.svg";

        if (state === "none")
            return "wifi-off.svg";

        const level = NetStatus.signalLevel;
        if (level < 0 || level >= wifiIcons.length)
            return "wifi.svg";

        return wifiIcons[level];
    }

    spacing: 6

    IconImage {
        width: iconWidth
        height: iconHeight
        source: assetsPath + parent.iconName
        layer.enabled: true
        layer.effect: shadowComp
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

    shadowComp: DropShadow {
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 16
        color: "#000"
    }

}
