
#include <QPainter>
#include <QPixmap>
#include <QImage>
#include <QImageReader>
#include <QBitmap>
#include <QPoint>
#include <QTimer>
#include "polygonphoto.h"

Point::Point(QObject *parent)
     : QObject(parent)
 {
 }

 int Point::x() const
 {
     return m_x;
 }

 void Point::setX(int x)
 {
     m_x = x;
 }

 int Point::y() const
 {
     return m_y;
 }

 void Point::setY(int y)
 {
     m_y = y;
 }

PolygonPhoto::PolygonPhoto(QDeclarativeItem *parent)
    : PhotoItem(parent)
{
    // need to disable this flag to draw inside a QDeclarativeItem
    setFlag(QGraphicsItem::ItemHasNoContents, false);
    setSmooth(true);

    QTimer::singleShot(0, this, SLOT(loadImage()));
}

QDeclarativeListProperty<Point> PolygonPhoto::points()
{
    return QDeclarativeListProperty<Point>(this, 0, &PolygonPhoto::append_point);
}

void PolygonPhoto::append_point(QDeclarativeListProperty<Point> *list, Point *point)
{
    PolygonPhoto *polygon = qobject_cast<PolygonPhoto *>(list->object);
    if (polygon) {
        polygon->m_points.append(point);
    }
}

void PolygonPhoto::loadImage()
{
    if (m_source.isEmpty()) {
        m_buffer = QPixmap(width(), height());
    } else {
        QString fn = m_source;
        fn.remove("file://");
        QImageReader reader(fn);
        QSize imageSize = reader.size();
        QSize newSize = QSize(width(), height());
        imageSize.scale(newSize, Qt::KeepAspectRatioByExpanding);
        reader.setScaledSize(imageSize);
        QImage image = reader.read();
        m_buffer = QPixmap::fromImage(image);
    }
}

void PolygonPhoto::createPixmap(bool needUpdate)
{
    if (m_buffer.isNull()) loadImage();

    m_photo = m_buffer;

    if (zoom() > 1.2) {
        m_photo = m_photo.scaled(m_photo.size() * zoom());
    }

    if (xOffset() == -1 && yOffset() == -1) {
        setXOffset((m_photo.width() - width()) / 2);
        setYOffset((m_photo.height() - height()) / 2);
    }
    if (xOffset() < 0) {
        setXOffset(0);
    } else if ((xOffset() + width()) > m_photo.width()) {
        setXOffset(m_photo.width() - width());
    }
    if (yOffset() < 0) {
        setYOffset(0);
    } else if ((yOffset() + height()) > m_photo.height()) {
        setYOffset(m_photo.height() - height());
    }

//    qDebug("offset %d, %d", xOffset(), yOffset());
//    qDebug() << m_photo.size();

    QPixmap bg(m_photo.width(), m_photo.height());
    bg.fill(QColor(Qt::white));
    QPainter p(&bg);
    p.setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
    p.setBrush(QBrush(QColor(Qt::lightGray)));
    QPolygon polygon;
    foreach (Point *point, m_points)
        polygon << QPoint(xOffset() + point->x(), yOffset() + point->y());
    p.drawPolygon(polygon);

    QBitmap mask = bg.createMaskFromColor(QColor(Qt::white));

    m_photo.setMask(mask);
    //qDebug() << boundingRect();

    if (needUpdate)
        update();
}


QPixmap PolygonPhoto::getPhoto(float scale)
{
    QString fn = m_source;
    fn.remove("file://");
    QImageReader reader(fn);
    QSize imageSize = reader.size();
    QSize newSize = QSize(width() * scale * zoom(), height() * scale * zoom());
    imageSize.scale(newSize, Qt::KeepAspectRatioByExpanding);
    reader.setScaledSize(imageSize);
    QImage image = reader.read();
    QPixmap pixmap = QPixmap::fromImage(image);

    if (zoom() > 1.2) {
        //qDebug() << "Before Zoom: " << pixmap.size();
        //pixmap = pixmap.scaled(pixmap.size() * zoom());
        //pixmap = pixmap.copy(xOffset(), yOffset(), image.width(), image.height());
    }

    //qDebug() << pixmap.size();

    QPixmap bg(pixmap.width(), pixmap.height());
    bg.fill(QColor(Qt::white));
    QPainter p(&bg);
    p.setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
    p.setBrush(QBrush(QColor(Qt::lightGray)));
    QPolygon polygon;
    foreach (Point *point, m_points)
        polygon << QPoint(scale * (xOffset() + point->x()), scale * (yOffset() + point->y()));
    p.drawPolygon(polygon);

    QBitmap mask = bg.createMaskFromColor(QColor(Qt::white));

    pixmap.setMask(mask);

    QRect rect = QRect(scale * xOffset(), scale * yOffset(),
                       scale * width(), scale * height());

    // bug with pixmap copy, work around it
    //return pixmap.copy(rect);
    QPixmap tmp(scale * width(), scale * height());
    tmp.fill(QColor(Qt::transparent));
    QPainter painter(&tmp);
    painter.setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
    painter.drawPixmap(0, 0, pixmap, scale * xOffset(), scale * yOffset(), scale * width(), scale * height());

    return tmp;
}


void PolygonPhoto::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *)
{
    if (m_photo.isNull()) createPixmap();
    painter->setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
    painter->drawPixmap(0, 0, m_photo, xOffset(), yOffset(), width(), height());
}
