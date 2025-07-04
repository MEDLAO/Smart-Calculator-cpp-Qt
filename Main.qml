import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Smart Calculator"

    property string expression: ""
    property bool showMathFunctions: false

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

        Button {
            text: showMathFunctions ? "Basic" : "Math"
            Layout.fillWidth: true
            onClicked: showMathFunctions = !showMathFunctions
        }

        Loader {
            sourceComponent: showMathFunctions ? mathButtons : basicButtons
        }
    }

    Component {
        id: basicButtons
        GridLayout {
            columns: 4
            rowSpacing: 8
            columnSpacing: 8
            Layout.fillWidth: true

            Repeater {
                model: ["7", "8", "9", "/",
                        "4", "5", "6", "*",
                        "1", "2", "3", "-",
                        "0", ".", "=", "+",
                        "C", "⌫", "(", ")"]

                delegate: Button {
                    text: modelData
                    Layout.fillWidth: true
                    onClicked: {
                        if (text === "C") {
                            expression = ""
                        } else if (text === "=") {
                            expression = calculator.calculate(expression)
                        } else if (text === "⌫") {
                            expression = expression.slice(0, -1)
                        } else if (text === ".") {
                            let parts = expression.split(/[\+\-\*\/\(\)]/);
                            let lastNumber = parts[parts.length - 1];
                            if (!lastNumber.includes(".")) {
                                expression += ".";
                            }
                        } else {
                            expression += text;
                        }
                    }
                }
            }
        }
    }

    Component {
        id: mathButtons
        GridLayout {
            columns: 3
            rowSpacing: 8
            columnSpacing: 8
            Layout.fillWidth: true

            Repeater {
                model: ["π", "sin(", "cos(", "tan(", "√", "%", "^", "C", "⌫"]

                delegate: Button {
                    text: modelData
                    Layout.fillWidth: true
                    onClicked: {
                        if (text === "π") {
                            if (!expression.endsWith("3.1415926535")){
                            expression += "3.1415926535"
                            }
                        } else if (text === "C") {
                            expression = ""
                        } else if (text === "⌫") {
                            expression = expression.slice(0, -1)
                        } else {
                            expression += text
                        }
                    }

                }

            }
        }
    }
}
