import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage
import "Database.js" as JS

Item {
    id: homePage
    width: 360
    height: 640

    Rectangle {
        anchors.fill: parent
        color: "#3e5a79"
    }

    component MyRoundButton: RoundButton {
        font.bold: true
        background: Rectangle {
            anchors.fill: parent
            radius: 99
            color: "#fd7e35"
            border.width: 1
        }
    }

    MyRoundButton {
        id: startGameBtn
        anchors.centerIn: parent
        width: 200
        height: 200
        text: "Start Game"
        font.pointSize: 20
        onClicked:
            swipeView.setCurrentIndex(gamePage.SwipeView.index)
    }

    MyRoundButton {
        id: resetGameBtn
        anchors.top: startGameBtn.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: startGameBtn.horizontalCenter
        width: startGameBtn.width/1.5
        height: startGameBtn.height/1.5
        text: "Reset Game"
        font.pointSize: startGameBtn.font.pointSize * .7
        onClicked: {
            resetGame()
            swipeView.setCurrentIndex(gamePage.SwipeView.index)
        }

        function resetGame()
        {
            winCount = 0;
            lossCount = 0
            JS.dbClearAll();
        }
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
