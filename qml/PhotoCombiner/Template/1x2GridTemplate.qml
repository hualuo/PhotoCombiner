import PhotoCombiner 1.0
import QtQuick 1.1
import "../script/UIConstants.js" as UIConstants

BasePage {
    id: templatePage
    Template {
        id: template
        objectName: "result"
        y: UIConstants.HEADER_HEIGHT
        width: 480; height: 640

        BaseRoundedPhoto {
            id: photo1
            x: 10; y: 10
            width: 460; height: 307;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 10; y: 323
            width: 460; height: 307;
            source: photoModel.get(1).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; scale: 0.6}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; scale: 0.6}
            PropertyChanges { target: photo2; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; scale: 1}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; scale: 1}
            PropertyChanges { target: photo2; opacity: 1}
        }
    ]

    transitions: [
        Transition {
            from: "DEFAULT"
            to: "NORMAL"
            PropertyAnimation { target: photo1; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo1; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
