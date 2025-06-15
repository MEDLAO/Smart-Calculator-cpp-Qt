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

        Grid {
            id: numberGrid
            columns: 3
            spacing: 8

            // Row 1
            Button { text: "1"; width: 80; height: 40 }
            Button { text: "2"; width: 80; height: 40 }
            Button { text: "3"; width: 80; height: 40 }

            // Row 2
            Button { text: "4"; width: 80; height: 40 }
            Button { text: "5"; width: 80; height: 40 }
            Button { text: "6"; width: 80; height: 40 }

            // Row 3
            Button { text: "7"; width: 80; height: 40 }
            Button { text: "8"; width: 80; height: 40 }
            Button { text: "9"; width: 80; height: 40 }

            // Row 4
            Button {
                text: "0"
                width: 248   // 80 * 3 + spacing * 2
                height: 40
            }
        }


    }
}

