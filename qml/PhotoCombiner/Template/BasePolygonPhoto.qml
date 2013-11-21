import PhotoCombiner 1.0
import QtQuick 1.1

PolygonPhoto {
    id: photo
    MouseArea {
        anchors.fill: parent
        property int xPos: 0
        property int yPos: 0
        onDoubleClicked: {
            if (photo.zoom == 1) photo.zoom = 1.5;
            else photo.zoom = 1;
            photo.createPixmap(true);
            templatePage.enableSave();
        }
        onPressed: {
            xPos = mouse.x;
            yPos = mouse.y;
        }
        onMousePositionChanged: {
            if (Math.abs(mouse.x - xPos) > 10 || Math.abs(mouse.y - yPos) > 10) {
                photo.xOffset += xPos - mouse.x;
                xPos = mouse.x;
                photo.yOffset += yPos - mouse.y;
                yPos = mouse.y;
                photo.createPixmap(true);
                templatePage.enableSave();
            }
        }
        onReleased: {
            xPos = 0;
            yPos = 0;
        }
    }
}
