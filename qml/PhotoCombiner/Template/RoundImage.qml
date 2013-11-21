import QtQuick 1.1
import PhotoCombiner 1.0

MaskedItem {
    id: item
    property alias source: image.source

    mask: Rectangle {
        width: item.width; height: item.height
        radius: width * 0.05
    }

    Image {
        id: image
        anchors.fill: parent; anchors.centerIn: parent
        //width: parent.width; height: parent.height
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        smooth: true
        //clip: true
        //onStatusChanged: if (image.status == Image.Ready) item.state = "DEFAULT"

        MouseArea {
            anchors.fill: parent
            property int xPos: 0
            property int yPos: 0
            onDoubleClicked: {
                if (image.scale == 1) image.scale = 1.5;
                else image.scale = 1;
            }
            onPressed: {
                xPos = mouse.x;
                yPos = mouse.y;
            }
            onMousePositionChanged: {
                if (Math.abs(mouse.x - xPos) > 10 || Math.abs(mouse.y - yPos) > 10) {
                    var offset = xPos - mouse.x;
                    xPos = mouse.x;
                    //image.x += offset;
                    image.anchors.horizontalCenterOffset += offset;
//                    if (image.x < 0) {
//                        image.x = 0;
//                    } else if ( (image.x + item.width) > image.width) {
//                        image.x = image.width - item.width;
//                    }
                    offset += yPos - mouse.y;
                    yPos = mouse.y;
                    image.anchors.verticalCenterOffset += offset;
//                    image.y += offset;
//                    if (image.y < 0) {
//                        image.y = 0;
//                    } else if ( (image.y + item.height) > image.height) {
//                        image.y = image.height - item.height;
//                    }
                    console.log(offset);
                }
            }
            onReleased: {
                xPos = 0;
                yPos = 0;
            }
        }
    }

//    state: "DEFAULT"
//    states: [
//        State {
//            name: "DEFAULT"
//            when: image.visible == false
//            PropertyChanges { target: item; scale: 0.6}
//            PropertyChanges { target: item; opacity: 0}
//        },
//        State {
//            name: "NORMAL"
//            when: image.status == Image.Ready
//            PropertyChanges { target: item; scale: 1}
//            PropertyChanges { target: item; opacity: 1}
//        }
//    ]

//    transitions: [
//        Transition {
//            from: "DEFAULT"
//            to: "NORMAL"
//            PropertyAnimation { target: item; property: "scale"; duration: Math.random() * 800 + 500 }
//            PropertyAnimation { target: item; property: "opacity"; duration: Math.random() * 800 + 500 }
//        }
//    ]
}
