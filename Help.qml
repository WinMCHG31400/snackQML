import QtQuick

Window {//帮助窗口
    visible:false
    id:help
    width: 800
    height:400
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width
    title: $enMode?"SnackQML Help":"SnackQML帮助"

    Image {
        anchors.fill: parent;
        source: $enMode?"./images./help_en.png":"./images/help.png"
    }
}
