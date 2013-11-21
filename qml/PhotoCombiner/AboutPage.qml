import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    orientationLock: PageOrientation.LockPortrait
    id: aboutPage
    Flickable {
        contentWidth: aboutColumn.width
        contentHeight: aboutColumn.height
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent

        Column {
            id: aboutColumn
            x: 20; y: 50
            width: aboutPage.width - 40; height: aboutPage.height
            spacing: 20

            Image {
                source: "images/PhotoCombiner.png"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                text: qsTr("Photo Combiner for N9") + " " + appVersion;
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                text: qsTr("Photo Combiner allow you combining favorite photos to one with a customized template. "
                           + "This application is powered by Qt/QML. "
                           + "The future versions will support more features, please follow up.");
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Label {
                text: qsTr("Copyright © 2011 - 2012 Luo Hua")
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Label {
                text: qsTr("Email: <a href=\"mailto: hua.luo@live.com?subject=Photo Combiner\""
                           + " title=\"hua.luo\" target=\"_blank\">"
                           + "hua.luo@live.com</a>");
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                width: parent.width
                onLinkActivated: Qt.openUrlExternally(link);
            }
            Label {
                text: qsTr("Sina Weibo: <a href=\"http://weibo.cn/lu0hua\""
                    + " title=\"Luo_Hua\" target=\"_blank\">"
                    + "Luo_Hua</a>");
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                width: parent.width
                onLinkActivated: Qt.openUrlExternally(link);
            }
        }
    }

    tools: ToolBarLayout {
        ToolIcon {
            iconId: "toolbar-previous"
            onClicked: {
                appWindow.pageStack.pop();
            }
        }
    }
}
