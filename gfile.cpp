#include "gfile.h"

#include <QDebug>
#include <QFile>
#include <QFileInfo>
#include <QTextStream>
GFile::GFile(QObject *parent) :
    QObject(parent)
{

}

QString GFile::read()
{
    QString content;
    QFile file(m_source);
    if ( file.open(QIODevice::ReadOnly) ) {
        content = file.readAll();
        file.close();
    }

    return content;
}

bool GFile::write(const QString& data)
{
    QFile file(m_source);
    if ( file.open(QFile::WriteOnly) ) {
        QTextStream out(&file);
           out<<data;
        file.close();
        return true;
    }
    else {
        return false;
    }
}


bool GFile::is(const QString &source)
{
    QFileInfo file(source);
    return file.isFile();
}

void GFile::create(const QString &source)
{
    QDir qDir=source;
    qDir.mkdir(source);
}

QString GFile::getUser()
{
    return QDir::home().dirName();
}

void GFile::restart()
{
    program.start("./start.bat");
    program.waitForFinished();
    exit(0);
}
