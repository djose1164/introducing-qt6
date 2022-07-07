import QtQuick
import QtQuick.Controls

Window {
    width: 360
    height: 640
    visible: true
    title: "Rock-Paper-Scissors"

    property int winCount: 0
    property int lossCount: 0

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        interactive: false

        HomePage {
            id: homePage
        }

        GamePage {
            id: gamePage
        }

        EndPage {
            id: endPage
        }
    }
}
