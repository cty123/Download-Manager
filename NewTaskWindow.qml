import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

ApplicationWindow {
    id: taskwindow
    width: 500
    height: 300
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    Rectangle{
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        RowLayout {
            id: row3
            width: 500
            spacing: 10

            Text {
                id: text3
                text: qsTr("Url          ")
                font.pixelSize: 14
            }

            TextField {
                id: textEdit2
                Layout.fillWidth: true
                font.pixelSize: 14
            }

            Layout.fillWidth: true
        }

        RowLayout {
            id: row4
            width: 500
            Text {
                id: text4
                text: qsTr("Filename")
                font.pixelSize: 14
            }

            TextField {
                id: textEdit3
                Layout.fillWidth: true
                font.pixelSize: 14
            }
            Layout.fillWidth: true
            spacing: 10
        }

        RowLayout {
            id: row5
            width: 500
            spacing: 10
            Text {
                id: text5
                text: qsTr("Directory")
                font.pixelSize: 14
            }

            TextField {
                id: textEdit4
                Layout.fillWidth: true
                font.pixelSize: 14
            }
            Layout.fillWidth: true
        }

        RowLayout {
            id: row6
            width: 500
            spacing: 50
            Layout.fillWidth: true

            Button {
                id: btn_open
                text: qsTr("Open")
                onClicked: {
                    taskwindow.close()
                    addNewTask()
                }
            }

            Button {
                id: btn_save
                text: qsTr("Save")
            }

            Button {
                id: btn_cancel
                text: qsTr("Cancel")
            }
        }


    }
    }
}

