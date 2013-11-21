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
            width: 110; height: 202;
            source: photoModel.get(0).fileName
        }
        BaseRoundedPhoto {
            id: photo2
            x: 126; y: 10
            width: 228; height: 131;
            source: photoModel.get(1).fileName
        }
        BaseRoundedPhoto {
            id: photo3
            x: 360; y: 10
            width: 110; height: 202;
            source: photoModel.get(2).fileName
        }
        BaseRoundedPhoto {
            id: photo4
            x: 10; y: 218
            width: 110; height: 204;
            source: photoModel.get(3).fileName
        }
        BaseRoundedPhoto {
            id: photo5
            x: 126; y: 147
            width: 228; height: 346;
            source: photoModel.get(4).fileName
        }
        BaseRoundedPhoto {
            id: photo6
            x: 360; y: 218
            width: 110; height: 204;
            source: photoModel.get(5).fileName
        }
        BaseRoundedPhoto {
            id: photo7
            x: 10; y: 428
            width: 110; height: 202;
            source: photoModel.get(6).fileName
        }
        BaseRoundedPhoto {
            id: photo8
            x: 128; y: 499
            width: 228; height: 131;
            source: photoModel.get(7).fileName
        }
        BaseRoundedPhoto {
            id: photo9
            x: 360; y: 428
            width: 110; height: 202;
            source: photoModel.get(8).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -202}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; y: -131}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; y: -202}
            PropertyChanges { target: photo3; opacity: 0}
            PropertyChanges { target: photo4; x: -110}
            PropertyChanges { target: photo4; opacity: 0}
            //PropertyChanges { target: photo5; scale: 0.6}
            PropertyChanges { target: photo5; opacity: 0}
            PropertyChanges { target: photo6; x: 480}
            PropertyChanges { target: photo6; opacity: 0}
            PropertyChanges { target: photo7; y: 706}
            PropertyChanges { target: photo7; opacity: 0}
            PropertyChanges { target: photo8; y: 706}
            PropertyChanges { target: photo8; opacity: 0}
            PropertyChanges { target: photo9; y: 706}
            PropertyChanges { target: photo9; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; y: 10}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; y: 10}
            PropertyChanges { target: photo3; opacity: 1}
            PropertyChanges { target: photo4; x: 10}
            PropertyChanges { target: photo4; opacity: 1}
            //PropertyChanges { target: photo5; scale: 1}
            PropertyChanges { target: photo5; opacity: 1}
            PropertyChanges { target: photo6; x: 360}
            PropertyChanges { target: photo6; opacity: 1}
            PropertyChanges { target: photo7; y: 428}
            PropertyChanges { target: photo7; opacity: 1}
            PropertyChanges { target: photo8; y: 499}
            PropertyChanges { target: photo8; opacity: 1}
            PropertyChanges { target: photo9; y: 428}
            PropertyChanges { target: photo9; opacity: 1}
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
            PropertyAnimation { target: photo3; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "opacity"; duration: Math.random() * 500 + 500 }
            //PropertyAnimation { target: photo5; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo8; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo8; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo9; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo9; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
