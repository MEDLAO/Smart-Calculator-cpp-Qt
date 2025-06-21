#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>         // Needed to expose C++ to QML
#include "calculator.h"        // The custom C++ logic class


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Create Calculator object
    Calculator calculator;

    // Expose it to QML as 'calculator'
    engine.rootContext()->setContextProperty("calculator", &calculator);

    // Load the QML file (adjust if needed)
    engine.loadFromModule("SmartCalculator", "Main");

    // Handle QML load failure
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    return app.exec();
}
