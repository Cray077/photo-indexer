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

public:
    explicit SearchEngine(QObject *parent = nullptr);
    ~SearchEngine();

    QString searchDir(const QDir dir);
    Q_INVOKABLE QVariantList searchPictures(const QString &path);
};


