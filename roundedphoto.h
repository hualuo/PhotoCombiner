
#ifndef Image_H
#define Image_H

#include "photoitem.h"

class RoundedPhoto : public PhotoItem
{
    Q_OBJECT
    Q_PROPERTY(int radius READ radius WRITE setRadius)

public:
    RoundedPhoto(QDeclarativeItem *parent = 0);

    int radius() const;
    void setRadius(const int radius);

    QPixmap getPhoto(float scale);

    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget = 0);

public slots:
    void loadImage();
    void createPixmap(bool needUpdate = false);

private:
    int m_radius;
};

#endif

