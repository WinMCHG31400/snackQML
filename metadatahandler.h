#include <QObject>
#include <QMediaPlayer>
#include <QAudioOutput>
#include <QImage>
#include <QTemporaryDir>

class MetaDataHandler : public QObject
{
    Q_OBJECT
public:
    explicit MetaDataHandler(QObject *parent = nullptr);
    Q_INVOKABLE void extractCoverArt(const QString &filePath);
    Q_INVOKABLE int getN() const {return n;}

signals:
    void coverArtSaved(const QString &path);
    void errorOccurred(const QString &message);

private slots:
    void handleMediaStatusChanged(QMediaPlayer::MediaStatus status);

private:
    QMediaPlayer *m_player;
    QAudioOutput *m_audioOutput;
    QString m_currentFile;
    int n;
    QString tempPath;
};
