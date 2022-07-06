import QtQuick
import QtQuick.Controls

GridView {
    id: inputGrid
    width: parent.width
    height: parent.height/3
    anchors.bottom: parent.bottom
    cellWidth: 50
    cellHeight: 50

    property var uploadAlphabet: function() {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        for (const letter of alphabet) {
            listModel.append({"letter": letter.toUpperCase()})
            console.log(letter)
        }
    }

    model: ListModel {
        id: listModel
        Component.onCompleted: {
            uploadAlphabet()
        }
    }

    delegate: Item {
        width: 50
        height: width

        TapHandler {
            onTapped: {
                borderRec.border.width = 1
                if (currentWord.match(letter))
                {
                    console.log("Yes Letter: '" + letter + "' is in the word");
                    let index = currentWord.indexOf(letter);
                    console.log("Index at: " + index);
                    wordOutputModel.insert(index, {"letter": letter});
                }
                else
                {
                    console.log("No Letter: '" + letter + "' is in the word");
                    hangManCounter++;
                    buildHangMan();
                }
                winCheck();
            }
        }

        Rectangle {
            id: borderRec
            anchors.fill: parent
            color: "transparent"
            border.width: 0
            border.color: "white"

            Label {
                anchors.centerIn: parent
                text: letter
                font.pointSize: 20
                font.bold: true
                color: "white"
            }
        }
    }

    function winCheck()
    {
        function changeView()
        {
            /*let recs = [rec1, rec2, rec3, rec4, rec5, rec6, rec7, rec8, rec9, rec10]*/

            rec1.hide()
            rec2.hide()
            rec3.hide()
            rec4.hide()
            rec5.hide()
            rec6.hide()
            rec7.hide()
            rec8.hide()
            rec9.hide()
            rec10.hide()

            hangManCounter = 0

            listModel.clear()
            uploadAlphabet()

            wordOutputModel.clear()
            listModelCount.clear()

            swipeView.setCurrentIndex(2)
        }

        if (wordOutputModel.count === wordCount)
        {
            // Player has won.
            console.log("Player won");
            winLossLabel.text = "WON"
            changeView();
        }
        else if (hangManCounter === 10)
        {
            console.log("Player lost");
            winLossLabel.text = "LOST"
            winLossLabel.color = "#d23742"
            changeView();
        }
    }

    function buildHangMan()
    {
        switch (hangManCounter)
        {
        case 1:
            rec1.visible = true;
            break;
        case 2:
            rec2.visible = true;
            break;
        case 3:
            rec3.visible = true;
            break;
        case 4:
            rec4.visible = true;
            break;
        case 5:
            rec5.visible = true;
            break;
        case 6:
            rec6.visible = true;
            break;
        case 7:
            rec7.visible = true;
            break;
        case 8:
            rec8.visible = true;
            break;
        case 9:
            rec9.visible = true;
            break;
        case 10:
            rec10.visible = true;
            break;
        default:
            console.log("## Unpected error.")
            break;
        }
    }
}
