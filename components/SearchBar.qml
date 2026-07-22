import QtQuick
import QtQuick.Controls

Rectangle {
    height: 54
    radius: 27

    color: "#FFFFFF"
    border.color: "#DADADA"

    TextField {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        placeholderText: "Search photos..."
        background: Item {}
    }
}
