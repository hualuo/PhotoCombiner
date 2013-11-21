import PhotoCombiner 1.0
import QtQuick 1.1
import "../script/script.js" as Script
import "../script/UIConstants.js" as UIConstants

BasePage {
    id: templatePage
    Template {
        id: template
        //width: 480; height: 640
        y: UIConstants.HEADER_HEIGHT
        width: 480; height: 706

        BaseRoundedPhoto {
            id: photo1
            x: 10; y: 10
            width: 460; height: 225;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 10; y: 241
            width: 460; height: 224;
            source: photoModel.get(1).fileName
        }
        BaseRoundedPhoto {
            id: photo3
            x: 10; y: 471
            width: 460; height: 225;
            source: photoModel.get(2).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -225}
            PropertyChanges { target: photo1; opacity: 0}
            //PropertyChanges { target: photo2; scale: 0.6}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; y: 706}
            PropertyChanges { target: photo3; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            //PropertyChanges { target: photo2; scale: 1}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; y: 471}
            PropertyChanges { target: photo3; opacity: 1}
        }
    ]

    transitions: [
        Transition {
            from: "DEFAULT"
            to: "NORMAL"
            PropertyAnimation { target: photo1; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo1; property: "opacity"; duration: Math.random() * 500 + 500 }
            //PropertyAnimation { target: photo2; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
