
#ifndef PHOTOITEM_H
#define PHOTOITEM_H

#include <QDeclarativeItem>
#include <QColor>

class QPixmap;

class PhotoItem : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource)
    Q_PROPERTY(QColor color READ color WRITE setColor)
    Q_PROPERTY(float zoom READ zoom WRITE setZoom)
    Q_PROPERTY(int xOffset READ xOffset WRITE setXOffset)
    Q_PROPERTY(int yOffset READ yOffset WRITE setYOffset)

public:
    PhotoItem(QDeclarativeItem *parent = 0);

    QString source() const;
    void setSource(const QString &source);

    QColor color() const;
    void setColor(const QColor &color);

    float zoom() const;
    void setZoom(const float zoom);

    int xOffset() const;
    void setXOffset(const int offset);

    int yOffset() const;
    void setYOffset(const int offset);

    virtual QPixmap getPhoto(float scale) = 0;

public slots:
    void repaint();
    //virtual void loadImage() = 0;
//    virtual QPixmap& createPixmap(bool needUpdate = false) = 0;

protected:
    QString m_source;
    QColor m_color;
    float m_zoom;
    int m_xOffset;
    int m_yOffset;
    QPixmap m_buffer;
    QPixmap m_photo;
};

#endif

