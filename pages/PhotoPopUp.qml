import QtQuick
import QtQuick.Controls



Popup {
    id: photoPopUp
    property string imagePath: ""
    modal: true
    dim: true

    anchors.centerIn: Overlay.overlay
    width: 500
    height: 350

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    background: Rectangle {
            color: "white"
            radius: 12
        }

    contentItem: Column {
            spacing: 16
            padding: 20

            Label{
                text: "PhotoDetails"
                font.pixelSize: 12
            }

            Image { // put image here
                source: photoPopUp.imagePath
                width: parent.width
                height: 120
                fillMode: Image.PreserveAspectCrop
                sourceSize.width: width
                sourceSize.height: height
                asynchronous: true
                cache: true
            }

            Label{
                text: "this label is centered"
            }

            Button{
                text: "Closed"
                onClicked: photoPopUp.close()
            }
    }
}