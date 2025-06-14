import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Smart Calculator"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // Display area
        Rectangle {
            id: displayArea
            width: parent.width
            height: 60
            color: "#2c3e50"
            radius: 8

            Text {
                id: displayText
                text: "0"
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
            }
        }
    }
}

