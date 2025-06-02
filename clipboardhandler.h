#include <QObject>
#include <QGuiApplication>
#include <QClipboard>

class ClipboardHandler : public QObject {
    Q_OBJECT
public:
    explicit ClipboardHandler(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void copyText(const QString &text) {
        QGuiApplication::clipboard()->setText(text);
    }

    Q_INVOKABLE QString pasteText() {
        return QGuiApplication::clipboard()->text();
    }
};
