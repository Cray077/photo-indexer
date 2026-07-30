import QtQuick
import QtQuick.Controls

Column {
    spacing: 18

    Label {
        text: "Recent Photos"
        font.pixelSize: 24
        font.bold: true
    }

    GridView {
        width: parent.width
        height: 600

        cellWidth: 220
        cellHeight: 200

        model: searchEngine.searchPictures("pictures")

        delegate: Rectangle {
            width: 190
            height: 180

            radius: 12
            color: "#FFFFFF"
            border.color: "#DDDDDD"

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 8

                Image { // put image here
                    source: modelData
                    width: parent.width
                    height: 120
                    fillMode: Image.PreserveAspectCrop
                    sourceSize.width: width
                    sourceSize.height: height
                    asynchronous: true
                    cache: true
                }

                Label {
                    text: "IMG_" + (index + 1)
                    font.bold: true
                }

                Label {
                    text: "May 19, 2025"
                    color: "#888888"
                    font.pixelSize: 12
                }
            }
        }
    }
}
