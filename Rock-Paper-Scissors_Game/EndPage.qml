import QtQuick
import QtQuick.Controls

Item {
    id: endPage
    width: 360
    height: 640

    Rectangle {
        anchors.fill: parent
        color: "#3e5a79"
    }

    Label {
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        text: "Good Game!"
        font.bold: true
        font.pointSize: 25
    }

    Image {
        anchors.centerIn: parent
        width: 200
        height: 200
        antialiasing: true
        source: "qrc:/images/win.png"
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        text: "Win:: " + winCount + " | " + lossCount + " ::Loss"
        font.bold: true
        font.pointSize: 25
    }
}
