import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Input Element Demo")

    // Declare variables to store the input values
    property string firstNameInput: ""
    property string lastNameInput: ""

    function saveToFile(data, fileUrl) {
        var fileComponent = Qt.createQmlObject('import QtQuick.LocalStorage 2.0; Storage { }', main, 'fileComponent');
        fileComponent.write(fileUrl, data);
    }

    Item {
        width: parent.width
        height: parent.height

        Row {
            anchors.leftMargin: parent
            spacing: 10
            leftPadding: 50
            topPadding: 50
            Label {
                text: " First name"
                anchors.verticalCenter: parent.verticalCenter
                topPadding: 40
                anchors.leftMargin: 20
            }
            TextField {
                placeholderText: "Enter your First name"
                // Update the variable when the text changes
                onTextChanged: firstNameInput = text
            }
        }

        Row {
            anchors.leftMargin: parent
            spacing: 10
            leftPadding: 50
            topPadding: 100
            Label {
                text: "Last name"
                anchors.verticalCenter: parent.verticalCenter
                topPadding: 40
                anchors.leftMargin: 20
            }
            TextField {
                placeholderText: "Enter your Last name"
                // Update the variable when the text changes
                onTextChanged: lastNameInput = text
            }
        }

        Column {
            Button {
                leftPadding: 60
                text: "Click me"
                onClicked: {
                    // Log the input values when the button is clicked
                    console.log("First Name:", firstNameInput)
                    console.log("Last Name:", lastNameInput)

                    // Save data to a text file
                    var data = "First Name: " + firstNameInput + "\nLast Name: " + lastNameInput;
                    var fileUrl = "file:///C:/Users/PAPPU KUMAR KESHARI/OneDrive/Desktop/QtFile.txt"; // Replace with the actual file path

                    saveToFile(data, fileUrl);
                }
            }
        }
    }
}










