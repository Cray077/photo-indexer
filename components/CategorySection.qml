import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    spacing: 18

    Label {
        text: "Categories"
        font.pixelSize: 24
        font.bold: true
    }

    GridLayout {
        width: parent.width

        columns: 4
        rowSpacing: 18
        columnSpacing: 18

        Repeater {
            model: ["Nature", "People", "Buildings", "Vehicles", "Animals", "Documents", "Screenshots", "Others"]

            delegate: Rectangle {
                Layout.preferredWidth: 180
                Layout.preferredHeight: 110

                radius: 12
                color: "#FFFFFF"
                border.color: "#DDDDDD"

                Column {
                    anchors.centerIn: parent
                    spacing: 8

                    Label {
                        text: modelData
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Label {
                        text: "124 Photos"
                        color: "#888888"
                        font.pixelSize: 13
                    }
                }
            }
        }
    }
}
