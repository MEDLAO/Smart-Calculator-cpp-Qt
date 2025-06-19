#include "calculator.h"

Calculator::Calculator(QObject *parent) : QObject(parent)
{
}

QString Calculator::calculate(const QString &expression)
{
    // Very basic implementation: handles only +, -, *, /
    // You can later extend this safely with a math parser
    double result = 0.0;
    QString expr = expression;
    expr.replace(" ", "");  // Remove spaces

    // Use a basic parser, or for now just simulate returning something
    // Here we just return the expression as-is for testing
    return "Result: " + expr;
}
