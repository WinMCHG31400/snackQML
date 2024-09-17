import QtQuick
import QtQuick.Controls

Window {
    function setd(){
        a2.position=item.difficulty/400
    }
    function start()
    {
        ma.visible=true
    }

    function allhide(){
        difficulty=200
        high.color="#CDC5BF"
        typical.color="#CDC5BF"
        common.color="#CDC5BF"
        hard.color="#CDC5BF"
    }
    id:sett
    title: "开发者设置"
    minimumHeight: 200
    maximumHeight: 200
    minimumWidth: 300
    maximumWidth: 300
    width: 300
    height: 200
    property int aaa
    property int difficulty
    Text{
        x:10
        y:15
        font.pixelSize: 15
        text:"透明度："
    }

    ScrollBar{
        onPositionChanged: {
            win.opacity=position
            aaa=100*position
            tm.text=aaa
        }
        position: 1
        hoverEnabled: true
        active:hovered || pressed
        orientation:Qt.Horizontal
        width: 180
        height: 30
        stepSize: 0.01
        snapMode: ScrollBar.SnapAlways
        x:70
        y:10
    }

    Text{
        id:tm
        x:250
        y:15
        font.pixelSize: 15
        text:"100"
    }
    Item{
        id:ma
        visible: false
        x:10
        y:40
        Text{
            y:5
            font.pixelSize: 15
            text:"难度："
        }

        ScrollBar{
            id:a2
            onPositionChanged: {
                item.difficulty=position*400+10
                aaa=400*position+10
                tm2.text=aaa
            }
            position: 1
            hoverEnabled: true
            active:hovered || pressed
            orientation:Qt.Horizontal
            width: 180
            height: 30
            stepSize: 0.0025
            snapMode: ScrollBar.SnapAlways
            x:60
        }
        Text{
            id:tm2
            x:240
            y:5
            font.pixelSize: 15
            text:"100"
        }
        Rectangle {
            x:30
            y:40
            z:10
            width: 60
            height: 60
            color:"#00FFFF"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr("加速")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    item.fastl()
                    press_su.play_()
                }
            }
        }
        Rectangle {
            x:120
            y:40
            z:10
            width: 60
            height: 60
            color:"#B200FF"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr("爬上")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    item.throl()
                    press_su.play_()
                }
            }
        }
        Rectangle {
            x:210
            y:40
            z:10
            width: 60
            height: 60
            color:"#FFFF00"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr("食物")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    item.regen()
                    press_su.play_()
                }
            }
        }
        Rectangle{//普通模式
            id:common
            x:10
            y:110
            width: 60
            height:40
            color:"#FFD700"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 10
                text:"普通模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    common.color="#FFD700"
                    item.setType(0)
                }
            }
        }
        Rectangle{//高概率模式
            id:high
            x:80
            y:110
            width: 60
            height:40
            color:"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 10
                text:"高概率模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    high.color="#00FFFF"
                    item.setType(1)
                }
            }
        }
        Rectangle{//经典模式
            id:typical
            x:150
            y:110
            width: 60
            height:40
            color:"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 10
                text:"经典模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    typical.color="#FFFAFA"
                    item.setType(2)
                    item.smove=1
                }
            }
        }
        Rectangle{//困难模式
            id:hard
            x:220
            y:110
            width: 60
            height:40
            color:"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 10
                text:"困难模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    hard.color="#FF0000"
                    item.setType(3)
                    item.smove=1
                    item.set_difficulty(100)
                }
            }
        }
        Keys.onReleased: {
            if(event.key===Qt.Key_F6)
                visible=false
        }
    }


}
