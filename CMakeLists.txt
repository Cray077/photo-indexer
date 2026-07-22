cmake_minimum_required(VERSION 3.16)

project(QtAndroidTemplate VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Require Qt 6.9.3 specifically
find_package(Qt6 6.9.3 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQtAndroidTemplate
    main.cpp
)

qt_add_qml_module(appQtAndroidTemplate
    URI QtAndroidTemplate
    VERSION 1.0
    QML_FILES
        Main.qml
        components/LeftNavigation.qml
        components/SearchBar.qml
        components/CategorySection.qml
        components/RecentPhotosSection.qml
)

# Properties for Android and other platforms
set_target_properties(appQtAndroidTemplate PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtAndroidTemplate
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQtAndroidTemplate
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
