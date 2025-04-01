#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include<gfile.h>
int main(int argc, char *argv[])
{

    //qreal a=EnumDisplaySettings(0, ENUM_CURRENT_SETTINGS, &NewDevMode).dmPelsWidth/GetSystemMetrics(SM_CXSCREEN);
    qputenv("QT_SCALE_FACTOR", "1.0");

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<GFile>("GFile",1,2,"GFile");
    const QUrl url(QStringLiteral("qrc:/Main.qml"));
    app.setWindowIcon(QIcon(":/images/images/icon.png"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
