#include "calculator.h"
#include <QJSEngine>
#include <QRegularExpression>


Calculator::Calculator(QObject *parent) : QObject(parent) {}

QString Calculator::calculate(const QString &expression)
{
    QString expr = expression;

    // √number → Math.sqrt(number)
    static const QRegularExpression sqrtRegex("√(\\d+(\\.\\d+)?)");
    expr.replace(sqrtRegex, "Math.sqrt(\\1)");

    // number% → (number / 100)
    static const QRegularExpression percentRegex("(\\d+(\\.\\d+)?)%");
    expr.replace(percentRegex, "(\\1 / 100)");


    QJSEngine engine;
    QJSValue result = engine.evaluate(expr);

    if (result.isError()) {
        return "Error";
    }

    return result.toString();
}

