import QtQuick 2.10
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2
    visible: true
    width: 1024
    height: 768
    title: qsTr("Ubuntu Download Manager")

    function listInit(){

    }

    function addNewTask(){
        listmodel.append({"filename":"Testing", "creationTime":"2018-01-01 07:30:29", "colorCode":"blue"})
    }

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Open..." }
            MenuItem { text: "Close" }
        }

        Menu {
            title: "Edit"
            MenuItem { text: "Cut" }
            MenuItem { text: "Copy" }
            MenuItem { text: "Paste" }
        }
    }

    Menu {
        id: contextMenu
        MenuItem {
            text: qsTr('Delete')
        }
        MenuItem {
            text: qsTr('Remove from list')
        }
        MenuSeparator{}
        MenuItem {
            text: qsTr('Go to file directory')
        }
    }

    ToolBar {
        id: toolBar
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Row {
            id: row
            width: 200
            height: 400

            ToolButton {
                id: toolButton
                text: qsTr("New Task")
                onClicked: {
                    newTask.show()
                }

                NewTaskWindow{
                    id:newTask
                }
            }

            ToolSeparator {
                id: toolSeparator
            }

            ToolButton {
                id: toolButton1
                text: qsTr("Start")
            }

            ToolButton {
                id: toolButton2
                text: qsTr("Stop")
            }

            ToolButton {
                id: toolButton3
                text: qsTr("Remove")
            }

            ToolSeparator {}

            ToolButton {
                id: toolButton4
                text: qsTr("Download Directory")
            }
        }
    }

    Component {
        id: highlightBar
        Rectangle {
            width: parent.width
            height: 40
            color: "cyan"
            y: listView.currentItem.y;
        }
    }

    ListView {
        id: listView
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: toolBar.bottom
        anchors.topMargin: 0
        interactive: false
        focus: true
        highlight: highlightBar
        highlightFollowsCurrentItem: false

        model: ListModel {
            id: listmodel
            ListElement {
                filename: "Need For Speed 20: Payback.exe"
                creationTime: "2018-01-01 07:30:29"
                colorCode: "grey"
            }

            ListElement {
                filename: "Need For Speed 20: Payback.exe"
                creationTime: "2018-01-01 07:30:29"
                colorCode: "red"
            }

        }

        delegate: Item {
            width: parent.width
            height: 40
            Row {
                id: row1
                Rectangle {
                    id:rec
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: filename
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }

                ProgressBar{
                    anchors.verticalCenter: parent.verticalCenter
                    value: 0.4
                }

                spacing: 40

                Text {
                    text: creationTime
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }

            MouseArea{
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                anchors.fill: parent
                onClicked: {
                    if (mouse.button === Qt.LeftButton) {
                        listView.currentIndex = index
                    }else if (mouse.button === Qt.RightButton) {
                        contextMenu.popup()
                    }
                }
                onDoubleClicked: {
                    console.log("Double clicked")
                }
            }
        }
    }
}
