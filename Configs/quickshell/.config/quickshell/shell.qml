import QtQuick
import QtQuick.Layouts
import Quickshell
import "components"
import "widgets"

ShellRoot {
    id: root
    /* Style and general settings root object
     *
     * Here all theme settings for styling will be set and populated from here.
     */

     // Base
     property color color_primary: "#1e1e1e"
     property color color_secondary: "#161616"

     // Accent
     property color color_accent: "#ca9ee6"
     property color color_accent_soft: "#f4b8e4"

     // Background / Surface / Text
     property color color_background: "#161616"
     property color color_surface: "#2b2b2b"
     property color color_text: "#f5f5f5"
     property color color_text_muted: "#c6c6c6"

     // States
     property color color_success: "#a6d189"
     property color color_warning: "#e5c890"
     property color color_error: "#e78284"
     property color color_info: "#434a4c"

     //Borders / Outlines
     property color color_border: "#2b2b2b"
     property color color_outline: "#555555"

     /* Base bar conifgurations
      *
      */

     property string assetsPath: "file:///home/sebastian/.config/quickshell/assets/"

     BaseBar {
         background: color_background
         RowLayout {
             anchors.fill: parent
             anchors.leftMargin: 5
             anchors.rightMargin: 5

             Spacer{}
             RowLayout {
                 spacing: 5
                 BatteryWidget {}
                 WifiWidget {}
                 ClockWidget {format: "hh:mm"}
             }
             //Spacer{}
         }
     }
}
