
#ifndef POLYGONPHOTO_H
#define POLYGONPHOTO_H

#include "photoitem.h"

class Point : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int x READ x WRITE setX)
    Q_PROPERTY(int y READ y WRITE setY)

public:
    Point(QObject *parent = 0);

    int x() const;
    void setX(int x);

    int y() const;
    void setY(int y);

private:
    int m_x;
    int m_y;
};

class PolygonPhoto : public PhotoItem
{
    Q_OBJECT
    Q_PROPERTY(QDeclarativeListProperty<Point> points READ points)

public:
    PolygonPhoto(QDeclarativeItem *parent = 0);

    QPixmap getPhoto(float scale);

    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget = 0);

    QDeclarativeListProperty<Point> points();

public slots:
    void loadImage();
    void createPixmap(bool needUpdate = false);

private:
    static void append_point(QDeclarativeListProperty<Point> *list, Point *point);

private:
    QList<Point *> m_points;
};

#endif

