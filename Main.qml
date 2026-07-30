import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "pages"

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
            id: mainScroll
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentWidth: availableWidth

            Column {
                width: mainScroll.availableWidth
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
