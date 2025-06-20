#include "calculator.h"
#include <QJSEngine>


Calculator::Calculator(QObject *parent) : QObject(parent) {}

QString Calculator::calculate(const QString &expression)
{
    QJSEngine engine;
    QJSValue result = engine.evaluate(expression);
    if (result.isError()) {
        return "Error";
    }
    return result.toString();
}
