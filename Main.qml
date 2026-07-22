import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

ApplicationWindow {
    visible: true
    width: 1280
    height: 800
    title: "Photo Indexer"

    color: "#F5F5F5"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ==========================
        // Left Navigation
        // ==========================
        LeftNavigation {
            Layout.preferredWidth: 220
            Layout.fillHeight: true
        }

        // ==========================
        // Main Content
        // ==========================
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Column {
                width: parent.width
                spacing: 28
                padding: 30

                SearchBar {
                    width: parent.width - 60
                }

                CategorySection {
                    width: parent.width - 60
                }

                RecentPhotosSection {
                    width: parent.width - 60
                }
            }
        }
    }
}
