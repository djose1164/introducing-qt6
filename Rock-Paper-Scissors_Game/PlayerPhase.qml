import QtQuick
import QtQuick.Controls

Item {
    anchors.fill: parent

    RoundButton {
        width: 200
        height: 200
        anchors.centerIn: parent
        onClicked:
            swipeView.setCurrentIndex(endPage.SwipeView.index)
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
            width: parent.width/3
            height: parent.height

            MouseArea {
                anchors.centerIn: parent
                width: 50
                height: 50
                onClicked: {
                    console.log(value)
                    gameFrame.setCurrentIndex(1)
                    playerOption = value
                    botOption = optionModel.get(
                                    Math.floor(Math.random()
                                               * optionModel.count
                                ))
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

    function winCheck()
    {
        switch (playerOption)
        {
        case "rock":
            if (botOption.value === "scissors")
                ++winCount;
            else if (botOption.value === "paper")
                ++lossCount;
            break;

        case "paper":
            if (botOption.value === "scissors")
                ++lossCount;
            else if (botOption.value === "rock")
                ++winCount;
            break;

        case "scissors":
            if (botOption.value === "paper")
                ++winCount
            else if (botOption.value === "rock")
                ++lossCout;
            break;

        default: // playerOption === botOption.value
            winState = 0
            break;
        }

        console.log("winState: " + winState)
        gameFrame.setCurrentIndex(1)
    }
}
