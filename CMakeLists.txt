cmake_minimum_required(VERSION 3.16)

project(QtAndroidTemplate VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Require Qt 6.9.3 specifically
find_package(Qt6 6.9.3 REQUIRED COMPONENTS Quick Core QuickControls2)

qt_standard_project_setup()

qt_add_executable(indexer
    main.cpp
    components/search.cpp
    headers/search.h
)

qt_add_qml_module(indexer
    URI QtAndroidTemplate
    VERSION 1.0
    QML_FILES
        Main.qml
        pages/LeftNavigation.qml
        pages/SearchBar.qml
        pages/CategorySection.qml
        pages/RecentPhotosSection.qml
)

# Properties for Android and other platforms
set_target_properties(indexer PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
)

target_link_libraries(indexer
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core
    PRIVATE Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS indexer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
