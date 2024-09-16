import QtQuick

Image{//面板
    function setType(type){
        if(type===0)
        {
            h_t.text="普通模式"
            bu_through.visible=true
            high_text.color="#FFD700"
        }
        else if(type===1)
        {
            h_t.text="高概率模式"
            bu_through.visible=true
            high_text.color="#00FFFF"
        }
        else if(type===2)
        {
            h_t.text="经典模式"
            bu_through.visible=false
            high_text.color="#FFFAFA"
        }
        else
        {
            h_t.text="困难模式"
            bu_through.visible=true
            high_text.color="#FF0000"
        }
    }

    function setMaxtime(maxt){
        mt_t.text="用时："+Math.floor(maxt/100)+"s"
    }
    function setMaxcent(maxcent){
        m_t.text="最高分："+maxcent
    }
    function setTime(t){
        time_text.text=t+"s"
    }
    function th_allow(){
        bu_through.color="#B200FF"
        bu_through_bu.text="允许爬上自身"
        throuth_text.visible=true
        isThro=true
    }
    function th_refuse(){
        bu_through_bu.text="不允许爬上自身"
        throuth_text.visible=false
        timer.throuth=0
        isThro=false
        bu_through.color="#CDCDC1"
    }
    function sp_visible(is){
        speed_text.visible=is
    }
    function sp_setText(t){
        s_t.text=t+"s"
    }
    function set_length(l){
        l_t.text=l
    }
    function pause(i){
        if(!i)
            pause_.source="qrc:/images/images/pause_bu.png"
        else
            pause_.source="qrc:/images/images/_pause_bu.png"
    }

    source:"qrc:/images/images/back_null.png"
    x:800
    y:0
    width: 100
    height: 600
    Rectangle {//显示分数
        id:cent_text
        z:10
        x:0
        y:0
        width: 100
        height: 40
        color: "#FFFF00"
        Text {
            id: cent
            anchors.centerIn: parent
            font.pixelSize: 30
            font.bold: true
            text: qsTr(""+(snack.cent+addcent))
        }
    }
    Rectangle {//显示长度
        id:lon_text
        z:10
        x:0
        y:40
        width: 100
        height: 40
        color: "#FFFF00"
        Text {
            id: l_t
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
            text: qsTr("1m")
        }
    }
    Rectangle {//显示时间
        id:time_
        z:10
        x:0
        y:80
        width: 100
        height: 40
        color: "#FFFF00"
        Text {
            id: time_text
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
            text: qsTr("0s")
        }
    }
    Rectangle {//显示加速状态
        id:speed_text
        z:10
        x:0
        y:130
        width: 100
        height: 30
        color: "#00FFFF"
        Text {
            id: s_t
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr(timer.fast+"0ms")
        }
    }
    Rectangle {//显示穿过状态
        id:throuth_text
        z:10
        x:0
        y:160
        width: 100
        height: 30
        color: "#B200FF"
        Text {
            id: t_t
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr(timer.throuth+"0ms")
        }
    }
    Rectangle {//显示模式
        id:high_text
        z:10
        x:0
        y:195
        width: 100
        height: 30
        color: "#FFD700"
        Text {
            id: h_t
            anchors.centerIn: parent
            font.pixelSize: 20
            font.bold: true
            text: qsTr("普通模式")
        }
    }
    Rectangle {//显示穿过状态（按钮）
        id:bu_through
        z:10
        x:0
        y:235
        width: 100
        height: 30
        color: "#CDCDC1"
        Text {
            id:bu_through_bu
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("不允许爬上自身")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if(control)//开发者模式下允许使用按钮修改
                {
                    if(!isThro)
                    {
                        bu_through_bu.allow()
                        timer.throuth=2147483647
                    }
                    else
                        bu_through_bu.refuse()
                    press_su.play_()
                }
            }
        }
    }
    Rectangle{//显示移动按钮的按钮
        id:control__bu
        x:0
        y:305
        z:10
        width: 100
        height: 30
        color: "#FFFFFF"
        Text {
            id:bu_control__bu
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("不显示控制按钮")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                    if(control_bu.visible)
                    {
                        bu_control__bu.text="不显示控制按钮"
                        control_bu.visible=false
                    }
                    else
                    {
                        bu_control__bu.text="显示控制按钮"
                        control_bu.visible=true
                    }
                    press_su.play_()
            }
        }
    }
    Rectangle{//音效按钮
        id:soude_bu
        x:0
        y:340
        z:10
        width: 100
        height: 30
        color: "#FFFFFF"
        Text {
            id:bu_soude__bu
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("开启音效")
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                        if(doud)
                        {
                            bu_soude__bu.text="关闭音效"
                            doud=false
                        }
                        else
                        {
                            bu_soude__bu.text="开启音效"
                            doud=true
                            press_su.play()
                        }
                }
            }
        }
    }
    Rectangle {//帮助按钮
        z:10
        x:0
        y:420
        width: 100
        height: 30
        color: "#EEEE00"
        Text {
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("帮助")
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                help.visible=true
            }
        }
    }
    Rectangle {//显示最高分
        id:maxcent_text
        z:10
        x:0
        y:470
        width: 100
        height: 30
        color: "#FF0000"
        Text {
            id: m_t
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("最高分："+maxcent)
        }
    }
    Rectangle {//显示最高分用时
        id:maxcentt_text
        z:10
        x:0
        y:500
        width: 100
        height: 20
        color: "#FF0000"
        Text {
            id: mt_t
            anchors.centerIn: parent
            font.pixelSize: 14
            font.bold: true
            text: qsTr("用时："+Math.floor(maxt/100)+"s")
        }
    }
    Image {//暂停按钮
        id: pause_
        x:20
        y:550
        source: "qrc:/images/images/pause_bu.png"
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if(pausen)
                    item.pause_()
                else
                    item.pause()
                press_su.play_()
            }
        }
    }
}
