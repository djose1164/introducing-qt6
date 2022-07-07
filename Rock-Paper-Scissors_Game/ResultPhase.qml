import QtQuick
import QtQuick.Controls

Item {

    Label {
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Click the Icon"
        font.bold: true
        font.pointSize: 15
        color: "white"
    }

    MouseArea {
        anchors.centerIn: parent
        width: 100
        height: 100
        onClicked: {
            gameFrame.setCurrentIndex(0)
            resetAllProperties()
        }

        Image {
            anchors.fill: parent
            antialiasing: true
            source: getImage()
            onSourceChanged:
                resultTimer.start()
        }
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        text: "Win:: "+ winCount +" | "+ lossCount+" ::Loss"
        font.pointSize: 25
        font.bold: true
    }

    Timer {
        id: resultTimer
        interval: 10000
        repeat: false
        running: false
        onTriggered: {
            gameFrame.setCurrentIndex(0)
            resetAllProperties()
        }
    }

    /* ---------- Functions --------- */

    /*
        Get path to image.
    */
    function getImage()
    {
        switch (winState)
        {
        case 0:
            return "qrc:/images/draw.png";

        case 1:
            return "qrc:/images/win.png";

        case 2:
            return "qrc:/images/loss.png";

        default:
            console.log("## Error at getImage()");
            break;
        }
    }
}
