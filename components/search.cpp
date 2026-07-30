#include "headers/search.h"

SearchEngine::SearchEngine(QObject *parent) : QObject(parent)
{
}

SearchEngine::~SearchEngine()
{
}

QString SearchEngine::searchDir(const QDir dir) {
    qDebug() << "executed" << __PRETTY_FUNCTION__ ;
    QDirIterator it(dir.path(), QDir::NoFilter, QDirIterator::Subdirectories);

    while(it.hasNext()) {
        QFile file(it.next());
        qDebug() << file.fileName();
    }
    return "";
}

QVariantList SearchEngine::searchPictures(const QString &path) {
    qDebug() << "executed" << __PRETTY_FUNCTION__ ;
    QDir directory(path);

    const QFileInfoList files = directory.entryInfoList(
        imageFilters,
        QDir::Files
    );

    QVariantList pictures;

    for(const QFileInfo &fileInfo : files) {
        const QUrl fileUrl = QUrl::fromLocalFile(fileInfo.absoluteFilePath());
        qDebug() << "File: " << fileInfo.absoluteFilePath();
        pictures.append(fileUrl.toString());
    }

    return pictures;
}

