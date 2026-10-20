#include <QDir>
#include <QDirIterator>
#include <QObject>
#include <QString>
#include <QUrl>


class SearchEngine : public QObject
{
    Q_OBJECT

private:
    /* data */
    const QStringList imageFilters = {
        "*.jpg",
        "*.jpeg",
        "*.png",
        "*.webp",
        "*.bmp",
        "*.gif",
        "*.tif",
        "*.tiff"
    };
    QVariantList m_pictures;

public:
    explicit SearchEngine(QObject *parent = nullptr);
    ~SearchEngine();

    QString searchDir(const QDir dir);
    Q_INVOKABLE void searchPictures(const QString &path);
    Q_INVOKABLE QVariantList getPictures();
    void setPictures(const QVariantList newPictures);
};


