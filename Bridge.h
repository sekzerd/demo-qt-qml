#ifndef CSwitch_H
#define CSwitch_H

#include "AppGlobal.h"
#include <QObject>
#include <QtDebug>

class Bridge : public QObject {
    Q_OBJECT
public:
    Bridge();
    Q_INVOKABLE void call(QString str) {
        qDebug() << "bridge:" << str;
        auto list = G_engine->rootObjects();
        auto window = list.first();
        QVariant res;
        QVariant arg = "bridge data";
        QMetaObject::invokeMethod(window, "func", Q_RETURN_ARG(QVariant, res),
                                  Q_ARG(QVariant, arg));
    }
};

#endif
