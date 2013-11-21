import QtQuick 1.1
import com.nokia.meego 1.0
import "script/UIConstants.js" as UIConstants

Image {
    id: root
    anchors { left: parent.left; right: parent.right; top: parent.top }
    height: UIConstants.HEADER_HEIGHT
    source: "images/header.png"

    property alias text: itemText.text

    Text {
        id: itemText
        width: parent.width; height: parent.height
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter
        anchors { fill: parent; centerIn: parent }
    }
}
