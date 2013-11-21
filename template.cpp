
#include <QPainter>
#include <QPixmap>
#include <QBitmap>
#include <QDate>
#include <QDesktopServices>
#include <QDir>
#include <QFile>
#include <QTimer>
#include <QDebug>
#include <QDeclarativeImageProvider>
#include "photoitem.h"
#include "template.h"

Template::Template(QDeclarativeItem *parent)
    : QDeclarativeItem(parent), m_color(QColor(Qt::white))
{
    // need to disable this flag to draw inside a QDeclarativeItem
    setFlag(QGraphicsItem::ItemHasNoContents, false);
    setSmooth(true);

    //QTimer::singleShot(0, this, SLOT(createPixmap()));
}

QColor Template::color() const
{
    return m_color;
}

void Template::setColor(const QColor &color)
{
    m_color = color;
}

QString Template::source() const
{
    return m_source;
}

void Template::setSource(const QString &source)
{
    m_source = source;
}

void Template::createPixmap()
{
    m_photo = QPixmap(boundingRect().width(), boundingRect().height());
    m_photo.fill(m_color);
    if (!m_source.isEmpty()) {
        QString fn = m_source;
        fn.remove("file://");
        m_photo.load(fn);
        m_photo = m_photo.scaled(QSize(boundingRect().width(), boundingRect().height()), Qt::KeepAspectRatioByExpanding);
        m_photo = m_photo.copy(0, 0, boundingRect().width(), boundingRect().height());
    }
}

void Template::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *)
{
    if (m_photo.isNull()) createPixmap();
    //createPixmap();
    painter->drawPixmap(0, 0, m_photo.width(), m_photo.height(), m_photo);
}

void Template::saveImage(float scale)
{
    QPixmap pixmap = m_photo.scaled(m_photo.size() * scale);
    QPainter p(&pixmap);
    p.setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);

    QList<QObject*> list = children();
    if (list.first()->inherits("QDeclarativeGrid")) {
        list = list.first()->children();
    }

    foreach (QObject* item, list) {
        if (item->inherits("PhotoItem")) {
            PhotoItem * photo = dynamic_cast<PhotoItem*>(item);
            QPixmap cell = photo->getPhoto(scale);
//            qDebug() << photo->width() << photo->height();
//            qDebug() << cell.size();
            QRectF rect = photo->mapRectToParent(0, 0, photo->width(), photo->height());
            p.drawPixmap(scale * rect.x(), scale * rect.y(),
                         scale * rect.width(), scale * rect.height(), cell);
        }
    }
//    foreach (QObject* item, list) {
//        if (item->inherits("MDeclarativeMaskedItem")) {
//            QPixmap cell = dynamic_cast<MDeclarativeMaskedItem*>(item)->grabItem();
//            QRectF rect = dynamic_cast<MDeclarativeMaskedItem*>(item)->mapRectToParent(0, 0, cell.width(), cell.height());
//            p.drawPixmap(rect.x(), rect.y(), rect.width(), rect.height(), cell);
//        }
//    }

    QString fileName = QDesktopServices::storageLocation(QDesktopServices::PicturesLocation);
    QDir dir(fileName);
    if (!dir.exists("PhotoCombiner")) {
        dir.mkdir("PhotoCombiner");
    }
    fileName += "/PhotoCombiner/";
    fileName += QDate::currentDate().toString("yyyyMMdd");
    for (int i = 1; ; i++) {
# ifdef Q_OS_WIN
        QString str = fileName + "_" + QString::number(i) + ".jpg";
# else
        QString str = fileName + "_" + QString::number(i) + ".png";
# endif
        if (!QFile::exists(str)) {
            fileName = str;
            break;
        }
    }
# ifdef Q_OS_WIN
    pixmap.toImage().save(fileName, "jpg", 92);
# else
    pixmap.toImage().save(fileName, "png");
# endif
}
