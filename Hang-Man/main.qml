import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 360
    height: 640
    visible: true
    title: qsTr("Hang-Man")

    StackView {
        id: contentFrame
        anchors.fill: parent
        initialItem: "qrc:/Main/Load_Page.qml"
    }

   Component.onCompleted:
       contentFrame.replace("qrc:/Main/Main_Page.qml")
}
