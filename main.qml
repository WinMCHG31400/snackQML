import QtQuick 2.14
import QtQuick.Controls 2.14
import GFile 1.2
import QtMultimedia

ApplicationWindow {
    id:win
    property bool isShow:false
    property bool isThro:false
    property int im_type
    property bool control:false
    property bool pause:false
    property int addcent:0
    property int maxcent:0
    property int maxt:0
    property string filel
    property bool doud:true
    property var impa
    property real lxj_s:0.85
    property real lxj_ss:0.8
    property real lxj_t:0.7
    property real lxj_tt:0.67
    property real lxj_h:0.6
    property real lxj_st:0.55
    visible: true
    width: 800
    height: 600
    title: "SnackQT"
    //禁止窗口大小调整
    onWidthChanged: {
        if(!isShow)
            win.width=800
        else
            win.width=900
    }
    onHeightChanged: {
        win.height=600
    }
    GFile{
        id:file
    }
    SoundEffect{
        id:press_su
        source: "qrc:/images/raw/click.wav"
    }
    SoundEffect{
        id:move_su
        source: "qrc:/images/raw/attack.wav"
    }
    SoundEffect{
        id:move_ea
        source: "qrc:/images/raw/eat.wav"
    }
    SoundEffect{
        id:musi
        source: "C:/Users/minec/Downloads/114.wav"
    }
    Image{
        id:item
        x:0
        y:0
        width: 800
        height: 600
        Component.onCompleted: {
            var i,j
                    for(i=0;i<800;i+=20)
                    {
                        for(j=0;j<600;j+=20)
                        {
                            var image = Qt.createQmlObject("import QtQuick 2.14; Image { z:-1; source: 'qrc:/images/images/back.png'; width: 20; height: 20}", item);
                            image.x=i
                            image.y=j
                        }
                    }
                    filel="C:/Users/"+file.getUser()+"/AppData/LocalLow/snackQt"
                    if(file.is(filel+"/data.d"))
                    {
                        file.setSource(filel+"/data.d")
                        maxcent=Number(file.read())
                        file.setSource(filel+"/data2.d")
                        maxt=Number(file.read())
                    }
                    else
                    {
                        file.create(filel)
                        file.setSource(filel+"/data.d")
                        file.write("0")
                        file.setSource(filel+"/data2.d")
                        file.write("0")
                    }
                    m_t.text="最高分："+maxcent
                    mt_t.text="用时："+Math.floor(maxt/100)+"s"
                }
        Timer{
            property int t:0
            property int tt
            id:timer3
            interval: 10
            repeat: true
            running:true
            onTriggered:{
                t+=1
                tt=t/100
                time_text.text=tt+"s"
            }
        }
        Timer{
            property int c:0
            property int x0
            property int y0
            property var im
            id: timer2;
            interval: 200;
            repeat: true;
            running:true;
            onTriggered:{
                if(snack.cent==timer2.c)
                {
                    var lxj=Math.random()
                    if(lxj>lxj_s)
                    {
                        im_type=1
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_speed.png'; width: 20; height: 20}", item);
                    }
                    else if(lxj>lxj_ss)
                    {
                        im_type=10
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_speed_big.png'; width: 20; height: 20}", item);
                    }
                    else if(lxj>lxj_t)
                    {
                        im_type=2
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_throuth.png'; width: 20; height: 20}", item);
                    }
                    else if(lxj>lxj_tt)
                    {
                        im_type=20
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_throuth_big.png'; width: 20; height: 20}", item);
                    }
                    else if(lxj>lxj_h)
                    {
                        im_type=3
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_high.png'; width: 20; height: 20}", item);

                    }
                    else if(lxj>lxj_st)
                    {
                        im_type=4
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_s&t.png'; width: 20; height: 20}", item);

                    }
                    else
                    {
                        im_type=0
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);
                    }
                    x0=image.x=parseInt(Math.random()*40)*20
                    y0=image.y=parseInt(Math.random()*30)*20
                    c++
                }
                if(snack.cent>=100)
                {
                    cent_text.x=800
                    cent_text.width=100
                }
                // impa=Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/forr.png'; width: 40; height: 40}", item);
                // impa.x=x0-10
                // impa.y=y0-10
            }
        }

        Rectangle {//显示分数
            id:cent_text
            z:10
            x:800
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
            x:800
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
            x:800
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
            x:800
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
            x:800
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
        Rectangle {//显示是否高概率
            id:high_text
            visible: false
            z:10
            x:800
            y:195
            width: 100
            height: 30
            color: "#FF0000"
            Text {
                id: h_t
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr("高概率模式")
            }
        }

        Rectangle {//显示穿过状态
            id:bu_through
            z:10
            x:800
            y:235
            width: 100
            height: 30
            color: "#FFFFFF"
            Text {
                id:bu_through_bu
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("不允许穿过自身")
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        if(control)
                        {
                            if(isThro)
                            {
                                bu_through_bu.text="不允许穿过自身"
                                timer.throuth=0
                                isThro=false
                                if(doud) press_su.play()
                            }
                            else
                            {
                                bu_through_bu.text="允许穿过自身"
                                throuth_text.visible=true
                                timer.throuth=
                                isThro=true
                                if(doud) press_su.play()
                            }
                        }
                    }
                }
            }
        }

        Rectangle{//显示控制按钮
            id:control__bu
            x:800
            y:270
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
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                            if(control_bu.visible)
                            {
                                bu_control__bu.text="不显示控制按钮"
                                control_bu.visible=false
                                if(doud) press_su.play()
                            }
                            else
                            {
                                bu_control__bu.text="显示控制按钮"
                                control_bu.visible=true
                                if(doud) press_su.play()
                            }
                    }
                }
            }
        }
        Rectangle{//音效按钮
            id:soude_bu
            x:800
            y:305
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
        /* Rectangle{
        //     id:music_bu
        //     x:800
        //     y:310
        //     z:10
        //     width: 100
        //     height: 30
        //     color: "#FFFFFF"
        //     opacity: 0.5
        //     Text {
        //         id:bu_music__bu
        //         anchors.centerIn: parent
        //         font.pixelSize: 14
        //         font.bold: true
        //         text: qsTr("播放音乐")
        //         MouseArea{
        //             anchors.fill: parent;
        //             onClicked: {
        //                     if(bu_music__bu.text=="播放音乐")
        //                     {
        //                         bu_music__bu.text="暂停音乐"
        //                         musi.play()
        //                     }
        //                     else
        //                     {
        //                         bu_music__bu.text="播放音乐"
        //                         musi.pause()
        //                     }
        //             }
        //         }
        //     }
        /*/
        Rectangle {//显示最高分
            id:maxcent_text
            z:10
            x:800
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
            x:800
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
            id: pause_i
            visible: false
            x:0
            y:0
            z:2147483647
            source: "qrc:/images/images/pause.png"
            Image {
                id: pause_ic
                x:300
                y:200
                source: "qrc:/images/images/pause_ic.png"
            }
        }
        Image {
            id: pause_
            x:820
            y:550
            source: "qrc:/images/images/pause_bu.png"
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(pause)
                    {
                        pause=false
                        pause_.source="qrc:/images/images/pause_bu.png"
                        pause_i.visible=false
                        timer.running=true
                        timer2.running=true
                        timer3.running=true
                        if(doud) press_su.play()
                    }
                    else
                    {
                        pause=true
                        pause_.source="qrc:/images/images/_pause_bu.png"
                        pause_i.visible=true
                        timer.running=false
                        timer2.running=false
                        timer3.running=false
                        if(doud) press_su.play()
                    }
                }
            }
        }
        Image{//显示面板
            id:sho
            x:740
            y:570
            z:10
            width: 60
            height:30
            source:"qrc:/images/images/show_false.png"
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(sho.source=="qrc:/images/images/show_false.png")
                    {
                        isShow=true
                        win.width=900
                        sho.source="qrc:/images/images/show_true.png"
                        if(doud) press_su.play()
                    }
                    else
                    {
                        isShow=false
                        win.width=800
                        sho.source="qrc:/images/images/show_false.png"
                        if(doud) press_su.play()
                    }
                }
            }
        }
        Item{//控制按钮
            id:control_bu
            visible: false
            z:2147483647
            opacity:0.6
            Image{
                id:up
                x:100
                y:480
                width:30
                height:30
                source:"qrc:/images/images/button.png"
                MouseArea{
                    anchors.fill: parent;
                    onPressed:
                        snack.w=1
                    onReleased:
                        snack.w=0
                }
            }
            Image{
                id:left
                x:40
                y:540
                width: 30
                height:30
                rotation: 270
                source:"qrc:/images/images/button.png"
                MouseArea{
                    anchors.fill: parent;
                    onPressed:
                        snack.a=1
                    onReleased:
                        snack.a=0
                }
            }
            Image{
                id:down
                x:100
                y:540
                width: 30
                height:30
                rotation: 180
                source:"qrc:/images/images/button.png"
                MouseArea{
                    anchors.fill: parent;
                    onPressed:
                        snack.s=1
                    onReleased:
                        snack.s=0
                }
            }
            Image{
                id:right
                x:160
                y:540
                z:10
                width: 30
                height:30
                rotation: 90
                source:"qrc:/images/images/button.png"
                MouseArea{
                    anchors.fill: parent;
                    onPressed:
                        snack.d=1
                    onReleased:
                        snack.d=0
                }
            }
        }
        Image {//头
            z:2147483646
            x:200
            y:200
            width: 20
            height: 20
            visible: true
            id: hear
            source: "qrc:/images/images/snack_hear.png"
        }

        Item {
            z:2
            focus: true
            id:snack
            x:0
            y:0
            width: 800
            height: 600
            property int cent:0
            property int w: 0
            property int a: 0
            property int s: 0
            property int d: 0
            property var body:[1200]
            property int num:-1
            Timer{
                function body_move(x,y,r){
                    var x0,y0,r0
                    for(var i=0;i<=snack.num;i++)
                    {
                        x0=snack.body[i].x
                        y0=snack.body[i].y
                        r0=snack.body[i].rotation
                        snack.body[i].x=x
                        snack.body[i].y=y
                        snack.body[i].rotation=r
                        x=x0
                        y=y0
                        r=r0
                    }
                }
                function isp(x,y){
                    for(var i=0;i<=snack.num;i++)
                    {
                        if(snack.body[i].y==y && snack.body[i].x==x)
                            return true
                    }
                    return false
                }
                property int fast:0
                property int throuth:0
                id: timer;
                interval: 200;
                repeat: true;
                running:true;
                onTriggered:{
                    if(throuth>0) timer.throuth--
                    if(throuth<=0)
                    {
                        isThro=false
                        bu_through_bu.text="不允许穿过自身"
                        throuth_text.visible=false
                    }
                    if(fast>0) timer.fast--
                    if(fast<=0)
                    {
                        speed_text.visible=false
                        timer.interval=200
                    }
                    if(snack.w==1)
                    {
                        if(hear.y>0 && (isThro? true:(!isp(hear.x,hear.y-20)))){
                            hear.y-=20
                            body_move(hear.x,hear.y+20,270)
                            if(doud) move_su.play()
                        }
                        hear.rotation=270
                    }
                    else if(snack.a==1)
                    {
                        if(hear.x>0 && (isThro? true:(!isp(hear.x-20,hear.y)))){
                            hear.x-=20
                            body_move(hear.x+20,hear.y,180)
                            if(doud) move_su.play()
                        }
                        hear.rotation=180
                    }
                    else if(snack.s==1)
                    {
                        if(hear.y<580 && (isThro? true:(!isp(hear.x,hear.y+20)))){
                            hear.y+=20
                            body_move(hear.x,hear.y-20,90)
                            if(doud) move_su.play()
                        }
                        hear.rotation=90
                    }
                    else if(snack.d==1)
                    {
                        if(hear.x<780 && (isThro? true:(!isp(hear.x+20,hear.y)))){
                            hear.x+=20
                            body_move(hear.x-20,hear.y,0)
                            if(doud) move_su.play()
                        }
                        hear.rotation=0
                    }
                    if(hear.x==timer2.x0 && hear.y==timer2.y0)//吃到食物
                    {
                        if(doud) move_ea.play()
                        switch(im_type)
                        {
                        case 1:
                            if(timer.fast>2147483467)
                                timer.fast=2147483647
                            else
                                timer.fast+=180
                            timer.interval=100        
                            speed_text.visible=true
                            break
                        case 10:
                            if(timer.fast>2147481847)
                                timer.fast=2147483647
                            else
                                timer.fast+=1800
                            timer.interval=100
                            speed_text.visible=true
                            break
                        case 2:
                            if(timer.throuth>2147483467)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=180
                            isThro=true
                            bu_through_bu.text="允许穿过自身"
                            throuth_text.visible=true
                            break
                        case 20:
                            if(timer.throuth>2147481847)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=1800
                            isThro=true
                            bu_through_bu.text="允许穿过自身"
                            throuth_text.visible=true
                            break
                        case 3:
                            addcent+=9
                            break
                        case 4:
                            if(timer.fast>2147483467)
                                timer.fast=2147483647
                            else
                                timer.fast+=180
                            timer.interval=100
                            speed_text.visible=true
                            if(timer.throuth>2147483467)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=180
                            isThro=true
                            bu_through_bu.text="允许穿过自身"
                            throuth_text.visible=true
                            break
                        default:break
                        }
                        l_t.text=(snack.num+3)+"m"
                        timer2.im.destroy()
                        // impa.visible=false
                        // impa.destroy()
                        snack.cent++
                        snack.num++
                        var image=snack.body[snack.num]= Qt.createQmlObject("import QtQuick 2.14; Image { z:2; source: 'qrc:/images/images/snack_body1.png'; width: 20; height: 20}", item);
                        var aa
                        if(snack.num>=1)
                            aa=snack.body[snack.num-1]
                        else
                            aa=hear
                        var re=aa.rotation*Math.PI/180.0
                        image.rotation=aa.rotation
                        image.x=aa.x+(-Math.cos(re)*20)
                        image.y=aa.y+(-Math.sin(re)*20)
                        image.z=2147483600-snack.num
                        if((snack.cent+addcent)>maxcent)
                        {
                            file.setSource(filel+"/data.d")
                            file.write(snack.cent+addcent)
                            m_t.text="最高分："+(snack.cent+addcent)
                            file.setSource(filel+"/data2.d")
                            file.write(timer3.t)
                            mt_t.text="用时："+Math.floor(timer3.t/100)+"s"
                        }
                    }
                }
            }
            Keys.onPressed: {
                if(event.key===Qt.Key_W)
                    snack.w=1;
                else if(event.key===Qt.Key_A)
                    snack.a=1;
                else if(event.key===Qt.Key_S)
                    snack.s=1;
                else if(event.key===Qt.Key_D)
                    snack.d=1;
                if(event.key===Qt.Key_Up)
                    snack.w=1;
                if(event.key===Qt.Key_V)
                {
                    if(doud)
                    {
                        doud=false
                        bu_soude__bu.text="关闭音效"
                    }
                    else
                    {
                        doud=true
                        bu_soude__bu.text="开启音效"
                        press_su.play()
                    }
                }
                else if(event.key===Qt.Key_Left)
                    snack.a=1;
                else if(event.key===Qt.Key_Down)
                    snack.s=1;
                else if(event.key===Qt.Key_Right)
                    snack.d=1;
                else if(event.key===Qt.Key_F12)
                {
                    win.title="SnackQt//开发者模式"
                    control=true
                }
                else if(event.key===Qt.Key_Space)
                {
                    if(!quit.visible)
                    {
                        if(pause)
                        {
                            pause=false
                            pause_.source="qrc:/images/images/pause_bu.png"
                            pause_i.visible=false
                            timer.running=true
                            timer2.running=true
                            timer3.running=true
                            if(doud) press_su.play()
                        }
                        else
                        {
                            pause=true
                            pause_.source="qrc:/images/images/_pause_bu.png"
                            pause_i.visible=true
                            timer.running=false
                            timer2.running=false
                            timer3.running=false
                        }
                    }
                }
            }
            Keys.onReleased: {
                if(event.key===Qt.Key_W)
                    snack.w=0;
                else if(event.key===Qt.Key_A)
                    snack.a=0;
                else if(event.key===Qt.Key_S)
                    snack.s=0;
                else if(event.key===Qt.Key_D)
                    snack.d=0;
                if(event.key===Qt.Key_Up)
                    snack.w=0;
                else if(event.key===Qt.Key_Left)
                    snack.a=0;
                else if(event.key===Qt.Key_Down)
                    snack.s=0;
                else if(event.key===Qt.Key_Right)
                    snack.d=0;
                else if(event.key===Qt.Key_Escape)
                {
                    if(quit.visible)
                    {
                        pause_.source="qrc:/images/images/pause_bu.png"
                        quit.visible=false
                        pause=false
                        pause_i.visible=false
                        pause_ic.visible=true
                        timer.running=true
                        timer2.running=true
                        timer3.running=true
                        if(doud) press_su.play()
                    }
                    else
                    {
                        pause_.source="qrc:/images/images/_pause_bu.png"
                        quit.visible=true
                        pause=true
                        pause_i.visible=true
                        pause_ic.visible=false
                        timer.running=false
                        timer2.running=false
                        timer3.running=false
                        if(doud) press_su.play()
                    }
                }
                else if(event.kry===Qt.Key_Enter && quit.visible)
                {
                    quit()
                }
                else if(event.key===Qt.Key_F1 &&control)
                {
                    if(timer.fast>0)
                    {
                        timer.interval=200
                        timer.fast=0
                    }
                    else
                    {
                        timer.interval=100
                        timer.fast=2147483647
                        speed_text.visible=true
                    }
                    if(doud) press_su.play()
                }
                else if(event.key===Qt.Key_F2 &&control)
                {
                    if(timer.throuth>0)
                    {
                        isThro=false
                        timer.throuth=0
                    }
                    else
                    {
                        isThro=true
                        timer.throuth=2147483647
                        throuth_text.visible=true
                    }
                    if(doud) press_su.play()
                }
                else if(event.key===Qt.Key_F3 &&control)
                {
                    if(lxj_s==0.85)
                    {
                        lxj_s=0.95
                        lxj_ss=0.8
                        lxj_t=0.75
                        lxj_tt=0.6
                        lxj_h=0.4
                        lxj_st=0.2
                        high_text.visible=true
                    }
                    else
                    {
                        lxj_s=0.85
                        lxj_ss=0.8
                        lxj_t=0.7
                        lxj_tt=0.67
                        lxj_h=0.6
                        lxj_st=0.55
                        high_text.visible=false
                    }
                    if(doud) press_su.play()
                }
                else if(event.key===Qt.Key_Tab)
                {
                    if(isShow)
                    {
                        isShow=false
                        win.width=800
                        sho.source="qrc:/images/images/show_false.png"
                    }
                    else
                    {
                        isShow=true
                        win.width=900
                        sho.source="qrc:/images/images/show_true.png"
                    }
                    if(doud) press_su.play()
                }
            }
        }

    }
    Image{
        id:quit
        visible: false
        z:2147483647
        Image{
            source: "qrc:/images/images/pause.png"
        }
        Rectangle{
            color: "#E8E8E8"
            x:270
            y:260
            width:260
            height: 80
            Rectangle{
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
            Rectangle{
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
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            quit.visible=false
                            pause=false
                            pause_.source="qrc:/images/images/pause_bu.png"
                            pause_ic.visible=true
                            pause_i.visible=false
                            timer.running=true
                            timer2.running=true
                            timer3.running=true
                            if(doud) press_su.play()
                        }
                    }
                }
            }
        }
    }
}
