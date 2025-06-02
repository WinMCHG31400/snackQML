#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "gfile.h"
#include "clipboardhandler.h"
#include "metadatahandler.h"
#include <QQuickImageProvider>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    qputenv("QT_SCALE_FACTOR", "1.0");

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    qmlRegisterType<MetaDataHandler>("Metadata", 1, 0, "MetaDataHandler");
    qmlRegisterType<GFile>("GFile",1,2,"GFile");
    qmlRegisterSingletonType<ClipboardHandler>(
        "Clipboard", 1, 0, "Clipboard",
        [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
            Q_UNUSED(engine)
            Q_UNUSED(scriptEngine)
            return new ClipboardHandler();
        }
        );
    const QUrl url(QStringLiteral("./file/main.qml"));
    app.setWindowIcon(QIcon(":/images/images/icon.png"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
