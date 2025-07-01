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

    // Replace power: a^b → Math.pow(a, b)
    static const QRegularExpression powerRegex("(\\([^\\)]+\\)|-?\\d+(\\.\\d+)?)\\s*\\^\\s*(\\([^\\)]+\\)|-?\\d+(\\.\\d+)?)");
    expr.replace(powerRegex, "Math.pow(\\1, \\3)");

    // Replace sin(x) → Math.sin(x)
    static const QRegularExpression sinRegex("sin\\(([^)]+)\\)");
    expr.replace(sinRegex, "Math.sin(\\1)");

    // Replace cos(x) → Math.cos(x)
    static const QRegularExpression cosRegex("cos\\(([^)]+)\\)");
    expr.replace(cosRegex, "Math.cos(\\1)");

    // Replace tan(x) → Math.tan(x)
    static const QRegularExpression tanRegex("tan\\(([^)]+)\\)");
    expr.replace(tanRegex, "Math.tan(\\1)");


    // Prevent division by zero
    static const QRegularExpression divZeroRegex("/\\s*0(?!\\d)");
    if (expr.contains(divZeroRegex)) {
        return "Cannot divide by zero";
    }

    QJSEngine engine;
    QJSValue result = engine.evaluate(expr);

    if (result.isError()) {
        return "Error";
    }

    return result.toString();
}

