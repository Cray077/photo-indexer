#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <stdexcept>
#include <headers\search.h>

int main(int argc, char *argv[])
{
    

    QQuickStyle::setStyle("Basic");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    SearchEngine search;
    search.searchPictures("C:\\Users\\Beta Tester\\personal-projects\\photo-indexer\\pictures");
    engine.rootContext()->setContextProperty(
        "searchEngine",
        &search
    );


    const QUrl url(u"qrc:/QtAndroidTemplate/Main.qml"_qs);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []()
        {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );
    
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    
    
    if (engine.rootObjects().isEmpty()) {
        throw std::runtime_error("Failed to start application");
    }


    return app.exec();
}
