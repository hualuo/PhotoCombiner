import PhotoCombiner 1.0
import QtQuick 1.1
import "../script/UIConstants.js" as UIConstants

BasePage {
    id: templatePage
    Template {
        id: template
        y: UIConstants.HEADER_HEIGHT
        //width: 480; height: 974
        width: 480; height: 706

        BaseRoundedPhoto {
            id: photo1
            x: 10; y: 10
            width: 460; height: 420;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 10; y: 436
            width: 460; height: 260;
            source: photoModel.get(1).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -420}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; y: 706}
            PropertyChanges { target: photo2; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; y: 436}
            PropertyChanges { target: photo2; opacity: 1}
        }
    ]
    transitions: [
        Transition {
            from: "DEFAULT"
            to: "NORMAL"
            PropertyAnimation { target: photo1; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo1; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
