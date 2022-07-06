import QtQuick
import QtQuick.Controls

Item {
    id: gamePage
    width: 360
    height: 640

    property string recColor: "#fe9000"

    Item {
        id: root
        anchors.top: parent.top
        anchors.topMargin: -25
        anchors.horizontalCenter: parent.horizontalCenter
        width: 360
        height: 360

        component MyRectangle: Rectangle
        {
            property var hide: function() {visible = false}
            color: recColor
            visible: false
        }

        MyRectangle {
            id: rec1
            x: 19
            y: 319
            width: 87
            height: 20
        }

        MyRectangle {
            id: rec2
            x: 52
            y: 38
            width: 20
            height: 283
        }

        MyRectangle {
            id: rec3
            x: 52
            y: 38
            width: 189
            height: 20
        }

        MyRectangle {
            id: rec4
            x: 221
            y: 39
            width: 20
            height: 54
        }

        MyRectangle {
            id: rec5
            x: 189
            y: 89
            width: 84
            height: 84
            color: "transparent"
            radius: 99
            border.width: 15
            border.color: recColor
        }

        MyRectangle {
            id: rec6
            x: 221
            y: 168
            width: 20
            height: 91
        }

        MyRectangle {
            id: rec7
            x: 200
            y: 231
            width: 20
            height: 91
            rotation: 210
        }

        MyRectangle {
            id: rec8
            x: 242
            y: 231
            width: 20
            height: 91
            rotation: 150
        }

        MyRectangle {
            id: rec9
            x: 252
            y: 170
            width: 20
            height: 91
            rotation: 130
        }

        MyRectangle {
            id: rec10
            x: 190
            y: 170
            width: 20
            height: 91
            rotation: 230
        }
    }

    ListView {
        id: listViewLetterCount
        width: parent.width
        height: 50
        orientation: ListView.Horizontal
        anchors.bottom: parent.bottom
        anchors.bottomMargin: inputGrid.height + 20
        interactive: false
        model: listModelCount
        delegate: Item {
            width: 50
            height: parent.width/10

            Rectangle{
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-10
                height: 4
                color: "white"
            }
        } // delegate: Item
    }

    ListView {
        id: listViewWord
        width: parent.width
        height: 50
        orientation: ListView.Horizontal
        anchors.bottom: parent.bottom
        anchors.bottomMargin: inputGrid.height + 35
        interactive: false
        model: ListModel {
            id: wordOutputModel
        }

        delegate: Item {
            width: 50
            height: listViewWord.width/10

            Label {
                anchors.centerIn: parent
                font.pointSize: 25
                font.bold: true
                color: "white"
                text: letter
            }
        }
    }

    Input_Grid {
        id: inputGrid
    }
}
