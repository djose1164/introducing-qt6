import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage
import "Database.js" as JS

Item {
    RoundButton {
        width: 200
        height: 200
        anchors.centerIn: parent
        onClicked: {
            swipeView.setCurrentIndex(endPage.SwipeView.index)
            saveResultsToDatabase()
        }
        background: Rectangle {
            anchors.fill: parent
            radius: 99
            color: "#fd7e35"
        }
        text: "Stop Game"
        font.bold: true
        font.pointSize: 20
    }

    ListView {
        id: optionListView
        width: parent.width
        height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        orientation: ListView.Horizontal
        model: ListModel {
            id: optionModel

            ListElement {
                img: "qrc:/images/rock.png"
                value: "rock"
            }

            ListElement {
                img: "qrc:/images/paper.png"
                value: "paper"
            }

            ListElement {
                img: "qrc:/images/scissor.png"
                value: "scissors"
            }
        }

        delegate: Item {
            width: optionListView.width/3
            height: optionListView.height

            MouseArea {
                anchors.centerIn: parent
                width: 50
                height: 50
                onClicked: {
                    console.log("Player: " + value)
                    gameFrame.setCurrentIndex(1)
                    playerOption = value
                    botOption = optionModel.get(
                                    Math.floor(Math.random()
                                               * optionModel.count
                                )).value
                    console.log("Bot: " + botOption)
                    winCheck()
                }
            }

            Image {
                anchors.fill: parent
                antialiasing: true
                source: img
            }
        }
    } // ListView

    Component.onCompleted:
        JS.dbInit()

/* ------------------------------- Functions ------------------------------- */

    /*
      Handle wether the player or bot has won.
    */
    function winCheck()
    {
        if (playerOption === botOption)
        {
            winState = 0;
            return;
        }

        /*
          Update status for player victory.
        */
        function playerWon()
        {
            ++winCount;
            winState = 1;
        }

        /*
          Update status for bot victory.
        */
        function botWon()
        {
            ++lossCount;
            winState = 2;
        }

        switch (playerOption)
        {
        case "rock":
            if (botOption === "scissors")
                playerWon();
            else if (botOption === "paper")
                botWon();
            break;

        case "paper":
            if ( botOption === "scissors")
                botWon();
            else if (botOption === "rock")
                playerWon();
            break;

        case "scissors":
            if (botOption === "paper")
                playerWon()
            else if (botOption === "rock")
                botWon();
            break;
        }

        console.log("winState: " + winState)
        console.log(`## Switch:\n\twinCount: ${winCount} lossCount: ${lossCount}`);
        saveResultsToDatabase();
        gameFrame.setCurrentIndex(1);
    }

}
