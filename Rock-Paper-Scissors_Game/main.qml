import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage
import "Database.js" as JS

ApplicationWindow {
    width: 360
    height: 640
    visible: true
    title: "Rock-Paper-Scissors"

    property int winCount: JS.dbGet("playerWin")
    property int lossCount: JS.dbGet("playerLoss")

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

    Component.onCompleted:
        JS.dbInit()

    /*
        Reset all the properties used in the game.
    */
    function resetAllProperties()
    {
        winState = 0;
        playerOption = "";
        botOption = "";
    }

    /*
      Save the values of the counters to dabase.
    */
    function saveResultsToDatabase()
    {
        JS.dbUpdate("playerWin", winCount)
        JS.dbSet("playerLoss", lossCount)
    }
}
