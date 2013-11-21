.pragma library

var SCREEN_WIDTH = 480.0;
var SCREEN_HEIGHT = 854.0;

function calculateScale(width, height) {
    var widthScale = SCREEN_WIDTH / width
    var heightScale = SCREEN_HEIGHT / height
    var scale = 0.0

    if (widthScale <= heightScale) {
        scale = widthScale;
    } else if (heightScale < widthScale) {
        scale = heightScale;
    }
    return scale;
}
