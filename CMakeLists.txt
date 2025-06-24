cmake_minimum_required(VERSION 3.16)

project(SmartCalculator VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.2)

qt_add_executable(appSmartCalculator
    main.cpp
    calculator.cpp
    calculator.h
)

qt_add_qml_module(appSmartCalculator
    URI SmartCalculator
    VERSION 1.0
    QML_FILES
         qml/Main.qml

)

qt_add_resources(appSmartCalculator "qml_resources"
    PREFIX "/qml"
    FILES qml/Main.qml
)


set_target_properties(appSmartCalculator PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSmartCalculator
    PRIVATE Qt6::Quick
)

install(TARGETS appSmartCalculator
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
