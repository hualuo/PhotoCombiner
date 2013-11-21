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
            width: 227; height: 410;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 227; y: 0 },
                Point { x: 227; y: 270 },
                Point { x: 0; y: 410 }
            ]
            source: photoModel.get(0).fileName
        }
        BasePolygonPhoto {
            id: photo2
            x: 243; y: 10
            width: 227; height: 410;
            points: [
                Point { x: 0; y: 0 },
                Point { x: 227; y: 0 },
                Point { x: 227; y: 410 },
                Point { x: 0; y: 270 }
            ]
            source: photoModel.get(1).fileName
        }
        BasePolygonPhoto {
            id: photo3
            x: 10; y: 288
            width: 460; height: 346;
            points: [
                Point { x: 0; y: 140 },
                Point { x: 230; y: 0 },
                Point { x: 460; y: 140 },
                Point { x: 460; y: 346 },
                Point { x: 0; y: 346 }
            ]
            source: photoModel.get(2).fileName
        }
    }

    states: [
        State {
            name: "DEFAULT"
            PropertyChanges { target: photo1; y: -450}
            PropertyChanges { target: photo1; opacity: 0}
            PropertyChanges { target: photo2; y: -450}
            PropertyChanges { target: photo2; opacity: 0}
            PropertyChanges { target: photo3; y: 706}
            PropertyChanges { target: photo3; opacity: 0}
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: photo1; y: 10}
            PropertyChanges { target: photo1; opacity: 1}
            PropertyChanges { target: photo2; y: 10}
            PropertyChanges { target: photo2; opacity: 1}
            PropertyChanges { target: photo3; y: 288}
            PropertyChanges { target: photo3; opacity: 1}
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
        }
    ]
}
