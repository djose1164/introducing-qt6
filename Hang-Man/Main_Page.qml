import QtQuick
import QtQuick.Controls
import "qrc:/Game_Page"

Item {
    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"
    }

    property int hangManCounter: 0
    property string currentWord: ""
    property int wordCount: 0

    SwipeView {
        id: swipeView
        anchors.fill: parent
        interactive: false

        ListModel {
            id: listModelCount
        }

        ListModel {
            id: wordModel

            ListElement {
                word: "TREE"
            }

            ListElement {
                word: "APPLE"
            }
        }

        Item {
            id: welcomePage
            width: 360
            height: 640

            Label {
                id: gameTitle
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 50
                text: "Hang-Man"
                color: "white"
                font.pointSize: 50
            }

            RoundButton {
                id: startGameButton
                anchors.centerIn: parent
                width: 200
                height: 200
                text: "START"
                font.bold: true
                font.pointSize: 38
                background: Rectangle {
                    anchors.fill: parent
                    radius: 99
                    color: "#fe9000"
                    border.width: 2
                    border.color: "black"
                }

                onClicked: {
                    currentWord = wordModel.get(Math.floor(Math.random()
                                                            * wordModel.count)).word
                    wordCount = currentWord.length
                    for (let i = 1; i <= wordCount; i++)
                        listModelCount.append({"space": "-"})
                    console.log(currentWord)
                    console.log("wordCount:", wordCount)
                    console.log(listModelCount.get(listModelCount.count-1).yo)
                    swipeView.setCurrentIndex(1)
                }
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                text: "Made By Daniel Victoriano"
                color: "white"
                font.pointSize: 15
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                text: "User Agreement other Legal Stuff"
                color: "white"
                font.pointSize: 8

                TapHandler {
                    onTapped: {
                        // Link
                    }
                }
            }
        }

        Game_Page {
            id: gamePage
        }

        Item {
            id: endPage
            width: 360
            height: 640

            Label {
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Player"
                font.pointSize: 50
                font.bold: true
                color: "white"
            }

            Label {
                id: winLossLabel
                anchors.top: parent.top
                anchors.topMargin: 150
                anchors.horizontalCenter: parent.horizontalCenter
                text: ""
                font.pointSize: 50
                font.bold: true
                color: "#fe9000"
            }

            Label {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 150
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Want To"
                font.pointSize: 30
                font.bold: true
                color: "white"
            }

            Label {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100
                anchors.horizontalCenter: parent.horizontalCenter
                text: "TRY"
                font.pointSize: 20
                font.bold: true
                color: "#fe9000"
            }

            RoundButton {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40
                text: "AGAIN"
                font.bold: true
                font.pointSize: 30
                background: Rectangle {
                    anchors.fill: parent
                    radius: 99
                    color: "#fe9000"
                }
                onClicked:
                    swipeView.setCurrentIndex(0)
            }
        }

    }
}
