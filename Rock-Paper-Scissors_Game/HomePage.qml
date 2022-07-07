import QtQuick
import QtQuick.Controls

Item {
    id: homePage
    width: 360
    height: 640

    Rectangle {
        anchors.fill: parent
        color: "#3e5a79"
    }

    RoundButton {
        id: startGameBtn
        anchors.centerIn: parent
        width: 200
        height: 200
        radius: 99
        text: "Start Game"
        background: Rectangle {
            anchors.fill: parent
            radius: 99
            color: "#fd7e35"
            border.width: 1
        }
        onClicked:
            swipeView.setCurrentIndex(gamePage.SwipeView.index)
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        font.bold: true
        text: "Win:: " + winCount + " | " + lossCount + " ::Loss"
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 100
        text: "Rock-Paper-Scissors"
        color: "white"
        font.pointSize: 25
        font.bold: true
    }
}
