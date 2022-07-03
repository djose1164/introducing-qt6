import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 360
    height: 720
    visible: true
    title: "Task Manager"

    StackView {
        id: contentFrame
        anchors.fill: parent
        initialItem: "qrc:/Load_Page.qml"
    }

    Component.onCompleted:
        contentFrame.replace("qrc:/Main_Page.qml")
}
