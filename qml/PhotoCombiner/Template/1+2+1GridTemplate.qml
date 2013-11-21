import PhotoCombiner 1.0
import QtQuick 1.1
import "../script/script.js" as Script
import "../script/UIConstants.js" as UIConstants

BasePage {
    id: templatePage
    Template {
        id: template
        y: UIConstants.HEADER_HEIGHT
        width: 480; height: 640

        BaseRoundedPhoto {
            id: photo1
            x: 10; y: 10
            width: 260; height: 360;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 276; y: 10
            width: 194; height: 177;
            source: photoModel.get(1).fileName
        }
        BaseRoundedPhoto {
            id: photo3
            x: 276; y: 193
            width: 194; height: 177;
            source: photoModel.get(2).fileName
        }
        BaseRoundedPhoto {
            id: photo4
            x: 10; y: 376
            width: 460; height: 254;
            source: photoModel.get(3).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; x: -260}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; x: 480}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; x: 480}
            PropertyChanges { target: photo3; opacity: 0}
            PropertyChanges { target: photo4; y: 706}
            PropertyChanges { target: photo4; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; x: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; x: 276}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; x: 276}
            PropertyChanges { target: photo3; opacity: 1}
            PropertyChanges { target: photo4; y: 376}
            PropertyChanges { target: photo4; opacity: 1}
        }
    ]

    transitions: [
        Transition {
            from: "DEFAULT"
            to: "NORMAL"
            PropertyAnimation { target: photo1; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo1; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
