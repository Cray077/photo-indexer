import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    color: "#FFFFFF"
    border.color: "#E0E0E0"

    Column {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 16

        Label {
            text: "Photo Indexer"
            font.pixelSize: 24
            font.bold: true
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#EEEEEE"
        }

        Button {
            text: "Category"
            width: parent.width
            height: 48
        }

        Button {
            text: "Settings"
            width: parent.width
            height: 48
        }

        Item {
            width: 1
            height: 1
            Layout.fillHeight: true
        }

        Button {
            text: "About"
            width: parent.width
            height: 48
        }
    }
}
