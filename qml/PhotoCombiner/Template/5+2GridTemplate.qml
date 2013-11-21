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
            width: 227; height: 170;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 243; y: 10
            width: 227; height: 170;
            source: photoModel.get(1).fileName
        }
        BaseRoundedPhoto {
            id: photo3
            x: 10; y: 186
            width: 149; height: 268;
            source: photoModel.get(2).fileName
        }
        BaseRoundedPhoto {
            id: photo4
            x: 165; y: 186
            width: 150; height: 268;
            source: photoModel.get(3).fileName
        }
        BaseRoundedPhoto {
            id: photo5
            x: 321; y: 186
            width: 149; height: 268;
            source: photoModel.get(4).fileName
        }
        BaseRoundedPhoto {
            id: photo6
            x: 10; y: 460
            width: 227; height: 170;
            source: photoModel.get(5).fileName
        }
        BaseRoundedPhoto {
            id: photo7
            x: 243; y: 460
            width: 227; height: 170;
            source: photoModel.get(6).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -170}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; y: -170}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; x: -149}
            PropertyChanges { target: photo3; opacity: 0}
            //PropertyChanges { target: photo4; scale: 0.6}
            PropertyChanges { target: photo4; opacity: 0}
            PropertyChanges { target: photo5; x: 480}
            PropertyChanges { target: photo5; opacity: 0}
            PropertyChanges { target: photo6; y: 706}
            PropertyChanges { target: photo6; opacity: 0}
            PropertyChanges { target: photo7; y: 706}
            PropertyChanges { target: photo7; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; y: 10}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; x: 10}
            PropertyChanges { target: photo3; opacity: 1}
            //PropertyChanges { target: photo4; scale: 1}
            PropertyChanges { target: photo4; opacity: 1}
            PropertyChanges { target: photo5; x: 321}
            PropertyChanges { target: photo5; opacity: 1}
            PropertyChanges { target: photo6; y: 460}
            PropertyChanges { target: photo6; opacity: 1}
            PropertyChanges { target: photo7; y: 460}
            PropertyChanges { target: photo7; opacity: 1}
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
            PropertyAnimation { target: photo3; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "opacity"; duration: Math.random() * 500 + 500 }
            //PropertyAnimation { target: photo4; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
