import QtQuick

Image{//开始界面
    z:113112
    Timer{
        id:start_timer3
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(start_item.opacity>0)
                start_item.opacity-=0.01
            else
            {
                start_item.visible=false
                start_set.visible=true
                start_timer3.running=false
                start_timer4.running=true
            }
        }

    }
    Timer{
        id:start_timer4
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(start_set.opacity<1)
                start_set.opacity+=0.01
            else
                running=false
        }
    }

    function setMaxtime(maxt){
        mt_t_.text="用时："+Math.floor(maxt/100)+"s"
    }
    function setMaxcent(maxcent){
        m_t_.text="最高分："+maxcent
    }
    visible: false
    opacity: 0
    id:start_item
    x:0
    y:0
    anchors.fill: parent
    Image{//标题
        anchors.verticalCenterOffset: -40
        anchors.horizontalCenterOffset: 0
        anchors.centerIn:parent
        width: 550
        height: 150
        source:"qrc:/images/images/title.png"
    }
    Rectangle{
        x:580
        y:0
        width: 320
        height: 40
        color: "#FFFFFF"
        opacity: 0.6
    }
    TextInput {
        x:700
        y:0
        width: 190
        height: 20
        font.pointSize: 8
        text: "源代码：https://github.com/WinMCHG31400/snackQML"
        onDisplayTextChanged:
        {
            text="源代码：https://github.com/WinMCHG31400/snackQML"
        }
    }
    TextInput {
        x:700
        y:20
        width: 190
        height: 20
        font.pointSize: 8
        text: "按F4打开全屏（不是作者说的）"
        onDisplayTextChanged:
        {
            text="按F4打开全屏"
        }
    }
    Rectangle {//显示最高分
        id:maxcent_text_
        z:10
        x:10
        y:10
        width: 100
        height: 30
        color: "#FF0000"
        Text {
            id: m_t_
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("最高分："+maxcent)
        }
    }
    Rectangle {//显示最高分用时
        id:maxcentt_text_
        z:10
        x:10
        y:40
        width: 100
        height: 20
        color: "#FF0000"
        Text {
            id: mt_t_
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("用时："+Math.floor(maxt/100)+"s")
        }
    }
    Rectangle {//开始游戏按钮
        id:start_bu
        anchors.verticalCenterOffset: 40
        anchors.horizontalCenterOffset: 0
        anchors.centerIn:parent
        z:10
        width: 150
        height: 70
        color: "#EEEE00"
        Text {
            anchors.centerIn: parent
            font.pixelSize: 30
            font.bold: true
            text: qsTr("开始游戏")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if(start_item.opacity===1)
                {
                    start_timer3.running=true
                    item.forceActiveFocus()
                    press_su.play_()
                }
            }
        }
    }

    Image {//开始"游戏"按钮
        x:85
        y:515
        width: 730
        height: 85
        source: "qrc:/images/images/agg.PNG"
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                donot=false
                win.visibility=Window.FullScreen
                winn.visible=true
                start_item.visible=false
                winn.forceActiveFocus()
            }
        }
    }
    Rectangle {//帮助按钮
        z:10
        x:0
        y:515
        width: 85
        height: 85
        color: "#CD5C5C"
        Text {
            anchors.centerIn: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("帮助")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                help.visible=true
            }
        }
    }
    Rectangle {//退出按钮
        z:10
        x:815
        y:515
        width: 85
        height: 85
        color: "#FF0000"
        Text {
            anchors.centerIn: parent
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("退出")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                Qt.quit()
            }
        }
    }
}
