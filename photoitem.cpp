
#include <QPainter>
#include <QPixmap>
#include <QBitmap>
#include "photoitem.h"

PhotoItem::PhotoItem(QDeclarativeItem *parent)
    : QDeclarativeItem(parent), m_zoom(1), m_xOffset(-1), m_yOffset(-1)
{
    // need to disable this flag to draw inside a QDeclarativeItem
    setFlag(QGraphicsItem::ItemHasNoContents, false);
    setSmooth(true);
}

QString PhotoItem::source() const
{
    return m_source;
}

void PhotoItem::setSource(const QString &source)
{
    m_source = source;
}

QColor PhotoItem::color() const
{
    return m_color;
}

void PhotoItem::setColor(const QColor &color)
{
    m_color = color;
}

float PhotoItem::zoom() const
{
    return m_zoom;
}

void PhotoItem::setZoom(const float zoom)
{
    m_zoom = zoom;
}

int PhotoItem::xOffset() const
{
    return m_xOffset;
}

void PhotoItem::setXOffset(const int offset)
{
    m_xOffset = offset;
}

int PhotoItem::yOffset() const
{
    return m_yOffset;
}

void PhotoItem::setYOffset(const int offset)
{
    m_yOffset = offset;
}

void PhotoItem::repaint()
{
    update();
}
