import QtQuick
import QtQuick.Controls

Item {
    id: gamePage
    width: 360
    height: 640

    property string playerOption: ""
    property string botOption: ""
    property int winState: 0 // 0=draw; 1=player win; 2=player loss

    Rectangle {
        anchors.fill: parent
        color: "#3e5a79"
    }

    SwipeView {
        id: gameFrame
        anchors.fill: parent
        currentIndex: 0
        interactive: false

        PlayerPhase {
            id: playerPhase
            width: 360
            height: 640
        }

        ResultPhase {
            id: resultPhase
            width: 360
            height: 640
        }
    }
}
