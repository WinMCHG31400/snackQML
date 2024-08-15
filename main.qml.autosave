import QtQuick 2.14
import QtQuick.Controls 2.14
//import "qrc:/Snack.qml" as Snack

ApplicationWindow {
    id:win
    property bool isShow:false
    property bool isThro:false
    property int im_type
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
    Image{
        id:item
        x:0
        y:0
        width: 800
        height: 600
        Component.onCompleted: {
                    for(var i=0;i<800;i+=20)
                    {
                        for(var j=0;j<600;j+=20)
                        {
                            var image = Qt.createQmlObject("import QtQuick 2.14; Image { z:-1; source: 'qrc:/images/images/back.png'; width: 20; height: 20}", item);
                            image.x=i
                            image.y=j
                        }
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
                    if(lxj>0.9)
                    {
                        im_type=1
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:0; source: 'qrc:/images/images/food_speed.png'; width: 20; height: 20}", item);
                    }
                    else if(lxj>0.8)
                    {
                        im_type=2
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:0; source: 'qrc:/images/images/food_throuth.png'; width: 20; height: 20}", item);
                    }
                    else
                    {
                        im_type=0
                        var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:0; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);
                    }
                    x0=image.x=parseInt(Math.random()*40)*20
                    y0=image.y=parseInt(Math.random()*30)*20
                    c++
                }
                if(snack.cent>+100)
                {
                    cent_text.x=800
                    cent_text.width=100
                }
            }
        }
        Rectangle {
            id:cent_text
            z:10
            x:820
            y:10
            width: 60
            height: 40
            color: "#FFFF00"
            opacity: 0.5
            Text {
                id: cent
                anchors.centerIn: parent
                font.pixelSize: 30
                font.bold: true
                text: qsTr(""+snack.cent)
            }
        }
        Rectangle {
            id:speed_text
            z:10
            x:810
            y:60
            width: 80
            height: 40
            color: "#00FFFF"
            opacity: 0.5
            Text {
                id: s_t
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr(timer.fast+"0ms")
            }
        }
        Rectangle {
            id:throuth_text
            z:10
            x:810
            y:110
            width: 80
            height: 40
            color: "#B200FF"
            opacity: 0.5
            Text {
                id: t_t
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr(timer.throuth+"0ms")
            }
        }
        Rectangle {
            id:bu_through
            z:10
            x:800
            y:160
            width: 100
            height: 40
            color: "#FFFFFF"
            opacity: 0.5
            Text {
                id:bu_through_bu
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("不允许穿过自身")
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        if(isThro)
                        {
                            bu_through_bu.text="不允许穿过自身"
                            isThro=false
                        }
                        else
                        {
                            bu_through_bu.text="允许穿过自身"
                            isThro=true
                        }
                    }
                }
            }

        }
        Image{
            id:sho                      //显示面板
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
                    }
                    else
                    {
                        isShow=false
                        win.width=800
                        sho.source="qrc:/images/images/show_false.png"
                    }
                }
            }
        }
        Image{
            id:up
            x:805
            y:220
            z:10
            width: 30
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
            x:805
            y:260
            z:10
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
            x:805
            y:300
            z:10
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
            x:805
            y:340
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
                        }
                        hear.rotation=270
                    }
                    else if(snack.a==1)
                    {
                        if(hear.x>0 && (isThro? true:(!isp(hear.x-20,hear.y)))){
                            hear.x-=20
                            body_move(hear.x+20,hear.y,180)
                        }
                        hear.rotation=180
                    }
                    else if(snack.s==1)
                    {
                        if(hear.y<580 && (isThro? true:(!isp(hear.x,hear.y+20)))){
                            hear.y+=20
                            body_move(hear.x,hear.y-20,90)
                        }
                        hear.rotation=90
                    }
                    else if(snack.d==1)
                    {
                        if(hear.x<780 && (isThro? true:(!isp(hear.x+20,hear.y)))){
                            hear.x+=20
                            body_move(hear.x-20,hear.y,0)
                        }
                        hear.rotation=0
                    }
                    if(hear.x==timer2.x0 && hear.y==timer2.y0)//吃到食物
                    {
                        switch(im_type)
                        {
                        case 1:
                            timer.fast+=180
                            timer.interval=100        
                            speed_text.visible=true
                            break
                        case 2:
                            timer.throuth+=60
                            isThro=true
                            bu_through_bu.text="允许穿过自身"
                            throuth_text.visible=true
                            break
                        default:break
                        }

                        timer2.im.destroy()
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
                    }
                }
            }
            Image {
                z:20000
                x:200
                y:200
                width: 20
                height: 20
                visible: true
                id: hear
                source: "qrc:/images/images/snack_hear.png"
            }
            Keys.onPressed: {
                if(event.key==Qt.Key_W)
                    snack.w=1;
                else if(event.key==Qt.Key_A)
                    snack.a=1;
                else if(event.key==Qt.Key_S)
                    snack.s=1;
                else if(event.key==Qt.Key_D)
                    snack.d=1;
                if(event.key==Qt.Key_Up)
                    snack.w=1;
                else if(event.key==Qt.Key_Left)
                    snack.a=1;
                else if(event.key==Qt.Key_Down)
                    snack.s=1;
                else if(event.key==Qt.Key_Right)
                    snack.d=1;
            }
            Keys.onReleased: {
                if(event.key==Qt.Key_W)
                    snack.w=0;
                else if(event.key==Qt.Key_A)
                    snack.a=0;
                else if(event.key==Qt.Key_S)
                    snack.s=0;
                else if(event.key==Qt.Key_D)
                    snack.d=0;
                if(event.key==Qt.Key_Up)
                    snack.w=0;
                else if(event.key==Qt.Key_Left)
                    snack.a=0;
                else if(event.key==Qt.Key_Down)
                    snack.s=0;
                else if(event.key==Qt.Key_Right)
                    snack.d=0;
                else if(event.key==Qt.Key_Escape)
                    Qt.quit()
            }
        }

    }
}
