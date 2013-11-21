import QtQuick 1.1
import Qt.labs.folderlistmodel 1.0

Rectangle {
    id: filePicker
    color: "lightgrey"
    signal selected(string fileName)

    Component {
        id: filePickerDelegate

        Item {
            height: 75
            width: folderListView.width

            Rectangle {
                width: 4
                height: parent.height
                color: "#2d2875"
                visible: index % 2
            }

            Image {
                id: folderIcon

                anchors { left: parent.left; verticalCenter: parent.verticalCenter }
                source: "images/folder.svg"
                visible: folderListModel.isFolder(index)
            }

            Text {
                anchors {
                    left: folderIcon.right
                    right: parent.right
                    leftMargin: 5
                    verticalCenter: parent.verticalCenter
                }
                elide: Text.ElideRight
                font.pixelSize: 22
                font.letterSpacing: -1
                //color: "white"
                text: fileName
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (folderListModel.isFolder(index)) {
                        if (fileName == "..")
                            folderListModel.folder = folderListModel.parentFolder
                        else
                            folderListModel.folder += "/" + fileName
                    } else {
                        var file = folderListModel.folder + "/" + fileName
                        file = file.substr(8)
                        filePicker.selected(file)
                        //mainPage.setPhoto(file)
                        //pageStack.pop()
                    }
                }
            }
        }
    }

    //![0]
    FolderListModel {
        id: folderListModel

        nameFilters: ["*.jpg"]
        showDotAndDotDot: true
        showOnlyReadable: true
        sortField: FolderListModel.Type
        folder: "file:///c:/users/Hiking/youji/"
    }
    //![0]

    ListView {
        id: folderListView

        anchors.fill: parent
        model: folderListModel
        delegate: filePickerDelegate
        cacheBuffer: height
        clip: true

//        ScrollDecorator {
//            flickableItem: parent
//        }
    }
}
