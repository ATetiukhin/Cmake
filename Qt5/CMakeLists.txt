set(APP_NAME test_qt5)

set(ALL_FILES test_qt5.cpp)

############################################################################################

# Qt
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(QT_COMPONENTS
    AxBase
    AxContainer
    AxServer
    Bluetooth
    Concurrent
    Core
    Declarative
    Designer
    Gui
    Help
    LinguistTools
    Location
    Multimedia
    MultimediaWidgets
    Network
    Nfc
    OpenGL
    OpenGLExtensions
    Positioning
    PrintSupport
    Qml
    Quick
    QuickTest
    QuickWidgets
    Script
    ScriptTools
    Sensors
    SerialPort
    Sql
    Svg
    Test
    UiTools
    WebChannel
    WebEngine
    WebEngineCore
    WebEngineWidgets
    WebKit
    WebKitWidgets
    WebSockets
    WebView
    Widgets
    WinExtras
    Xml
    XmlPatterns
    )

find_package(Qt5 5.4 COMPONENTS ${QT_COMPONENTS} QUIET REQUIRED)
add_definitions(${Qt5_DEFINITIONS})

############################################################################################

add_executable(${APP_NAME} WIN32 ${ALL_FILES})
target_link_libraries(${APP_NAME} Qt5::Widgets)

############################################################################################

# Project settings
if (MSVC)
    set(CMAKE_CXX_FLAGS "/EHsc /W3 /nologo" CACHE STRING "" FORCE)

    set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /MDd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_CXX_FLAGS_MINSIZEREL     "/MD /O1 /Ob1 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE        "/MD /O2 /Ob2 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MD /Zi /O2 /Ob1 /D NDEBUG")

    set_target_properties(${APP_NAME} PROPERTIES LINK_FLAGS " /DYNAMICBASE:NO /FIXED")

elseif (CMAKE_COMPILER_IS_GNUCXX)
    # Setting directory
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIRECTORY} CACHE STRING "" FORCE)

    # Compiler flags
    set(CMAKE_CXX_FLAGS " -std=c++11 -Wall " CACHE STRING "" FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG " -g -Os " CACHE STRING "" FORCE)
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "" FORCE)

    # Linker flags
    set(CMAKE_EXE_LINKER_FLAGS " -static-libgcc -static-libstdc++ -static " CACHE STRING "" FORCE)
    set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "" CACHE STRING "" FORCE) # remove dynamic for CXX
    set(BUILD_SHARED_LIBS OFF)
endif (MSVC)

############################################################################################
