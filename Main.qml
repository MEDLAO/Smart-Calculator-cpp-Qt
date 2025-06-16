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
            height: 60
            color: "#2c3e50"
            radius: 8
            Layout.fillWidth: true

            Text {
                id: displayText
                text: "0"
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
            }
        }

        // Number buttons 1–9 + 0
        GridLayout {
            id: numberGrid
            columns: 3
            rowSpacing: 8
            columnSpacing: 8
            Layout.fillWidth: true

            Button {
                text: "1"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
            Button {
                text: "2"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
            Button {
                text: "3"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }

            Button {
                text: "4"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
            Button {
                text: "5"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
            Button {
                text: "6"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }

            Button {
                text: "7"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
            Button {
                text: "8"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
            Button {
                text: "9"
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }

            Button {
                text: "0"
                Layout.columnSpan: 3
                Layout.fillWidth: true
                onClicked: {
                    displayText.text = displayText.text === "0" ? text : displayText.text + text
                }
            }
        }
    }
}
