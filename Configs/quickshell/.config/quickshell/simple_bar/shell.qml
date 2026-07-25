import Qt5Compat.GraphicalEffects
import QtQuick // for Text
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell // for PanelWindow
import Quickshell.Services.UPower
import Quickshell.Widgets

ShellRoot {
    id: root

    property Component shadowComp
    property Component iconImageComp
    property string assetsPath: "file:///home/sebastian/.config/quickshell/assets/"
    property string defaultFamily: "SF Mono"
    property int defaultLetterSpacing: -1
    property real defaultPixelSize: 14
    property int defaultWeight: 600
    property int defaultIconSize: 20

    SystemClock {
        id: clock

        precision: SystemClock.minutes
    }

    PanelWindow {
        implicitHeight: 38
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        margins {
            top: 7
            left: 7
            right: 7
        }

        Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: '#Fa595959'
            // color: '#A0111111'
            color: '#1f1f1f'
            radius: 12
            layer.enabled: true

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 14
                anchors.rightMargin: 14
                spacing: 14

                IconImage {
                    id: logo

                    width: 18
                    height: 18
                    source: assetsPath + "cachyos.svg"

                    ColorOverlay {
                        anchors.fill: logo
                        source: logo
                        color: "#ffffff"
                    }

                }

                // Spacer
                Item {
                    Layout.fillWidth: true
                }

                Battery {
                    iconWidth: 20
                    iconHeight: 20
                }

                NetworkIndecator {
                    iconWidth: 18
                    iconHeight: 18
                }

                DateTimeClock {
                }

            }

        }

    }

    shadowComp: DropShadow {
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8
        samples: 16
        color: "#000"
    }

}
