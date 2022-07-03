import QtQuick
import QtQuick.Controls

Drawer {
    id: addTask_Drawer
    width: parent.width
    height: parent.height/2
    edge: Qt.BottomEdge
    background: Rectangle {
        anchors.fill: parent
        color: "#2C3E50"
    }

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        text: "Add new"
        color: "white"
    }

    TextField {
        id: titelInput
        placeholderText: "Your Task"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
    }

    Item {
        width: titelInput.width
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 125

        TextField {
            id: dateInput
            height: parent.height
            width: parent.width/2.5
            anchors.left: parent.left
            placeholderText: "0000-00-00"
        }

        TextField {
            id: timeInput
            height: parent.height
            width: parent.width/3
            anchors.right: parent.right
            placeholderText: "00:00"
        }

        RoundButton {
            id: submitButton
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 190
            text: "Submit"
            width: 200
            onClicked: {
                if (dateInput.text !== "" && timeInput.text !== ""
                    && titelInput.text !== "")
                    myListModel.append({"titelText": titelInput.text,
                                       "dateText": dateInput.text + "|"
                                       + timeInput.text})
                titelInput.clear()
                dateInput.clear()
                timeInput.clear()
                addTaskDrawer.close()
            }
        }
    }
}
