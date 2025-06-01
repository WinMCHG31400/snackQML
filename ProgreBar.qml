import QtQuick

Rectangle {
    id: back
    width: 300
    height: 20
    border.width: 1
    border.color: "#80808080"
    property double percent: 0
    property color subColor:"#4096ff"
    Rectangle {
        id: front
        x:1
        y:1
        width: percent * (parent.width-2)
        height: parent.height-2
        color: subColor
    }
}
