import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
//import desktopHarmattan.com.nokia.extras 1.1
import "script/UIConstants.js" as UIConstants

Page {
    id: selectorPage
    orientationLock: PageOrientation.LockPortrait
    anchors { fill: parent; } //topMargin: statusBar.height; bottomMargin: toolBar.height }

//    Image {
//        height: parent.height
//        //source: "images/listbg.png"
//        source: "images/bg.png"
//        fillMode: Image.TileVertically
//    }

    TitleHeader {
        id: header
        text:  qsTr("1. Select Photo")
    }

    PhotoGlarry {
        id: photoGlarry
        width: parent.width; height: parent.height - UIConstants.HEADER_HEIGHT
        anchors { top: header.bottom; }

        onSelected: {
            if (photoModel.count < 9) {
                photoModel.insert(0, {"fileName": fileName});
            } else {
                banner.show();
            }

                photoGlarry.height = parent.height - UIConstants.HEADER_HEIGHT - UIConstants.FOOTER_HEIGHT;

            if (photoModel.count > 1) {
                next.visible = true;
            }
        }
    }

//    FilePicker {
//        id: photoGlarry
//        width: parent.width; height: parent.height - UIConstants.HEADER_HEIGHT
//        anchors { top: header.bottom; }

//        onSelected: {
//            console.log(fileName);
//            if (photoModel.count < 9) {
//                //photoModel.append({"fileName": fileName});
//                photoModel.insert(0, {"fileName": fileName});
//            } else {
//                banner.show();
//            }

//            photoGlarry.height = parent.height - UIConstants.HEADER_HEIGHT - UIConstants.FOOTER_HEIGHT;

//            if (photoModel.count > 1) {
//                next.visible = true;
//            }
//        }
//    }

    PhotoListView {
        id: photoListView
        anchors { top: photoGlarry.bottom; }
        width: parent.width; height: UIConstants.FOOTER_HEIGHT

        onRemove: {
            photoModel.remove(index);
            if (photoModel.count < 2) {
                next.visible = false;
            }
            if (photoModel.count == 0) {
                photoGlarry.height = parent.height - UIConstants.HEADER_HEIGHT;
            }
        }
    }

    InfoBanner {
        id: banner
        text: qsTr("Press > for next!")
        anchors.top: photoGlarry.bottom
    }

    tools: ToolBarLayout {
        ToolIcon {
            iconSource: "images/about.png"
            onClicked: appWindow.pageStack.push(Qt.resolvedUrl("AboutPage.qml"));
        }
        ToolIcon {
            id: next
            iconId: "toolbar-next"
            visible: false
            onClicked: {
                mainPage.type = 1;
                mainPage.createTemplate(true);
            }
        }
    }
}
