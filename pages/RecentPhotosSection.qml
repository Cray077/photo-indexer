import QtQuick
import QtQuick.Controls

pragma ComponentBehavior: Bound
Column {
    spacing: 18

    Label {
        text: "Recent Photos"
        font.pixelSize: 24
        font.bold: true
    }

    PhotoPopUp{
        id: photoPopUp
    }

    GridView {
        width: parent.width
        height: 600

        cellWidth: 220
        cellHeight: 200

        model: searchEngine.getPictures()

        delegate: Rectangle {
            required property var modelData
            id: photoDelegate
            width: 190
            height: 180

            radius: 12
            color: "#FFFFFF"
            border.color: "#DDDDDD"

            MouseArea {
                width: parent.width
                height: parent.height

                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    photoPopUp.imagePath = photoDelegate.modelData.filePath
                    photoPopUp.open()
                }
                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 8

                    Image { // put image here
                        source: photoDelegate.modelData.filePath
                        width: parent.width
                        height: 120
                        fillMode: Image.PreserveAspectCrop
                        sourceSize.width: width
                        sourceSize.height: height
                        asynchronous: true
                        cache: true
                    }

                    Label {
                        width: parent.width
                        text: photoDelegate.modelData.fileName
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        elide: Text.ElideRight
                        wrapMode: Text.NoWrap
                    }

                    Label {
                        width: parent.width
                        text: photoDelegate.modelData.birthDate
                        color: "#888888"
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        elide: Text.ElideRight
                        wrapMode: Text.NoWrap
                    }
                }
            }
        }
    }
}
