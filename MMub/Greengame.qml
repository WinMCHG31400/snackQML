import QtQuick
import GFile
Item {//彩蛋
    property bool  w: false         //
    property bool  a: false         //
    property bool  s: false         //
    property bool  d: false         //
    property bool  q: false         //
    property bool  e: false         //
    property bool  r: false         //
    property bool  spase:false      //
    property int  charge_time: 0;   //
    property var bos:[30];          //
    property int issh: 0            //
    property int num:0;             //
    property string last:"w"        //
    property string llst:"q"        //
    property real v1: 12            //
    property int tttt:0             //
    property string file_q_source   //
    anchors.fill: parent;
    z:9999
    visible: false;
    function wclick(ptr,fun){//点击效果
        var i=0
        var j=0.95
        var x0=ptr.x,y0=ptr.y,w0=ptr.width,h0=ptr.height
        var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
        t1.interval = 40;
        t1.repeat = true
        t1.triggered.connect(function(){
            i++
            if(i===5)
            {
                t1.interval = 100;
                fun()
            }
            if(i>10)
            {
                t1.stop()
                ptr.width=w0
                ptr.height=h0
                ptr.x=x0
                ptr.y=y0
            }
        })
        t1.start()
    }
    function creata_shells(){//创造炮弹
        //本体
        var image = Qt.createQmlObject("import QtQuick 2.14; Image { source: 'qrc:/i/i/shells.png'; width: 9; height: 14.5}", item_play_back_q);
        image.x = tank.x+(tank.width+image.width)/3.0+3-item_play_back_q.x
        image.y =tank.y+(tank.height+image.height)/3.0+2-item_play_back_q.y
        image.rotation=(tank.rotation+tank_top.rotation)%360
        var rotation=(image.rotation-90)*Math.PI/180.0
        image.x+=Math.cos(rotation) * 60;
        image.y+=Math.sin(rotation) * 60
        //计时器
        var timer = Qt.createQmlObject("import QtQuick 2.14; Timer {property real tt:15}", image);
        timer.repeat = true;
        timer.interval = 16;

        timer.triggered.connect(function()
        {
            if(timer.tt<=0.3)
            {
                create_shockwave(image.x,image.y,image,item_play_back_q)
                create_blast_large(image.x,image.y,item_play_back_q);
                timer.stop();
                image.visible=false;
                image.destroy();
            }
            else
            {
                timer.tt-=0.25;
                var re=(image.rotation-90)*Math.PI/180.0
                image.x += Math.cos(re) * timer.tt;
                image.y += Math.sin(re) * timer.tt;
                /* //超出范围删除
                // if (image.x > 2000 )
                // {
                //     timer.stop();
                //     image.destroy();
                // }
                // else if ( image.y > 1400)
                // {
                //     timer.stop();
                //     image.destroy();
                // }
                // else if( image.x<0 )
                // {
                //     timer.stop();
                //     image.destroy();
                // }
                // else if(image.y<0)
                // {
                //     timer.stop();
                //     image.destroy();
                 }*/
            }
        });
        timer.start();
        tit.start()
        issh=1
        fit.ty=1
    }
    function create_bullet(v){//创造单个子弹
        var image = Qt.createQmlObject("import QtQuick 2.14; Image { source: 'qrc:/i/i/bullet.png'; width: 5; height: 12}", item_play_back_q);
        image.x = tank.x+(tank.width+image.width)/3.0+3-item_play_back_q.x
        image.y =tank.y+(tank.height+image.height)/3.0+2-item_play_back_q.y
        image.rotation=(tank.rotation+tank_top.rotation)%360
        var rotation=(image.rotation-90)*Math.PI/180.0
        image.x+=Math.cos(rotation) * 60;
        image.y+=Math.sin(rotation) * 60;
        var timer = Qt.createQmlObject("import QtQuick 2.14; Timer {property real tt:"+v+"}", image);
        timer.interval = 16;
        timer.repeat = true;
        timer.triggered.connect(function()
        {
            if(timer.tt<=0.3)
            {
                create_blast_small(image.x,image.y);
                timer.stop();
                image.visible=false;
                image.destroy();
            }
            else
            {
                timer.tt-=0.25;
                var re=(image.rotation-90)*Math.PI/180.0
                image.x += Math.cos(re) * timer.tt;
                image.y += Math.sin(re) * timer.tt;
                /*//超出范围删除
                if (image.x > 2000 )
                {
                    timer.stop();
                    image.destroy();
                }
                else if ( image.y > 1400)
                {
                    timer.stop();
                    image.destroy();
                }
                else if( image.x<0 )
                {
                    timer.stop();
                    image.destroy();
                }
                else if(image.y<0)
                {
                    timer.stop();
                    image.destroy();
                }*/
            }
        });
        timer.start();
        issh=1
        fit.ty=1
    }
    function create_bullets(){//创造子弹
        create_bullet(12)
        v1-=0.25
        tit2.start()
        var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
        t1.interval = 200;
        t1.repeat = false;
        t1.triggered.connect(function(){
            create_bullet(v1)
            v1-=0.25
            var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
            t1.interval = 200;
            t1.repeat = false;
            t1.triggered.connect(function(){
                create_bullet(v1)
                v1-=0.25
                var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                t1.interval = 200;
                t1.repeat = false;
                t1.triggered.connect(function(){
                    create_bullet(v1)
                    v1-=0.25
                    var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                    t1.interval = 200;
                    t1.repeat = false;
                    t1.triggered.connect(function(){
                        create_bullet(v1)
                        v1-=0.25
                        var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                        t1.interval = 200;
                        t1.repeat = false;
                        t1.triggered.connect(function(){
                            create_bullet(v1)
                            v1-=0.25
                            var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                            t1.interval = 200;
                            t1.repeat = false;
                            t1.triggered.connect(function(){
                                create_bullet(v1)
                                v1-=0.25
                                var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                                t1.interval = 200;
                                t1.repeat = false;
                                t1.triggered.connect(function(){
                                    create_bullet(v1)
                                    v1-=0.25
                                    var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                                    t1.interval = 200;
                                    t1.repeat = false;
                                    t1.triggered.connect(function(){
                                        create_bullet(v1)
                                        v1-=0.25
                                        var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                                        t1.interval = 200;
                                        t1.repeat = false;
                                        t1.triggered.connect(function(){
                                            create_bullet(v1)
                                            v1-=0.25
                                            var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                                            t1.interval = 200;
                                            t1.repeat = false;
                                            t1.triggered.connect(function(){
                                                create_bullet(v1)
                                                v1-=0.25
                                                var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                                                t1.interval = 200;
                                                t1.repeat = false;
                                                t1.triggered.connect(function(){
                                                    create_bullet(v1)
                                                    v1-=0.25
                                                    var t1 = Qt.createQmlObject("import QtQuick 2.14; Timer {}",winn);
                                                    t1.interval = 200;
                                                    t1.repeat = false;
                                                    t1.triggered.connect(function(){
                                                        create_bullet(v1)
                                                        v1-=0.25
                                                        var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                        t1.interval = 200;
                                                        t1.repeat = false;
                                                        t1.triggered.connect(function(){
                                                            create_bullet(v1)
                                                            v1-=0.25
                                                            var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                            t1.interval = 200;
                                                            t1.repeat = false;
                                                            t1.triggered.connect(function(){
                                                                create_bullet(v1)
                                                                v1-=0.25
                                                                var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                                t1.interval = 200;
                                                                t1.repeat = false;
                                                                t1.triggered.connect(function(){
                                                                    create_bullet(v1)
                                                                    v1=12
                                                                })
                                                                t1.start()
                                                            })
                                                            t1.start()
                                                        })
                                                        t1.start()
                                                    })
                                                    t1.start()
                                                })
                                                t1.start()
                                            })
                                            t1.start()
                                        })
                                        t1.start()
                                    })
                                    t1.start()
                                })
                                t1.start()
                            })
                            t1.start()
                        })
                        t1.start()
                    })
                    t1.start()
                })
                t1.start()
            })
            t1.start()
        })
        t1.start()
    }
    function create_blast_large(x,y,ptr){//创造爆炸特效 大型
        var image = Qt.createQmlObject("import QtQuick 2.12; Image { source: 'qrc:/ex/i/explo/1_1.png'; width: 50; height: 50}", ptr);
        image.x = x-20.5
        image.y = y-17.75
        image.rotation=0
        var timer = Qt.createQmlObject("import QtQuick 2.12; Timer {property int tt:1}", image);
        timer.interval = 40;
        timer.repeat = true;
        timer.triggered.connect(function()
        {
            timer.tt++
            switch(timer.tt)
            {
            case 2:
                image.source="qrc:/ex/i/explo/1_2.png";
                break
            case 3:
                image.source="qrc:/ex/i/explo/1_3.png";
                break
            case 4:
                image.source="qrc:/ex/i/explo/1_4.png";
                break
            case 5:
                image.source="qrc:/ex/i/explo/1_5.png";
                break
            case 6:
                image.source="qrc:/ex/i/explo/1_6.png";
                break
            case 7:
                image.source="qrc:/ex/i/explo/1_7.png";
                break
            case 8:
                image.source="qrc:/ex/i/explo/1_8.png";
                break
            case 9:
                image.source="qrc:/ex/i/explo/1_9.png";
                break
            case 10:
                image.source="qrc:/ex/i/explo/1_9_1.png";
                break
            case 11:
                image.source="qrc:/ex/i/explo/1_9_2.png";
                break
            case 12:
                image.source="qrc:/ex/i/explo/1_9_3.png";
                break
            case 13:
                image.source="qrc:/ex/i/explo/1_9_4.png";
                break
            default:
                timer.stop();
                image.destroy()
            }
        });
        timer.start();
    }
    function create_blast_small(x,y){//创造爆炸特效 小型
        var image = Qt.createQmlObject("import QtQuick 2.14; Image { source: 'qrc:/ex/i/explo/2_1.png'; width: 30; height: 30}", item_play_back_q);
        image.x = x-12.5
        image.y = y-9
        image.rotation=0
        var timer = Qt.createQmlObject("import QtQuick 2.14; Timer {property int tt:1}", image);
        timer.interval = 40;
        timer.repeat = true;
        timer.triggered.connect(function()
        {
            timer.tt++
            switch(timer.tt)
            {
            case 2:
                image.source="qrc:/ex/i/explo/2_2.png";
                break
            case 3:
                image.source="qrc:/ex/i/explo/2_3.png";
                break
            case 4:
                image.source="qrc:/ex/i/explo/2_4.png";
                break
            case 5:
                image.source="qrc:/ex/i/explo/2_5.png";
                break
            case 6:
                image.source="qrc:/ex/i/explo/2_6.png";
                break
            case 7:
                image.source="qrc:/ex/i/explo/2_7.png";
                break
            case 8:
                image.source="qrc:/ex/i/explo/2_8.png";
                break
            case 9:
                image.source="qrc:/ex/i/explo/2_9.png";
                break
            case 10:
                image.source="qrc:/ex/i/explo/2_9_1.png";
                break
            case 11:
                image.source="qrc:/ex/i/explo/2_9_2.png";
                break
            case 12:
                image.source="qrc:/ex/i/explo/2_9_3.png";
                break
            case 13:
                image.source="qrc:/ex/i/explo/2_9_4.png";
                break
            default:
                timer.stop();
                image.destroy()
            }
        });
        timer.start();
    }
    function create_shockwave(x,y,ptr1,ptr2){//创造冲击波
        var image = Qt.createQmlObject("import QtQuick 2.14; Image { source: 'qrc:/i/i/shoge.png'; width: 10; height: 10}", ptr2);
        image.x = x+(ptr1.width-10)/2
        image.y = y+(ptr1.height-10)/2
        image.rotation=0
        image.opacity=1
        var timer = Qt.createQmlObject("import QtQuick 2.14; Timer {property real tt:10;property real tii:5}", image);
        timer.interval = 40;
        timer.repeat = true;
        timer.triggered.connect(function()
        {
            timer.tii-=0.25
            timer.tt+=5
            image.width=timer.tt
            image.height=timer.tt
            image.opacity=1-(timer.tt-10)/90
            image.x-=2.5
            image.y-=2.5
            if(timer.tt>=100)
            {
                image.visible=false
                timer.stop()
            }
        });
                timer.start();
    }

    Component.onCompleted: {//加载游戏状态
        file_q_source="C:/Users/"+file_q.getUser()+"/AppData/Local/Green_Game_m"
        file_q.create(file_q_source)
        file_q.source=file_q_source+"/game.ff"
        if(file_q.is(file_q.source))
        {

            file_q.source=file_q_source+"/x.ff"
            item_play_back_q.x=Number(file_q.read())
            file_q.source=file_q_source+"/y.ff"
            item_play_back_q.y=Number(file_q.read())
            file_q.source=file_q_source+"/1.ff"
            tank.rotation=Number(file_q.read())
            file_q.source=file_q_source+"/2.ff"
            tank_top.rotation=Number(file_q.read())
            console.log("1")
        }
        else
        {
            file_q.write("1145134253647854736278457432898")
            file_q.source=file_q_source+"/x.ff"
            file_q.write("0")
            file_q.source=file_q_source+"/y.ff"
            file_q.write("0")
            file_q.source=file_q_source+"/1.ff"
            file_q.write("0")
            file_q.source=file_q_source+"/2.ff"
            file_q.write("0")
        }
    }
    GFile{
        id:file_q
    }
    //键盘事件
    Keys.onPressed: {
        if(event.key===Qt.Key_W)
            w=true
        else if(event.key===Qt.Key_A)
            a=true
        else if(event.key===Qt.Key_S)
            s=true
        else if(event.key===Qt.Key_D)
            d=true
        else if(event.key===Qt.Key_Q)
            q=true
        else if(event.key===Qt.Key_E)
            e=true
        else if(event.key===Qt.Key_Space)
            spase=true
        else if(event.key===Qt.Key_R)
            r=true
    }
    Keys.onReleased: {
        if(event.key===Qt.Key_W)
            w=false
        else if(event.key===Qt.Key_A)
            a=false
        else if(event.key===Qt.Key_S)
            s=false
        else if(event.key===Qt.Key_D)
            d=false
        else if(event.key===Qt.Key_Q)
            q=false
        else if(event.key===Qt.Key_E)
            e=false
        else if(event.key===Qt.Key_Escape)
        {
            if(item_setting_q.visible)
            {
                if(item_setting_q.visible==true)
                {
                    item_setting_q.visible=false
                    exit_q2.visible=false
                    timer_play.start()
                }
                else
                    item_setting_q.visible=false
            }
            else
            {
                item_setting_q.visible=true
                exit_q2.visible=true
                menu.visible=true
                timer_play.running=false
            }
        }
    }
    Image {//背景
        anchors.fill: parent;
        visible:true
        source:"qrc:/i/i/back.png"
    }
    Timer {//控制事件
        function tank_photo_switch(){
            if(tank.source=="qrc:/i/i/artillery1.png")
                tank.source="qrc:/i/i/artillery2.png"
            else
                tank.source="qrc:/i/i/artillery1.png"
        }
        id: timer_play;
        interval: 20;
        repeat: true;
        running:false;
        onTriggered:{
            var rodian= (tank.rotation-90)*Math.PI/180;
            var aa
            //坦克移动，转向
            if(w)
            {
                aa=item_play_back_q.x-Math.cos(rodian) * 1;
                if(aa<=tank.x && aa>=(tank.x-2000+tank.width*Math.cos(rodian)))
                    item_play_back_q.x=aa
                aa=item_play_back_q.y-Math.sin(rodian) * 1;
                if(aa<=tank.y && aa>=(tank.y-1400+Math.sin(rodian) * tank.height))
                    item_play_back_q.y=aa
                tank_photo_switch()
            }
            else if(a)
            {
                tank.rotation-=0.5;
                tank_photo_switch()
            }
            else if(s)
            {
                aa=item_play_back_q.x+Math.cos(rodian) * 0.6;
                if(aa<=tank.x && aa>=(tank.x-2000+tank.width*Math.cos(rodian)))
                    item_play_back_q.x=aa
                aa=item_play_back_q.y+Math.sin(rodian) * 0.6;
                if(aa<=tank.y && aa>=(tank.y-1400+Math.sin(rodian) * tank.height))
                    item_play_back_q.y=aa
                tank_photo_switch()
            }
            else if(d)
            {
                tank.rotation+=0.5;
                tank_photo_switch()
            }

            //切换弹药类型
            if(r)
            {
                r=false
                if(bu_ammunition_switch_q.type)
                {
                    bu_ammunition_switch_q.type=false
                    bu_ammunition_switch_q.source="qrc:/b/i/but/bullet.svg"
                }
                else
                {
                    bu_ammunition_switch_q.type=true
                    bu_ammunition_switch_q.source="qrc:/b/i/but/shells.svg"
                }
            }
            //炮塔转向
            if(issh==0)
            {
                if(q)
                    tank_top.rotation-=0.4
                else if(e)
                    tank_top.rotation+=0.4
            }
            else
            {
                q=false
                e=false
            }
            //射击 space
            if(charge_time>0)
            {
                charge_time--;
                charge_t_text_q.text=qsTr("装弹："+charge_time+"ms")
            }
            else if(spase)
            {
                spase=false;
                bu_space_q.source="qrc:/b/i/but/space_.svg"
                bu_q_q.source="qrc:/b/i/but/q_.svg"
                bu_e_q.source="qrc:/b/i/but/e_.svg"
                if(bu_ammunition_switch_q.type)
                {
                    charge_time=150;
                    creata_shells()
                }
                else
                {
                    charge_time=200
                    create_bullets()
                }
            }
            else
            {
                bu_space_q.source="qrc:/b/i/but/space.svg"
            }
            file_q.source=file_q_source+"/x.ff"
            file_q.write(item_play_back_q.toString())
            file_q.source=file_q_source+"/y.ff"
            file_q.write(item_play_back_q.toString())
            file_q.source=file_q_source+"/1.ff"
            file_q.write(tank.rotation.toString())
            file_q.source=file_q_source+"/2.ff"
            file_q.write(tank_top.rotation.toString())
        }
    }
    Item {//开始视图
        id: item_start_q
        visible: true;
        x: 0
        y: 0
        width: winn.width
        height: winn.height
        //标题
        Image {
            id:titlle;
            width: 650
            height: 100
            visible: true
            source: "qrc:/i/i/titlle.png"
            anchors.verticalCenterOffset: -124
            anchors.horizontalCenterOffset: 0
            anchors.centerIn:item_start_q;
        }
        //开始按钮
        Image {
            id:start_bu_q
            y: (winn.height-height)/2
            visible: true;
            source: "qrc:/b/i/but/start.svg"
            anchors.centerIn: item_start_q;
            MouseArea {
                anchors.fill: parent;
                z: 1
                onClicked: {
                    wclick(start_bu_q,function(){
                        switch_effect.startl(1,function(){
                            item_start_q.visible=false;
                            item_play_q.visible=true;})
                        timer_play.start()
                        item_play_q.forceActiveFocus()
                        timer_play.running=true;
                    })

                }
            }
        }
        Image {//退出按钮
            id: exit_q
            source: "qrc:/b/i/but/exit.svg"
            anchors.verticalCenterOffset:150
            anchors.centerIn: item_start_q;
            MouseArea {
                anchors.fill: parent;
                z: 1
                onClicked: {
                    donot=true
                    win.visibility=Window.Windowed
                    winn.visible=false
                    start_item.visible=true
                    item.forceActiveFocus()
                }
            }
        }
        Image {//设置按钮
            id: setting
            source: "qrc:/b/i/but/setting.svg"
            anchors.verticalCenterOffset:75
            anchors.centerIn: item_start_q;

            MouseArea {
                anchors.fill: parent;
                z: 1
                onClicked: {
                    wclick(setting,function(){
                        item_setting_q.visible=true
                    })

                }
            }
        }
    }
    Item {//游戏视图
        id:item_play_q;
        visible: false;
        anchors.fill: parent
        rotation: 0
        focus: true;
        //游戏背景
        Item {
            id: item_play_back_q
            x:0
            y:0
            visible: true
            width: 2000
            height: 1400;
            Image {
                width: 2000
                height: 1400;
                source: "qrc:/i/i/play_back.png"
            }
        }

        //坦克
        Image {
            id:tank;
            x: 471
            y: 312
            width: 58;
            height: 76;
            rotation: 0;
            source: "qrc:/i/i/artillery1.png";
            //坦克炮管
            Image {
                id: tank_top
                width: 26;
                height: 130;
                rotation: 0;
                x: 16
                y:-25
                source: "qrc:/i/i/artillery_turret.png"
                //炮管后移
                Timer {
                    id:tit
                    interval : 40;
                    repeat : true;
                    property int ii:0
                    property real di:0
                    onTriggered:{
                        var re=(tank_top.rotation-90)*Math.PI/180.0;
                        switch(ii){
                        case 0:
                            issh=1
                            di=-1.5
                            break
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                            di=-1.5
                            break
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                            di=0.5
                            break
                        default:
                            bu_q_q.source="qrc:/b/i/but/q.svg"
                            bu_e_q.source="qrc:/b/i/but/e.svg"
                            di=0.5
                            ii=0
                            tit.stop()
                            issh=0
                            break
                        }
                        tank_top.x+=Math.cos(re) * di
                        tank_top.y+=Math.sin(re) * di
                        ii++
                    }
                }
                Timer {
                    id:tit2
                    interval : 40;
                    repeat : true;
                    property int ii:0
                    property int i2:0
                    property real di:0
                    onTriggered:{
                        //console.log("ii"+ii+"i2"+i2)
                        var re=(tank_top.rotation-90)*Math.PI/180.0;
                        switch(ii){
                        case 0:
                            issh=1
                            di=-0.1
                            break
                        case 1:
                        case 2:
                        case 3:
                            di=-0.1
                            break
                        case 4:
                            di=0
                            if(i2<15)
                            {
                                ii=-1
                                i2++
                            }
                            break
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                            di=0.5
                            break
                        default:
                            bu_q_q.source="qrc:/b/i/but/q.svg"
                            bu_e_q.source="qrc:/b/i/but/e.svg"
                            di=0
                            ii=0
                            tank_top.x=16
                            tank_top.y=-25
                            tit2.stop()
                            issh=0
                            i2=0
                            break
                        }
                        tank_top.x+=Math.cos(re) * di
                        tank_top.y+=Math.sin(re) * di
                        ii++
                    }
                }
            }
            //炮口火花
            Image {
                id:fir
                width: 18
                height: 30
                source:"qrc:/ex/i/explo/3_1.png"
                Timer {
                    id:fit
                    interval:30
                    repeat:true
                    running:true
                    property int ty:0
                    onTriggered:{
                        fir.rotation=tank_top.rotation
                        var re=(fir.rotation-90)*Math.PI/180.0
                        fir.x=(tank.width-fir.width)/2+2+Math.cos(re)*75
                        fir.y=(tank.height-fir.height)/2+Math.sin(re)*75
                        switch(fit.ty)
                        {
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                            fit.ty++
                            break
                        case 5:
                            fit.ty=6
                            fir.visible=true
                            fir.source="qrc:/ex/i/explo/3_1.png"
                            break
                        case 6:
                            fit.ty=7
                            fir.source="qrc:/ex/i/explo/3_2.png"
                            break
                        case 7:
                            fit.ty=8
                            fir.source="qrc:/ex/i/explo/3_3.png"
                            break
                        case 8:
                            fit.ty=9
                            fir.source="qrc:/ex/i/explo/3_4.png"
                            break
                        default:
                            fit.ty=0
                            fir.visible=false
                        }
                    }
                }
            }
        }

        Image {//装弹进度
            x:70
            y:10
            width: 180
            height: 50
            source: "qrc:/i/i/tt.png"
            Text {
                        id: charge_t_text_q
                        text: qsTr("装弹：0s")
                        anchors.centerIn: parent
                        font.pixelSize:30
                    }
            }


        Image {//炮弹类型图标兼切换按钮
            id:bu_ammunition_switch_q
            width:84
            height: 59
            x:winn.width-90
            y:10
            source:"qrc:/b/i/but/shells.svg"
            visible: true
            property bool type:true//弹药种类：true炮弹|false子弹
            MouseArea {
                anchors.fill: parent;
                z: 1
                onPressed: {
                    r=true
                }
            }
        }

        Image {//设置按钮
            id: setting_q
            source: "qrc:/b/i/but/setting.png"
            x:10
            y:10
            width: 50
            height: 50
            MouseArea {
                anchors.fill: parent;
                z: 2
                onClicked: {
                    item_setting_q.visible=true
                    exit_q2.visible=true
                    menu.visible=true
                    timer_play.running=false
                }
            }
        }
        Item {//操控按钮
            id:bu_control_q
            x:0
            y:0
            visible: true
            width: 1000
            height: 700
            Image {//向前移动按钮
                id:bu_w_q
                width: 62
                height: 74
                x:100
                y:winn.height-180
                source: "qrc:/b/i/but/w.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        bu_w_q.width=53
                        bu_w_q.height=60
                        bu_w_q.x+=4.4
                        bu_w_q.y+=7
                        w=true
                    }
                    onReleased: {
                        bu_w_q.width=62
                        bu_w_q.height=74
                        bu_w_q.x-=4.4
                        bu_w_q.y-=7
                        w=false
                    }
                }
            }
            Image {//向后移动按钮
                id:bu_a_q
                width: 74
                height: 62
                x:10
                y:winn.height-86
                source: "qrc:/b/i/but/a.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        bu_a_q.width=60
                        bu_a_q.height=53
                        bu_a_q.x+=7
                        bu_a_q.y+=4.4
                        a=true
                    }
                    onReleased: {
                        bu_a_q.width=74
                        bu_a_q.height=62
                        bu_a_q.x-=7
                        bu_a_q.y-=4.4
                        a=false
                    }
                }
            }
            Image {//向左旋转按钮
                id:bu_s_q
                width: 62
                height: 74
                x:100
                y:winn.height-84
                source: "qrc:/b/i/but/behi.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        bu_s_q.width=53
                        bu_s_q.height=60
                        bu_s_q.x+=4.4
                        bu_a_q.y+=7
                        s=true
                    }
                    onReleased: {
                        bu_s_q.width=62
                        bu_s_q.height=74
                        bu_s_q.x-=4.4
                        bu_s_q.y-=7
                        s=false
                    }
                }
            }
            Image {//向右旋转按钮
                id:bu_d_q
                width: 74
                height: 62
                x:178
                y:winn.height-86
                source: "qrc:/b/i/but/right.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        bu_d_q.width=60
                        bu_d_q.height=53
                        bu_d_q.x+=7
                        bu_d_q.y+=4.4
                        d=true
                    }
                    onReleased: {
                        bu_d_q.width=74
                        bu_d_q.height=62
                        bu_d_q.x-=7
                        bu_d_q.y-=4.4
                        d=false
                    }
                }
            }
            Image {//向左旋转炮塔按钮
                id:bu_q_q
                width: 74
                height: 58
                x:winn.width-194
                y:winn.height-140
                source: "qrc:/b/i/but/q.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        if(bu_q_q.source=="qrc:/b/i/but/q_.svg")
                            return
                        bu_q_q.width=60
                        bu_q_q.height=47
                        bu_q_q.x+=7
                        bu_q_q.y+=5.5
                        q=true
                    }
                    onReleased: {
                        bu_q_q.width=74
                        bu_q_q.height=58
                        bu_q_q.x-=7
                        bu_q_q.y-=5.5
                        q=false
                    }
                }
            }
            Image {//向右旋转炮塔按钮
                id:bu_e_q
                width: 74
                height: 58
                x:winn.width-86
                y:winn.height-140
                source: "qrc:/b/i/but/e.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        if(bu_e_q.source=="qrc:/b/i/but/e_.svg")
                            return
                        bu_e_q.width=60
                        bu_e_q.height=47
                        bu_e_q.x+=7
                        bu_e_q.y+=5.5
                        e=true
                    }
                    onReleased: {
                        bu_e_q.width=74
                        bu_e_q.height=58
                        bu_e_q.x-=7
                        bu_e_q.y-=5.5
                        e=false
                    }
                }
            }
            Image {//射击按钮
                id:bu_space_q
                width: 158
                height: 67
                x:winn.width-183
                y:winn.height-70
                source: "qrc:/b/i/but/space.svg"
                visible: true
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        if(bu_space_q.source=="qrc:/b/i/but/space.svg")
                        {
                            spase=true
                            bu_space_q.source="qrc:/b/i/but/space_.svg"
                        }
                    }
                }
            }
        }
    }
    Item {//设置界面
        id: item_setting_q
        width: 600
        height: 600
        x:(winn.width-width)
        y:(winn.height-height)
        visible: false
        z:1
        anchors.centerIn:item_start_q
        Image {//背景
            anchors.fill: parent;
            width: 600
            height: 600
            source: "qrc:/i/i/back2.png"
        }
        Image {//退出设置按钮
            id: exit_q_set
            source: "qrc:/b/i/but/no.png"
            x:525
            y:0
            width: 75
            height: 75
            MouseArea {
                anchors.fill: parent;
                z: 2
                onClicked: {
                    if(item_setting_q.visible==true)
                    {
                        item_setting_q.visible=false
                        exit_q2.visible=false
                        timer_play.start()
                    }
                    else
                        item_setting_q.visible=false
                }
            }
        }
        Text {//显示控制按钮设置文字
            x:60
            y:50
            text: qsTr("显示控制按钮")
            color:"#00FF00"
            font.pixelSize:30
        }
        Image {//显示设置按钮设置按钮
            id:set_bu_show_q
            x:260
            y:40
            source: "qrc:/b/i/but/noo.png"
            visible: true
            property int issss
            MouseArea {
                anchors.fill: parent;
                z: 1
                onClicked:{
                        if(set_bu_show_q.source=="qrc:/b/i/but/yes.png")
                        {
                            create_blast_large(275.5,56.5,item_setting_q)
                            set_bu_show_q.source="qrc:/b/i/but/noo.png"
                            bu_control_q.visible=false
                        }
                        else
                        {
                            set_bu_show_q.source="qrc:/b/i/but/yes.png"
                            bu_control_q.visible=true
                        }
                }
            }
        }
        Image {//退出游戏按钮
            id: exit_q2
            visible: false
            source: "qrc:/b/i/but/exit.svg"
            x:10
            y:item_setting_q.height-height
            MouseArea {
                anchors.fill: parent;
                z: 1
                onClicked: {
                    donot=true
                    win.visibility=Window.Windowed
                    winn.visible=false
                    start_item.visible=true
                    item.forceActiveFocus()
                }
            }
        }
        Image {//返回主菜单按钮
            id: menu
            visible: false
            source: "qrc:/b/i/but/mune.svg"
            x:item_setting_q.width-10-width
            y:item_setting_q.height-height
            MouseArea {
                anchors.fill: parent;
                z: 1
                onClicked: {
                    wclick(exit_q,function(){
                        switch_effect.startl(2,function(){
                            item_setting_q.visible=false
                            item_play_q.visible=false
                            exit_q2.visible=false
                            menu.visible=false
                            item_start_q.visible=true
                            timer_play.running=false
                            charge_time=0
                            issh=0
                            charge_t_text_q.text=qsTr("装弹："+charge_time+"ms")
                        })
                    })
                }
            }
        }
    }
    Image {//切换特效
        id: witer
        source: "qrc:/i/i/witer.png"
        x:0
        anchors.fill: parent;
        y:0
        width: winn.width
        height: winn.height
        visible: true
        opacity: 0
        z:2
        Timer {
            function startl(x1,func)
            {
                x=x1
                running=true
                fun=func
            }

            id:switch_effect
            interval:30
            repeat:true
            running:false
            property real aa:0
            property int aaa:0
            property int x:0
            property var fun
            onTriggered:{
                if(aaa==0)
                    aa+=0.05
                else
                    aa-=0.05
                if(aa>=1)
                {
                    fun()
                    aaa=1
                }
                if(aa<=0 && aaa==1)
                {
                    running=false
                    aaa=0
                    aa=0

                }
                    witer.opacity=aa
            }
        }
    }
}
