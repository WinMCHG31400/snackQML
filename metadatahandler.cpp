#include "metadatahandler.h"
#include <QMediaMetaData>
#include <QFileInfo>

MetaDataHandler::MetaDataHandler(QObject *parent)
    : QObject(parent)
{
    m_player = new QMediaPlayer(this);
    m_audioOutput = new QAudioOutput(this);
    m_player->setAudioOutput(m_audioOutput);
    m_audioOutput->setVolume(0); // 静音播放

    connect(m_player, &QMediaPlayer::mediaStatusChanged,
            this, &MetaDataHandler::handleMediaStatusChanged);
}

void MetaDataHandler::extractCoverArt(const QString &filePath)
{
    m_currentFile = filePath;
    m_player->setSource(QUrl::fromLocalFile(filePath));
}

void MetaDataHandler::handleMediaStatusChanged(QMediaPlayer::MediaStatus status)
{
    if (status != QMediaPlayer::LoadedMedia) return;

    // 获取封面数据
    QVariant coverData = m_player->metaData().value(QMediaMetaData::CoverArtImage);
    if (coverData.isNull()) {
        coverData = m_player->metaData().value(QMediaMetaData::ThumbnailImage);
    }
    if (coverData.isNull()) {
        emit errorOccurred("未找到封面数据");
        return;
    }

    QImage coverImage = coverData.value<QImage>();
    if (coverImage.isNull()) {
        emit errorOccurred("封面数据格式无效");
        return;
    }
    if(n>0)
        QFile::remove(tempPath);
    // 生成临时文件名
    n++;
    tempPath = "./file/temp/cover";
    tempPath+=QString::number(n);
    tempPath+=".jpg";
    if (!coverImage.save(tempPath, "JPG")) {
        emit errorOccurred("封面保存失败");
        return;
    }

    emit coverArtSaved(tempPath);
}
