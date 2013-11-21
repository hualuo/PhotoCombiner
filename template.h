
#ifndef TEMPLATE_H
#define TEMPLATE_H

#include <QDeclarativeItem>
#include <QColor>

class QPixmap;

class Template : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor)
    Q_PROPERTY(QString source READ source WRITE setSource)

public:
    Template(QDeclarativeItem *parent = 0);

    QColor color() const;
    void setColor(const QColor &color);

    QString source() const;
    void setSource(const QString &source);


    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget = 0);

public slots:
    void createPixmap();
    void saveImage(float scale = 1);

private:
    QColor m_color;
    QString m_source;
    QPixmap m_photo;
};

#endif

