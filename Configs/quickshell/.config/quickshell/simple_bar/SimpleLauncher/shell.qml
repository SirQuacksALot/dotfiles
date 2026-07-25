import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets

ShellRoot {
    PanelWindow {
        id: root

        // Vollflächiges, transparentes Overlay, das die Tastatur greift
        anchors { top: true; bottom: true; left: true; right: true }
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

        property string query: ""

        function launchSelected() {
            if (list.currentItem && list.currentItem.modelData) {
                list.currentItem.modelData.execute()
                Qt.quit()
            }
        }

        // Klick außerhalb schließt den Launcher
        MouseArea { anchors.fill: parent; onClicked: Qt.quit() }

        Rectangle {
            anchors.centerIn: parent
            width: 560
            height: 400
            radius: 12
            color: "#1e1e2e"
            border.color: "#45475a"
            border.width: 1

            // Klicks hier "schlucken", damit der Launcher nicht zugeht
            MouseArea { anchors.fill: parent }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                TextField {
                    id: input
                    Layout.fillWidth: true
                    placeholderText: "Suchen…"
                    font.pixelSize: 18
                    color: "white"
                    focus: true
                    padding: 12
                    background: Rectangle { color: "#313244"; radius: 8 }

                    onTextChanged: {
                        root.query = text.toLowerCase().trim()
                        list.currentIndex = filtered.values.length > 0 ? 0 : -1
                    }

                    Keys.onEscapePressed: Qt.quit()
                    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Up) {
                            event.accepted = true
                            if (list.currentIndex > 0) list.currentIndex--
                        } else if (event.key === Qt.Key_Down) {
                            event.accepted = true
                            if (list.currentIndex < list.count - 1) list.currentIndex++
                        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            event.accepted = true
                            root.launchSelected()
                        }
                    }
                }

                // Gefilterte + alphabetisch sortierte Liste
                ScriptModel {
                    id: filtered
                    values: {
                        const all = [...DesktopEntries.applications.values]
                            .filter(d => d.name)
                            .sort((a, b) => a.name.localeCompare(b.name))
                        if (root.query === "") return all
                        return all.filter(d => d.name.toLowerCase().includes(root.query))
                    }
                }

                ListView {
                    id: list
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    model: filtered.values
                    currentIndex: 0
                    keyNavigationWraps: true
                    highlight: Rectangle { color: "#585b70"; radius: 6 }
                    highlightMoveDuration: 80

                    delegate: Item {
                        required property var modelData
                        required property int index
                        width: ListView.view.width
                        height: 44

                        MouseArea {
                            anchors.fill: parent
                            onClicked: list.currentIndex = index
                            onDoubleClicked: root.launchSelected()
                        }

                        Row {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 10

                            IconImage {
                                source: Quickshell.iconPath(modelData.icon, true)
                                width: 28; height: 28
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: modelData.name
                                color: "white"
                                font.pixelSize: 15
                                elide: Text.ElideRight
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
        }
    }
}
