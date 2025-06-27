#include "calculator.h"
#include <QJSEngine>
#include <QRegularExpression>


Calculator::Calculator(QObject *parent) : QObject(parent) {}

QString Calculator::calculate(const QString &expression)
{
    QString expr = expression;

    static const QRegularExpression sqrtRegex("√(\\d+(\\.\\d+)?)");
    expr.replace(sqrtRegex, "Math.sqrt(\\1)");

    QJSEngine engine;
    QJSValue result = engine.evaluate(expr);

    if (result.isError()) {
        return "Error";
    }

    return result.toString();
}

