import QtQuick

Window {//帮助窗口
    visible:false
    id:help
    width: 570
    height:330
    title: "SnackQML帮助"
    onWidthChanged: {
        help.width=570
    }
    onHeightChanged: {
        help.height=330
    }

    Image {
        anchors.fill: parent;
        source: "qrc:/images/images/help.PNG"
    }
}
