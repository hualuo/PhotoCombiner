
#include <QPainter>
#include <QPixmap>
#include <QImage>
#include <QImageReader>
#include <QBitmap>
#include <QTimer>
#include <QDebug>
#include "roundedphoto.h"

RoundedPhoto::RoundedPhoto(QDeclarativeItem *parent)
    : PhotoItem(parent), m_radius(-1)
{
    // need to disable this flag to draw inside a QDeclarativeItem
    setFlag(QGraphicsItem::ItemHasNoContents, false);
    setSmooth(true);

    QTimer::singleShot(0, this, SLOT(loadImage()));
}

int RoundedPhoto::radius() const
{
    return m_radius;
}

void RoundedPhoto::setRadius(const int radius)
{
    m_radius = radius;
}

void RoundedPhoto::loadImage()
{
    if (m_radius == -1) {
        if (width() < height()) {
            m_radius = 0.05 * width();
        } else {
            m_radius = 0.05 * height();
        }
    }

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

void RoundedPhoto::createPixmap(bool needUpdate)
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
//    qDebug() << boundingRect();

    QPixmap bg(m_photo.width(), m_photo.height());
    bg.fill(QColor(Qt::white));
    QPainter p(&bg);
    p.setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
    p.setBrush(QBrush(QColor(Qt::lightGray)));
    p.drawRoundedRect(xOffset(), yOffset(), width(), height(), m_radius, m_radius);

    QBitmap mask = bg.createMaskFromColor(QColor(Qt::white));

    m_photo.setMask(mask);

    if (needUpdate)
        update();
}


QPixmap RoundedPhoto::getPhoto(float scale)
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
    //QPixmap pixmap = m_buffer.scaled(m_buffer.size() * scale * zoom());

    //qDebug() << pixmap.size();

    QPixmap bg(pixmap.width(), pixmap.height());
    bg.fill(QColor(Qt::white));
    QPainter p(&bg);
    p.setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
    p.setBrush(QBrush(QColor(Qt::lightGray)));
    p.drawRoundedRect(scale * xOffset(), scale * yOffset(),
                      scale * width(), scale * height(),
                      scale * m_radius, scale * m_radius);

    QBitmap mask = bg.createMaskFromColor(QColor(Qt::white));

    pixmap.setMask(mask);

    QRect rect = QRect(scale * xOffset(), scale * yOffset(),
                       scale * width(), scale * height());

    //qDebug() << rect;

    // bug with copy, work around it
    //return pixmap.copy(rect);
    QPixmap tmp(scale * width(), scale * height());
    tmp.fill(QColor(Qt::transparent));
    QPainter painter(&tmp);
    painter.drawPixmap(0, 0, pixmap, scale * xOffset(), scale * yOffset(), scale * width(), scale * height());

    return tmp;
}

void RoundedPhoto::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *)
{
    if (m_photo.isNull()) createPixmap();
    painter->drawPixmap(0, 0, m_photo, xOffset(), yOffset(), width(), height());
}
