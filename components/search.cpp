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

void SearchEngine::searchPictures(const QString &path) {
    qDebug() << "executed" << __PRETTY_FUNCTION__ ;
    QDir directory(path);

    const QFileInfoList files = directory.entryInfoList(
        imageFilters,
        QDir::Files
    );


    QVariantList pictures;

    for(const QFileInfo &fileInfo : files) {
        QVariantMap picture;
        // const QUrl fileUrl = QUrl::fromLocalFile(fileInfo.absoluteFilePath());
        picture["fileName"] = fileInfo.fileName();
        picture["filePath"] = QUrl::fromLocalFile(fileInfo.absoluteFilePath());
        picture["birthDate"] = fileInfo.birthTime().toString();
        qDebug() << "File: " << fileInfo.absoluteFilePath();
        pictures.append(picture);
    }

    setPictures(pictures);
}

QVariantList SearchEngine::getPictures() {
    return m_pictures;
}

void SearchEngine::setPictures(const QVariantList newPictures) {
    if (newPictures == m_pictures) return;
    m_pictures = newPictures;
}

