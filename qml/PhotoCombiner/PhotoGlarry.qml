import QtQuick 1.1
import com.nokia.meego 1.0
import QtMobility.gallery 1.1

Rectangle {
    id: glarry
    color: "lightgrey"
    signal selected(string fileName)

    Component {
        id: photoGlarryDelegate

        Image {
            id: image
            width: 220; height: 165
            sourceSize.width: 220
            fillMode: Image.PreserveAspectCrop
            scale: mouseArea.pressed ? 0.95 : 1
            asynchronous: true
            cache: false
            smooth: false
            clip: true
            source: url

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    glarry.selected(url);
                }
            }
        }
    }

    DocumentGalleryModel {
        id: photoGlarryModel
        rootType: DocumentGallery.Image
        properties: [ "url" ]
        filter: GalleryWildcardFilter {
            property: "fileName";
            value: "*.*";
        }
    }

    GridView {
        id: gridView
        anchors { fill: parent; leftMargin: 17 }
        cellWidth: 223; cellHeight: 168
        cacheBuffer: height
        clip: true

        model: photoGlarryModel
        delegate: photoGlarryDelegate
    }
}
