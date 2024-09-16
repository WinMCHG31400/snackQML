import QtQuick

Item{//退出确认界面
    id:quit
    z:2147483647
    Image{
        source: "qrc:/images/images/pause.png"
    }
    Rectangle{
        color: "#E8E8E8"
        x:290
        y:260
        width:260
        height: 80
        Rectangle{//退出按钮
            id:exit
            x:20
            y:20
            z:10
            width: 100
            height: 40
            color: "#FFFFFF"
            opacity: 0.5
            Text {
                id:exit_t
                anchors.centerIn: parent
                font.pixelSize: 30
                font.bold: true
                text: qsTr("退出")
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                            Qt.quit()
                    }
                }
            }
        }
/*        Rectangle{//主菜单按钮
            id:bu_item_mian
            x:140
            y:20
            z:10
            width: 100
            height: 40
            color: "#FFFFFF"
            opacity: 0.5
            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                font.bold: true
                text: qsTr("主菜单")
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        if(quit.opacity==1)
                        {
                            console.log("1")
                            start_timer5.running=true
                        }
                    }
                }
            }
        }*/
        Rectangle{//取消按钮
            id:cans
            x:140
            y:20
            z:10
            width: 100
            height: 40
            color: "#FFFFFF"
            opacity: 0.5
            Text {
                id:cnas_t
                anchors.centerIn: parent
                font.pixelSize: 30
                font.bold: true
                text: qsTr("取消")
                function cancle(){
                    item.pause_()
                    press_su.play_()
                }
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        if(pause_i.opacity==1)
                            cnas_t.cancle()
                    }
                }
            }
        }
    }
}
