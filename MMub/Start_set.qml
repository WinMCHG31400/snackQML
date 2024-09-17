import QtQuick
import QtQuick.Controls


Image {
    function allhide(){
        difficulty=200
        high.color="#CDC5BF"
        typical.color="#CDC5BF"
        common.color="#CDC5BF"
        hard.color="#CDC5BF"
        high_.visible=false
        common_.visible=false
        typical_.visible=false
        hard_.visible=false
    }
    z:113115
    Timer{
        id:start_timer3
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(start_set.opacity>0)
                start_set.opacity-=0.01
            else
            {
                start_set.visible=false
                item.visible=true
                start_timer4.running=true
                item.continua()
            }
        }
    }
    Timer{
        id:start_timer4
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(item.opacity<1)
                item.opacity+=0.01
            else
                start_timer4.running=false
        }
    }
    property int difficulty:200;
    property int aaa
    visible: false
    opacity: 0
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    anchors.centerIn:parent
    width: 600
    height: 400
    source:"qrc:/images/images/pause.png"
    Item{//模式
        width: 500
        height:40
        anchors.verticalCenterOffset: -120
        anchors.horizontalCenterOffset: -50
        anchors.centerIn:parent
        id:game_mode
        Text{
            x:30
            y:10
            width: 60
            height: 40
            font.pixelSize: 15
            text:"游戏模式："

        }
        Rectangle{//普通模式
            id:common
            x:100
            width: 100
            height:40
            color:"#FFD700"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:"普通模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    common_.visible=true
                    common.color="#FFD700"
                    item.setType(0)
                }
            }
        }
        Rectangle{//高概率模式
            id:high
            x:200
            width: 100
            height:40
            color:"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:"高概率模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    high_.visible=true
                    high.color="#00FFFF"
                    item.setType(1)
                }
            }
        }
        Rectangle{//经典模式
            id:typical
            x:300
            width: 100
            height:40
            color:"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:"经典模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    typical.color="#FFFAFA"
                    typical_.visible=true
                    item.setType(2)
                    item.smove=1
                }
            }
        }
        Rectangle{//困难模式
            id:hard
            x:400
            width: 100
            height:40
            color:"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:"困难模式"
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    allhide()
                    hard.color="#FF0000"
                    hard_.visible=true
                    item.setType(3)
                    item.smove=1
                    item.set_difficulty(100)
                }
            }
        }
    }
    Image{
        id:common_
        x:100
        y:100
        width: 400
        height:200
        source: "qrc:/images/images/pause.png"
        Item{
            x:10
            y:10
            width: 380
            height: 40
            Text{
                text:"SnackQml最原始的游戏模式，蛇只会在你控制时移动，会生成多种食物"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
    }
    Image{
        visible: false
        id:high_
        x:100
        y:100
        source: "qrc:/images/images/pause.png"
        width: 400
        height:200
        Item{
            x:10
            y:10
            width: 380
            height: 40
            Text{
                text:"有普通模式衍生出的一个游戏模式，蛇只会在你控制时移动，会生成多种食物，同时稀有食物的生成概率增加"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
    }
    Image{
        visible: false
        id:typical_
        width: 400
        x:100
        y:100
        source: "qrc:/images/images/pause.png"
        height:200
        Item{
            x:10
            y:10
            width: 380
            height: 40
            Text{
                text:"经典的游戏模式，蛇会实时移动，只会生成普通食物，地图上下左右贯通\n数字越小难度越大(其实就是计时器的间隔)"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
        Text{
            id:a
            x:320
            y:70
            text:"120"
            font.pixelSize: 20
        }

        ScrollBar{
            rotation: 180
            onPositionChanged: {
                difficulty=200*position+20
                a.text=difficulty
                item.set_difficulty(difficulty)
            }
            position: 0.5
            id:typical_bar
            hoverEnabled: true
            active:hovered || pressed
            orientation:Qt.Horizontal
            width: 200
            height: 30
            stepSize: 0.005
            snapMode: ScrollBar.SnapAlways
            x:100
            y:70
        }
        Text{
            x:10
            y:73
            text:"难度："
            font.pixelSize: 15
        }
        Item{
            y:110
            Text{
                x:10
                y:10
                text:"一触即死:"
                font.pixelSize: 15
            }
            Choice{
                onChoiceChanged:
                {
                    item.candie=choice
                }
                x:100
                y:10
                id:hard_ch
            }
        }
    }
    Image{
        visible: false
        id:hard_
        width: 400
        height:200
        source: "qrc:/images/images/pause.png"
        x:100
        y:100
        Item{
            x:10
            y:10
            width: 380
            height: 40
            Text{
                text:"由普通模式和经典模式结合成的一个模式，蛇会实时移动，默认移动速度较快，会生成多种食物，地图上下左右贯通,数字越小难度越大(其实就是计时器的间隔)"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
        Text{
            id:aa
            x:320
            y:70
            text:"85"
            font.pixelSize: 20
        }

        ScrollBar{
            rotation: 180
            onPositionChanged: {
                difficulty=150*position+10
                aa.text=difficulty
                item.set_difficulty(difficulty)
            }
            position: 0.5
            id:hard_bar
            hoverEnabled: true
            active:hovered || pressed
            orientation:Qt.Horizontal
            width: 200
            height: 30
            stepSize: 0.005
            snapMode: ScrollBar.SnapAlways
            x:100
            y:70
        }
        Text{
            x:10
            y:73
            text:"难度："
            font.pixelSize: 15
        }
        Item{
            y:110
            Text{
                x:10
                y:10
                text:"一触即死:"
                font.pixelSize: 15
            }
            Choice{
                onChoiceChanged:
                {
                    item.candie=choice
                }
                x:100
                y:10
            }
        }
    }


    Rectangle {//开始游戏按钮
        id:start_bu
        anchors.verticalCenterOffset: 130
        anchors.horizontalCenterOffset: 100
        anchors.centerIn:parent
        z:10
        width: 150
        height: 40
        color: "#EEEE00"
        Text {
            anchors.centerIn: parent
            font.pixelSize: 20
            font.bold: true
            text: qsTr("开始游戏")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if(start_set.opacity===1)
                {
                    item.set_difficulty(difficulty)
                    start_timer3.running=true
                    item.forceActiveFocus()
                    sett.start()
                    press_su.play_()
                }
            }
        }
    }
}
