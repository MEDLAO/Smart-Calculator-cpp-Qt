import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Smart Calculator"

    property string expression: ""

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Rectangle {
            height: 60
            color: "#2c3e50"
            radius: 8
            Layout.fillWidth: true

            Text {
                id: displayText
                text: expression === "" ? "0" : expression
                anchors.centerIn: parent
                font.pixelSize: 28
                color: "white"
            }
        }

        GridLayout {
            columns: 4
            rowSpacing: 8
            columnSpacing: 8
            Layout.fillWidth: true

            // Digits and operators
            Repeater {
                model: ["7", "8", "9", "/",
                        "4", "5", "6", "*",
                        "1", "2", "3", "-",
                        "0", ".", "=", "+",
                        "C", "√", "%"]


                delegate: Button {
                    text: modelData
                    Layout.fillWidth: true
                    onClicked: {
                        if (text === "C") {
                            expression = ""
                        } else if (text === "=") {
                            expression = calculate(expression)
                        } else {
                            expression += text
                        }
                    }
                }
            }
        }
    }

    function calculate(expr) {
        // Only handle +, -, *, / safely
        try {
            return evalSafe(expr)
        } catch (e) {
            return "Error"
        }
    }

    function evalSafe(expr) {
        var clean = expr.replace(/[^0-9\+\-\*\/\.]/g, "")
        return String(Math.floor(Function("return " + clean)()))
    }
}
