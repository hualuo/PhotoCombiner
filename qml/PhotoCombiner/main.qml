import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    showStatusBar: true
    showToolBar: true
    initialPage: photoPage

    ListModel {
        id: photoModel
    }

    PhotoSelectorPage {
        id: photoPage
    }

    MainPage {
        id: mainPage
    }
}
