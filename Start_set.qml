import QtQuick
import QtQuick.Controls


Rectangle {
    function allhide(){
        common.checked=high.checked=typical.checked=costum.checked=false
    }
    id:root
    property int aaa
    width: 600
    height: 390
    enabled: false
    visible: false
    opacity: 0
    color:"#77ffffff"
    border.color: "#88FFFF00"
    border.width: 2
    radius: 20
    anchors.centerIn:parent
    property int next_type:2
    property bool next:false
    onEnabledChanged:{
        if(enabled)
        {
            root.visible=true
        }
    }
    NumberAnimation  on opacity {
        running: next
        duration: 1350
        easing.type: Easing.InOutQuad
        easing.overshoot: 1.0
        to: 0
        onStopped: {
            root.enabled=false
            root.visible=false
            next=false
            $win.next(next_type)
        }
    }
    NumberAnimation  on opacity {
        running: enabled
        duration: 1350
        easing.type: Easing.InOutQuad
        easing.overshoot: 1.0
        to: 1.0
    }
    Text{
        x:20
        y:15
        width: 60
        height: 40
        font.pixelSize: 25
        text:$enMode?"Game Mode:":"游戏模式："
        font.bold: true
    }
    Item{//模式
        width: 500
        height:40
        z:2
        anchors.verticalCenterOffset: -120
        anchors.horizontalCenterOffset: -50
        anchors.centerIn:parent
        id:game_mode
        Cbutton{//普通模式
            type:4
            id:common
            x:100
            width: 100
            height:40
            checkable: true
            checked: true
            colorBorder: "#00000000"
            colorBg:checked?"#FFD700":"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:$enMode?"Common":"普通模式"
                horizontalAlignment: Text.AlignHCenter
            }
            onClicked:
            {
                allhide()
                checked=true
                $item.setType(0)
            }
        }
        Cbutton{//经典模式
            type:4
            id:typical
            x:200
            width: 100
            height:40
            checkable: true
            colorBorder: "#00000000"
            colorBg:checked?"#FFFAFA":"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:$enMode?"Typical":"经典模式"
                horizontalAlignment: Text.AlignHCenter
            }
            onClicked:
            {
                allhide()
                checked=true
                $item.setType(1)
            }
        }
        Cbutton{//高概率模式
            type:4
            id:high
            x:300
            width: 100
            height:40
            checkable: true
            colorBorder: "#00000000"
            colorBg:checked?"#FF0000":"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:$enMode?"High Odds":"高概率模式"
                horizontalAlignment: Text.AlignHCenter
            }
            onClicked:
            {
                allhide()
                checked=true
                $item.setType(2)
            }
        }
        Cbutton{//自定义模式
            type:4
            id:costum
            x:400
            width: 100
            height:40
            checkable: true
            colorBorder: "#00000000"
            colorBg:checked?"#bf00ff":"#CDC5BF"
            Text{
                anchors.centerIn:parent
                font.pixelSize: 15
                text:$enMode?"Custom":"自定义模式"
                horizontalAlignment: Text.AlignHCenter
            }
            onClicked:
            {
                allhide()
                checked=true
                $item.setType(3)
                $item.set_difficulty(100)
            }
        }
    }
    Rectangle{
        x:100
        y:90
        radius: 10
        width: 400
        height:240
        color:"#00000000"
        border.color: "#FFFF00"
        border.width: 2
        Item{
            x:10
            y:10
            width: 380
            height: 40
            visible: common.checked
            id:common_
            onVisibleChanged: {
                if(visible)
                {
                    $item.set_difficulty(150)
                    $item.canDie=false
                    $item.canCrossBorder=false
                    $item.is_autoMove=false
                }
            }
            Text{
                text:$enMode?"The origin mode of SnackQml,the snake will move when you control,several types of food will be generated":"SnackQml最原始的游戏模式，蛇只会在你控制时移动，会生成多种食物"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
        Item{
            x:10
            y:10
            width: 380
            height: 40
            visible: typical.checked
            id:typical_
            onVisibleChanged: {
                if(visible)
                {
                    $item.set_difficulty(typical_bar.value)
                    $item.canDie=hard_ch.choice
                    $item.canCrossBorder=true
                    $item.is_autoMove=true
                }
            }
            Text{
                text:$enMode?"The typical game mode,the snake will move everytiem,only the common type food will be generate,you can throngh the map's border to opppsite border.smaller the number is,more difficult thee game will be":"经典的游戏模式，蛇会实时移动，只会生成普通食物，地图上下左右贯通\n数字越小难度越大(其实就是计时器的间隔)"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
            Item{
                y:$enMode?140:70
                CscrollBar{
                    onValueChanged: {
                        $item.set_difficulty(value)
                    }
                    Component.onCompleted: setValue(100)
                    x:70
                    width: 250
                    height: 20
                    minValue: 10
                    maxValue: 200
                    step: 1
                    id:typical_bar
                }
                Text{
                    x:10
                    y:3
                    text:$enMode?"Difficulty":"难度："
                    font.pixelSize: 15
                }
                Item{
                    y:40
                    Text{
                        x:10
                        y:10
                        text:$enMode?"Die On Touch":"一触即死:"
                        font.pixelSize: 15
                    }
                    Choice{
                        onChoiceChanged:
                        {
                            $item.canDie=choice
                        }
                        x:$enMode?120:100
                        y:10
                        id:hard_ch
                    }
                }
            }
        }
        Item{
            x:10
            y:10
            visible: high.checked
            id:high_
            width: 380
            height: 40
            onVisibleChanged: {
                if(visible)
                {
                    $item.set_difficulty(150)
                    $item.canDie=false
                    $item.canCrossBorder=false
                    $item.is_autoMove=false
                }
            }
            Text{
                text:$enMode?"A mode fork from common,the snake will move when you control,several types of food will be generated,but the probability to generate rare food will be raised":"由普通模式衍生出的一个游戏模式，蛇只会在你控制时移动，会生成多种食物，同时稀有食物的生成概率增加"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
        Item{
            x:10
            y:10
            width: 380
            height: 40
            visible: costum.checked
            id:custom_
            onVisibleChanged: {
                if(visible)
                {
                    $item.set_difficulty(custom_bar.value)
                    $item.canDie=custom_canDie.choice
                    $item.canCrossBorder=custom_canCB.choice
                    $item.is_autoMove=custom_autoMove.choice
                }
            }
            Text{
                text:$enMode?"A mode with more setting":"顾名思义"
                wrapMode: Text.WordWrap
                anchors.fill: parent
                font.pixelSize: 15
            }
            Item{
                y:$enMode?30:30
                CscrollBar{
                    onValueChanged: {
                        $item.set_difficulty(value)
                    }
                    Component.onCompleted: setValue(100)
                    x:70
                    width: 250
                    height: 20
                    step: 1
                    minValue: 10
                    maxValue: 200
                    id:custom_bar
                }
                Text{
                    x:10
                    y:3
                    text:$enMode?"Difficulty":"难度："
                    font.pixelSize: 15
                }
                Item{
                    y:30
                    Text{
                        x:10
                        y:10
                        text:$enMode?"Die On Touch":"一触即死:"
                        font.pixelSize: 15
                    }
                    Choice{
                        id:custom_canDie
                        onChoiceChanged:
                        {
                            $item.canDie=choice
                        }
                        x:$enMode?120:100
                        y:10
                    }
                }
                Item{
                    y:60
                    Text{
                        x:10
                        y:10
                        text:$enMode?"Can Cross Border":"允许穿过边界:"
                        font.pixelSize: 15
                    }
                    Choice{
                        id:custom_canCB
                        onChoiceChanged:
                        {
                            $item.canCrossBorder=choice
                        }
                        x:$enMode?140:120
                        y:10
                    }
                }
                Item{
                    y:90
                    Text{
                        x:10
                        y:10
                        text:$enMode?"Auto Move":"自动移动:"
                        font.pixelSize: 15
                    }
                    Choice{
                        id:custom_autoMove
                        onChoiceChanged:
                        {
                            $item.is_autoMove=choice
                        }
                        x:$enMode?120:100
                        y:10
                    }
                }
            }
        }
    }
    Cbutton{
        radiusBg: 10
        type:4
        width: 150
        height: 40
        text: $enMode?"Back":"返回"
        font.pixelSize: 20
        x:10
        y:340
        colorBg_common: "#EEEE00"
        colorBg_down: "#DDDD00"
        colorBg_hovered: "#FFFF00"
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked: {
            next_type=0
            next=true
        }
    }
    Cbutton{
        radiusBg: 10
        type:4
        width: 150
        height: 40
        text: $enMode?"Start":"开始游戏"
        font.pixelSize: 20
        x:440
        y:340
        colorBg_common: "#EEEE00"
        colorBg_down: "#DDDD00"
        colorBg_hovered: "#FFFF00"
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked: {
            next_type=2
            next=true
        }
    }
}
