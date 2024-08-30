#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include<gfile.h>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<GFile>("GFile",1,2,"GFile");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    app.setWindowIcon(QIcon(":/images/images/icon.png"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
