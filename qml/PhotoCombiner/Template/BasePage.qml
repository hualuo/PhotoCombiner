import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
//import desktopHarmattan.com.nokia.extras 1.1
import "../script/UIConstants.js" as UIConstants
import "../"

Page {
    orientationLock: PageOrientation.LockPortrait
    anchors { fill: parent; } //bottomMargin: toolBar.height }

    function enableSave() {
        saveButton.visible = true;
    }

    TitleHeader {
        id: header
        text:  qsTr("2. Choose Template")
    }

    Rectangle {
        id: rect
        anchors { top: header.bottom; }
        width: parent.width; height: parent.height - header.height
        color: "lightgrey"
    }

    InfoBanner {
        id: banner
        anchors.bottom: parent.bottom
        text: qsTr("Combined Photo Saved!")
    }

    tools: ToolBarLayout {
        ToolIcon {
            iconId: "toolbar-previous"
            onClicked: {
                appWindow.pageStack.pop();
            }
        }
        ToolIcon {
            iconId: "toolbar-shuffle-dimmed-white"
            onClicked: {
                mainPage.changeTemplate();
                saveButton.visible = true;
            }
        }
        ToolIcon {
            iconId: "toolbar-refresh"
            onClicked: {
                mainPage.changeModel();
                saveButton.visible = true;
            }
        }
        ToolIcon {
            id: saveButton
            //iconId: "toolbar-next"
            iconSource: "../images/save.png"
            onClicked: {
                template.saveImage(UIConstants.NORMORL_Q);
                //photoCombiner.savePhoto();
                //banner.text = qsTr("Combined Photo Saved!");
                banner.show();
                saveButton.visible = false;
            }
        }
    }

    state: "DEFAULT"
    Component.onCompleted: {
        state = "NORMAL";
    }
}
