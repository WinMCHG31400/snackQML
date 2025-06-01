import QtQuick

Window {//帮助窗口
    visible:false
    id:help
    width: 750
    height:350
    minimumHeight: 350
    maximumHeight: 350
    minimumWidth: 750
    maximumWidth: 750
    title: $enMode?"SnackQML Help":"SnackQML帮助"

    Image {
        anchors.fill: parent;
        source: $enMode?"./images./help_en.png":"./images/help.PNG"
    }
}
