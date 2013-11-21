import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
//import desktopHarmattan.com.nokia.extras 1.1
import "script/UIConstants.js" as UIConstants

Rectangle {
    id: photoListView
//    color: "lightgrey"
    signal remove(int index)

    Image {
        height: parent.height
        //source: "images/listbg.png"
        source: "images/bg.png"
        fillMode: Image.Tile
    }

    Image {
        y: 40
        height: 110
        //source: "images/listbg.png"
        source: "images/bg2.png"
        fillMode: Image.Tile
    }

    CountBubble {
        id: cb
        anchors { right: parent.right; top: parent.top; topMargin: 4; rightMargin: 10 }
        value: photoModel.count
        largeSized: true
    }

    Component {
        id: listDelegate

        Item {
            width: 100; height: 100

            Image {
                id: photo
                width: 100; height: 100
                sourceSize.width: 100
                anchors { verticalCenter: parent.verticalCenter }
                fillMode: Image.PreserveAspectCrop
                clip: true
                //cache: false
                //smooth: false
                source: fileName

                onStatusChanged: {
                    if (status == Component.Ready) {
                        action.visible = true;
                    }
                }
            }

            ToolIcon {
                id: action
                x: 65; y: -5
                width: 40; height: 40
                visible: false;
                iconSource: "images/remove.png"

                onClicked: {
                    photoListView.remove(index);
                }
            }
        }
    }

    // The view:
    ListView {
        id: listView
        orientation: ListView.Horizontal
        width: parent.width
        spacing: 16
        cacheBuffer: height
        anchors { fill: parent; topMargin: 45; leftMargin: 16; rightMargin: 16 }
        delegate: listDelegate
        model: photoModel

        //Component.onCompleted: positionViewAtIndex(count - 1, ListView.End)
    }

//    ScrollDecorator {
//        flickableItem: listView
//    }
}
