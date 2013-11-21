import PhotoCombiner 1.0
import QtQuick 1.1
import "../script/UIConstants.js" as UIConstants

BasePage {
    id: templatePage
    Template {
        id: template
        y: UIConstants.HEADER_HEIGHT
        width: 480; height: 640

        BasePolygonPhoto {
            id: photo1
            x: 18; y: 10
            width: 444; height: 140;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 444; y: 0 },
                Point { x: 292; y: 140 },
                Point { x: 152; y: 140 }
            ]
            source: photoModel.get(0).fileName
        }
        BasePolygonPhoto {
            id: photo2
            x: 10; y: 12
            width: 153; height: 305;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 153; y: 143 },
                Point { x: 93; y: 305 },
                Point { x: 0; y: 305 }
            ]
            source: photoModel.get(1).fileName
        }
        BasePolygonPhoto {
            id: photo3
            x: 317; y: 12
            width: 153; height: 305;
            points: [
                Point { x: 153; y: 0 },
                Point { x: 153; y: 305 },
                Point { x: 62; y: 305 },
                Point { x: 0; y: 143 }
            ]
            source: photoModel.get(2).fileName
        }
        BasePolygonPhoto {
            id: photo4
            x: 110; y: 156
            width: 260; height: 328;
            points: [
                Point { x: 60; y: 0 },
                Point { x: 200; y: 0 },
                Point { x: 260; y: 164 },
                Point { x: 200; y: 328 },
                Point { x: 60; y: 328 },
                Point { x: 0; y: 164 }
            ]
            source: photoModel.get(3).fileName
        }
        BasePolygonPhoto {
            id: photo5
            x: 10; y: 323
            width: 153; height: 305;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 93; y: 0 },
                Point { x: 153; y: 164 },
                Point { x: 0; y: 305 }
            ]
            source: photoModel.get(4).fileName
        }
        BasePolygonPhoto {
            id: photo6
            x: 317; y: 323
            width: 153; height: 305;
            points: [
                Point { x: 62; y: 0 },
                Point { x: 153; y: 0 },
                Point { x: 153; y: 305 },
                Point { x: 0; y: 164 }
            ]
            source: photoModel.get(5).fileName
        }
        BasePolygonPhoto {
            id: photo7
            x: 18; y: 490
            width: 444; height: 140;
            points: [
                Point { x: 152; y: 0 },
                Point { x: 292; y: 0 },
                Point { x: 444; y: 140 },
                Point { x: 0; y: 140 }
            ]
            source: photoModel.get(6).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -140}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; x: -153}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; x: 480}
            PropertyChanges { target: photo3; opacity: 0}
            //PropertyChanges { target: photo4; scale: 0.6}
            PropertyChanges { target: photo4; opacity: 0}
            PropertyChanges { target: photo5; x: -153}
            PropertyChanges { target: photo5; opacity: 0}
            PropertyChanges { target: photo6; x: 480}
            PropertyChanges { target: photo6; opacity: 0}
            PropertyChanges { target: photo7; y: 706}
            PropertyChanges { target: photo7; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; x: 10}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; x: 317}
            PropertyChanges { target: photo3; opacity: 1}
            //PropertyChanges { target: photo4; scale: 1}
            PropertyChanges { target: photo4; opacity: 1}
            PropertyChanges { target: photo5; x: 10}
            PropertyChanges { target: photo5; opacity: 1}
            PropertyChanges { target: photo6; x: 317}
            PropertyChanges { target: photo6; opacity: 1}
            PropertyChanges { target: photo7; y: 490}
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
            //PropertyAnimation { target: photo4; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "x"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo6; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo7; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
