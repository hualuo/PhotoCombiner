#include <QLibraryInfo>
#include <QTranslator>
#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include "template.h"
#include "roundedphoto.h"
#include "polygonphoto.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QTranslator qtTranslator;
    qtTranslator.load("qt_" + QLocale::system().name(),
                      QLibraryInfo::location(QLibraryInfo::TranslationsPath));
    app->installTranslator(&qtTranslator);

    QTranslator myappTranslator;
    myappTranslator.load("PhotoCombiner_" + QLocale::system().name(), ":/");
    //myappTranslator.load("PhotoCombiner_zh_CN", ":/");
    app->installTranslator(&myappTranslator);

    qmlRegisterType<Template>("PhotoCombiner", 1, 0, "Template");
    qmlRegisterType<RoundedPhoto>("PhotoCombiner", 1, 0, "RoundedPhoto");
    qmlRegisterType<PolygonPhoto>("PhotoCombiner", 1, 0, "PolygonPhoto");
    qmlRegisterType<Point>("PhotoCombiner", 1, 0, "Point");

    QmlApplicationViewer viewer;
    // Expose the application version to QML
    app->setApplicationVersion(APP_VERSION);
    viewer.rootContext()->setContextProperty("appVersion", app->applicationVersion());
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    //viewer.setMainQmlFile(QLatin1String("qml/PhotoCombiner/main.qml"));
    viewer.setSource(QUrl("qrc:/qml/PhotoCombiner/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
