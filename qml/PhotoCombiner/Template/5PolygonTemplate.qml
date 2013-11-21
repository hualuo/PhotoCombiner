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
            x: 10; y: 10
            width: 228; height: 170;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 228; y: 0 },
                Point { x: 228; y: 132 },
                Point { x: 0; y: 170 }
            ]
            source: photoModel.get(0).fileName
        }
        BasePolygonPhoto {
            id: photo2
            x: 242; y: 10
            width: 228; height: 170;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 228; y: 0 },
                Point { x: 228; y: 170 },
                Point { x: 0; y: 132 }
            ]
            source: photoModel.get(1).fileName
        }
        BasePolygonPhoto {
            id: photo3
            x: 10; y: 148
            width: 460; height: 344;
            points: [
                Point { x: 0; y: 38 },
                Point { x: 230; y: 0 },
                Point { x: 460; y: 38 },
                Point { x: 460; y: 306 },
                Point { x: 230; y: 344 },
                Point { x: 0; y: 306 }
            ]
            source: photoModel.get(2).fileName
        }
        BasePolygonPhoto {
            id: photo4
            x: 10; y: 460
            width: 228; height: 170;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 228; y: 38 },
                Point { x: 228; y: 170 },
                Point { x: 0; y: 170 }
            ]
            source: photoModel.get(3).fileName
        }
        BasePolygonPhoto {
            id: photo5
            x: 242; y: 460
            width: 228; height: 170;
            points: [
                Point { x: 0; y: 38 },
                Point { x: 228; y: 0 },
                Point { x: 228; y: 170 },
                Point { x: 0; y: 170 }
            ]
            source: photoModel.get(4).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -170}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; y: -170}
            PropertyChanges { target: photo2; opacity: 0}
            //PropertyChanges { target: photo3; scale: 0.6}
            PropertyChanges { target: photo3; opacity: 0}
            PropertyChanges { target: photo4; y: 706}
            PropertyChanges { target: photo4; opacity: 0}
            PropertyChanges { target: photo5; y: 706}
            PropertyChanges { target: photo5; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; y: 10}
            PropertyChanges { target: photo2; opacity: 1}
            //PropertyChanges { target: photo3; scale: 1}
            PropertyChanges { target: photo3; opacity: 1}
            PropertyChanges { target: photo4; y: 460}
            PropertyChanges { target: photo4; opacity: 1}
            PropertyChanges { target: photo5; y: 460}
            PropertyChanges { target: photo5; opacity: 1}
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
            //PropertyAnimation { target: photo3; property: "scale"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo3; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo4; property: "opacity"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "y"; duration: Math.random() * 500 + 500 }
            PropertyAnimation { target: photo5; property: "opacity"; duration: Math.random() * 500 + 500 }
        }
    ]
}
