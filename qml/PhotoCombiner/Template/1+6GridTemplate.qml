import PhotoCombiner 1.0
import QtQuick 1.1
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
            width: 460; height: 151;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 10; y: 167
            width: 227; height: 150;
            source: photoModel.get(1).fileName
        }
        BaseRoundedPhoto {
            id: photo3
            x: 243; y: 167
            width: 227; height: 150;
            source: photoModel.get(2).fileName
        }
        BaseRoundedPhoto {
            id: photo4
            x: 10; y: 323
            width: 227; height: 150;
            source: photoModel.get(3).fileName
        }
        BaseRoundedPhoto {
            id: photo5
            x: 243; y: 323
            width: 227; height: 150;
            source: photoModel.get(4).fileName
        }
        BaseRoundedPhoto {
            id: photo6
            x: 10; y: 479
            width: 227; height: 151;
            source: photoModel.get(5).fileName
        }
        BaseRoundedPhoto {
            id: photo7
            x: 243; y: 479
            width: 227; height: 151;
            source: photoModel.get(6).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -151}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; x: -227}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; x: 480}
            PropertyChanges { target: photo3; opacity: 0}
            PropertyChanges { target: photo4; x: -227}
            PropertyChanges { target: photo4; opacity: 0}
            PropertyChanges { target: photo5; x: 480}
            PropertyChanges { target: photo5; opacity: 0}
            PropertyChanges { target: photo6; x: -227}
            PropertyChanges { target: photo6; opacity: 0}
            PropertyChanges { target: photo7; x: 480}
            PropertyChanges { target: photo7; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; x: 10}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; x: 243}
            PropertyChanges { target: photo3; opacity: 1}
            PropertyChanges { target: photo4; x: 10}
            PropertyChanges { target: photo4; opacity: 1}
            PropertyChanges { target: photo5; x: 243}
            PropertyChanges { target: photo5; opacity: 1}
            PropertyChanges { target: photo6; x: 10}
            PropertyChanges { target: photo6; opacity: 1}
            PropertyChanges { target: photo7; x: 243}
            PropertyChanges { target: photo7; opacity: 1}
        }
    ]

    transitions: [
        Transition {
            from: "DEFAULT"
            to: "NORMAL"
            PropertyAnimation { target: photo1; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo1; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo2; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
