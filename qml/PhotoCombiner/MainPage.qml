import PhotoCombiner 1.0
import QtQuick 1.1
//import com.nokia.meego 1.0
import "script/script.js" as Script
import "Template"

//Page {
QtObject {
    id: mainPage

    property int type: 1
    property BasePage page

    function setPhoto(file) {
        template.setPhoto(file);
    }

    function changeModel() {
        destoryTemplate();

        if (photoModel.count == 2) {
            photoModel.move(0, 1, 1);
        } else {
            var h = photoModel.count / 2;
            for (var i = 0; i < photoModel.count * 2; i++) {
                photoModel.move(Math.random() * h, Math.random() * (photoModel.count - h) + h, 1);
            }
        }

        createTemplate(true);
    }

    function changeTemplate() {
        destoryTemplate();

        if (type < 4) {
            type++;
        } else {
            //changeModel();
            type = 1;
        }

        if (photoModel.count == 2 && type > 2) {
            type = 1;
        }

        createTemplate(true);
    }

    function createTemplate(immediate) {
        var filename = "Template/2x1GridTemplate.qml";
        if (photoModel.count == 2) {
            if (type == 1) filename = "Template/2x1GridTemplate.qml";
            else if (type == 2) filename = "Template/1+1GridTemplate.qml";
            else  filename = "Template/1+1GridTemplate.qml";
        } else if (photoModel.count == 3) {
            if (type == 1) filename = "Template/3PolygonTemplate.qml";
            else if (type == 2) filename = "Template/2+1GridTemplate.qml";
            else if (type == 3) filename = "Template/1+2GridTemplate.qml";
            else filename = "Template/3x1GridTemplate.qml";
        } else if (photoModel.count == 4) {
            if (type == 1) filename = "Template/1+2+1GridTemplate.qml";
            else if (type == 2) filename = "Template/3+1GridTemplate.qml";
            else if (type == 3) filename = "Template/2+2GridTemplate.qml";
            else filename = "Template/2x2GridTemplate.qml";
        } else if (photoModel.count == 5) {
            if (type == 1) filename = "Template/5PolygonTemplate.qml";
            else if (type == 2) filename = "Template/4+1GridTemplate.qml";
            else if (type == 3) filename = "Template/3+2GridTemplate.qml";
            else filename = "Template/1+4GridTemplate.qml";
        } else if (photoModel.count == 6) {
            if (type == 1) filename = "Template/3+3GridTemplate.qml";
            else if (type == 2) filename = "Template/1+5GridTemplate.qml";
            else if (type == 3) filename = "Template/1+2+3GridTemplate.qml";
            else filename = "Template/3x2GridTemplate.qml";
        } else if (photoModel.count == 7) {
            if (type == 1) filename = "Template/7PolygonTemplate.qml";
            else if (type == 2) filename = "Template/5+2GridTemplate.qml";
            else if (type == 3) filename = "Template/4+3GridTemplate.qml";
            else filename = "Template/1+6GridTemplate.qml";
        } else if (photoModel.count == 8) {
            if (type == 1) filename = "Template/6+2GridTemplate.qml";
            else if (type == 2) filename = "Template/1+7GridTemplate.qml";
            else if (type == 3) filename = "Template/4+4GridTemplate.qml";
            else filename = "Template/4x2GridTemplate.qml";
        } else if (photoModel.count > 8) {
            if (type == 1) filename = "Template/6+3GridTemplate.qml";
            else if (type == 2) filename = "Template/5+4GridTemplate.qml";
            else if (type == 3) filename = "Template/3+6GridTemplate.qml";
            else filename = "Template/3x3GridTemplate.qml";
        }

        page = appWindow.pageStack.push(Qt.resolvedUrl(filename), {}, immediate);
    }

    function destoryTemplate() {
        appWindow.pageStack.pop(appWindow.pageStack.currentPage, true);
    }
}
