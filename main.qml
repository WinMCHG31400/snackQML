import QtQuick 2.14
import QtQuick.Controls 2.14
import GFile 1.2
import QtMultimedia

ApplicationWindow {
    id:win
    property int  w: 0;
    property int  a: 0;
    property int  s: 0;
    property int  d: 0;
    property int  q: 0;
    property int  e: 0;
    property int  r: 0;
    property int  sp:0;
    property int  ts: 0;
    property var bos:[30];
    property int issh: 0
    property int num:0;
    property string last:"w"
    property string llst:"q"
    property real v1: 12
    property int tttt:0
    property string file_q_source
    property bool isEat:true    //是否可以吃食物
    property bool canMine:false //是否开启扫雷
    property var blocks:[100]   //扫雷的格子
    property var flags:[100]    //扫雷的标记
    property var mine:[100]     //扫雷的雷
    property int mines:0        //扫雷的雷的数量
    property int hide_blocks:100//扫雷的隐藏的格子的数量
    property bool isNe:true     //是否允许食物生成
    property bool isShow:false  //控制面板是否显示
    property bool isThro:false  //是否可以爬上自身
    property int im_type        //生成的食物的种类
    property bool control:false //是否开启开发者模式
    property bool pause:false   //是否处在暂停状态
    property int addcent:0      //额外增加的分数
    property int maxcent:0      //当前电脑用户曾获得的最高分
    property int maxt:0         //当前电脑用户获得最高分所用的时间
    property string filel       //用于处理文件操作
    property bool doud:true     //是否开启音效
    //不同种类食物生成概率（上一概率值减当前概率值为实际概率）普通食物实际概率=0.55
    property real lxj_s:0.85    //加速         实际概率=1-0.85=0.15
    property real lxj_ss:0.8    //大型加速      实际概率=0.85-0.8=0.05
    property real lxj_t:0.7     //爬上自身      实际概率=0.8-0.7=0.1
    property real lxj_tt:0.67   //大型爬上自身   实际概率=0.7-0.67=0.03
    property real lxj_h:0.6     //高分数        实际概率=0.67-0.6=0.07
    property real lxj_st:0.55   //加速及爬上自身 实际概率=0.6-0.55=0.05
    property real lxj_m:0.45    //扫雷          实际概率=0.55-0.45=0.1
    property bool is_ag:false
    property bool donot:true
    visible: true
    width: 800
    height: 600
    title: "SnackQML"
    //创造炮弹
    function creata_b(){
        //本体
        var image = Qt.createQmlObject("import QtQuick 2.12; Image { source: 'qrc:/i/i/a_b.png'; width: 9; height: 14.5}", item2_back);
        image.x = tank.x+(tank.width+image.width)/3.0+3-item2_back.x
        image.y =tank.y+(tank.height+image.height)/3.0+2-item2_back.y
        image.rotation=(tank.rotation+tank_top.rotation)%360
        var ree=(image.rotation-90)*Math.PI/180.0
        image.x+=Math.cos(ree) * 60;
        image.y+=Math.sin(ree) * 60
        //计时器
        var timer = Qt.createQmlObject("import QtQuick 2.12; Timer {property real tt:15}", image);
        timer.repeat = true;
        timer.interval = 16;

        timer.triggered.connect(function()
        {
            if(timer.tt<=0.3)
            {
                creatpop(image.x,image.y,image,item2_back)
                creatbol(image.x,image.y,item2_back);
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
                //超出范围删除
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
                }
            }
        });
        timer.start();
        tit.start()
        issh=1
        fit.ty=1
    }

    //创造单个子弹
    function creatpr(v){
        var image = Qt.createQmlObject("import QtQuick 2.12; Image { source: 'qrc:/i/i/pr2.png'; width: 5; height: 12}", item2_back);
        image.x = tank.x+(tank.width+image.width)/3.0+3-item2_back.x
        image.y =tank.y+(tank.height+image.height)/3.0+2-item2_back.y
        image.rotation=(tank.rotation+tank_top.rotation)%360
        var ree=(image.rotation-90)*Math.PI/180.0
        image.x+=Math.cos(ree) * 60;
        image.y+=Math.sin(ree) * 60;
        var timer = Qt.createQmlObject("import QtQuick 2.12; Timer {property real tt:"+v+"}", image);
        timer.interval = 16;
        timer.repeat = true;
        timer.triggered.connect(function()
        {
            if(timer.tt<=0.3)
            {
                creatbol2(image.x,image.y);
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
                }
            }
        });
        timer.start();
        issh=1
        fit.ty=1
    }

    //创造子弹
    function creatprs(){
        creatpr(12)
        v1-=0.25
        tit2.start()
        var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
        t1.interval = 200;
        t1.repeat = false;
        t1.triggered.connect(function(){
            creatpr(v1)
            v1-=0.25
            var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
            t1.interval = 200;
            t1.repeat = false;
            t1.triggered.connect(function(){
                creatpr(v1)
                v1-=0.25
                var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                t1.interval = 200;
                t1.repeat = false;
                t1.triggered.connect(function(){
                    creatpr(v1)
                    v1-=0.25
                    var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                    t1.interval = 200;
                    t1.repeat = false;
                    t1.triggered.connect(function(){
                        creatpr(v1)
                        v1-=0.25
                        var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                        t1.interval = 200;
                        t1.repeat = false;
                        t1.triggered.connect(function(){
                            creatpr(v1)
                            v1-=0.25
                            var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                            t1.interval = 200;
                            t1.repeat = false;
                            t1.triggered.connect(function(){
                                creatpr(v1)
                                v1-=0.25
                                var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                t1.interval = 200;
                                t1.repeat = false;
                                t1.triggered.connect(function(){
                                    creatpr(v1)
                                    v1-=0.25
                                    var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                    t1.interval = 200;
                                    t1.repeat = false;
                                    t1.triggered.connect(function(){
                                        creatpr(v1)
                                        v1-=0.25
                                        var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                        t1.interval = 200;
                                        t1.repeat = false;
                                        t1.triggered.connect(function(){
                                            creatpr(v1)
                                            v1-=0.25
                                            var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                            t1.interval = 200;
                                            t1.repeat = false;
                                            t1.triggered.connect(function(){
                                                creatpr(v1)
                                                v1-=0.25
                                                var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                t1.interval = 200;
                                                t1.repeat = false;
                                                t1.triggered.connect(function(){
                                                    creatpr(v1)
                                                    v1-=0.25
                                                    var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                    t1.interval = 200;
                                                    t1.repeat = false;
                                                    t1.triggered.connect(function(){
                                                        creatpr(v1)
                                                        v1-=0.25
                                                        var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                        t1.interval = 200;
                                                        t1.repeat = false;
                                                        t1.triggered.connect(function(){
                                                            creatpr(v1)
                                                            v1-=0.25
                                                            var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                            t1.interval = 200;
                                                            t1.repeat = false;
                                                            t1.triggered.connect(function(){
                                                                creatpr(v1)
                                                                v1-=0.25
                                                                var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
                                                                t1.interval = 200;
                                                                t1.repeat = false;
                                                                t1.triggered.connect(function(){
                                                                    creatpr(v1)
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

    //创造爆炸特效 大型
    function creatbol(x,y,ptr){
        var image = Qt.createQmlObject("import QtQuick 2.12; Image { source: 'qrc:/ex/i/explo1/1.png'; width: 50; height: 50}", ptr);
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
                image.source="qrc:/ex/i/explo1/2.png";
                break
            case 3:
                image.source="qrc:/ex/i/explo1/3.png";
                break
            case 4:
                image.source="qrc:/ex/i/explo1/4.png";
                break
            case 5:
                image.source="qrc:/ex/i/explo1/5.png";
                break
            case 6:
                image.source="qrc:/ex/i/explo1/6.png";
                break
            case 7:
                image.source="qrc:/ex/i/explo1/7.png";
                break
            case 8:
                image.source="qrc:/ex/i/explo1/8.png";
                break
            case 9:
                image.source="qrc:/ex/i/explo1/9.png";
                break
            case 10:
                image.source="qrc:/ex/i/explo1/10.png";
                break
            case 11:
                image.source="qrc:/ex/i/explo1/11.png";
                break
            case 12:
                image.source="qrc:/ex/i/explo1/12.png";
                break
            case 13:
                image.source="qrc:/ex/i/explo1/13.png";
                break
            default:
                timer.stop();
                image.destroy()
            }
        });
        timer.start();
    }

    //创造爆炸特效 小型
    function creatbol2(x,y){
        var image = Qt.createQmlObject("import QtQuick 2.12; Image { source: 'qrc:/ex/i/explo1/e1.png'; width: 30; height: 30}", item2_back);
        image.x = x-12.5
        image.y = y-9
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
                image.source="qrc:/ex/i/explo1/e2.png";
                break
            case 3:
                image.source="qrc:/ex/i/explo1/e3.png";
                break
            case 4:
                image.source="qrc:/ex/i/explo1/e4.png";
                break
            case 5:
                image.source="qrc:/ex/i/explo1/e5.png";
                break
            case 6:
                image.source="qrc:/ex/i/explo1/e6.png";
                break
            case 7:
                image.source="qrc:/ex/i/explo1/e7.png";
                break
            case 8:
                image.source="qrc:/ex/i/explo1/e8.png";
                break
            case 9:
                image.source="qrc:/ex/i/explo1/e9.png";
                break
            case 10:
                image.source="qrc:/ex/i/explo1/e91.png";
                break
            case 11:
                image.source="qrc:/ex/i/explo1/e92.png";
                break
            case 12:
                image.source="qrc:/ex/i/explo1/e93.png";
                break
            case 13:
                image.source="qrc:/ex/i/explo1/e94.png";
                break
            default:
                timer.stop();
                image.destroy()
            }
        });
        timer.start();
    }

    //创造冲击波
    function creatpop(x,y,ptr1,ptr2){
        var image = Qt.createQmlObject("import QtQuick 2.12; Image { source: 'qrc:/i/i/shoge.png'; width: 10; height: 10}", ptr2);
        image.x = x+(ptr1.width-10)/2
        image.y = y+(ptr1.height-10)/2
        image.rotation=0
        image.opacity=1
        var timer = Qt.createQmlObject("import QtQuick 2.12; Timer {property real tt:10;property real tii:5}", image);
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

    function minesweep()//扫雷启动函数
    {
        var i,j
        for(i=0;i<=9;i++)
            for(j=0;j<=9;j++)
            {
                var ima=win.blocks[i*10+j]=Qt.createQmlObject("import QtQuick 2.14; Image { property int mine;property int flag:0;z:2; source: 'qrc:/images/images/back.png'; width: 20; height: 20}", mine_item);
                ima.x=i*20+10
                ima.y=j*20+10
                ima.mine=parseInt(Math.random()*15-13)
                if(ima.mine>=0)
                {
                    mine[i*10+j]=1
                    mines++
                    var minenn=Qt.createQmlObject("import QtQuick 2.14; Image {z:1; source: 'qrc:/images/images/food_mine.png';width:20;height:20}", mine_item);
                    minenn.anchors.centerIn=ima
                    minenn.visible=true
                }
                else
                    mine[i*10+j]=0
                var flag=flags[10*i+j]=Qt.createQmlObject("import QtQuick 2.14; Image {z:1232352; source: 'qrc:/images/images/flag.png';width:20;height:20}", ima);
                flag.anchors.centerIn=ima
                flag.visible=false
            }
        mine_item.visible=true
    }
    //禁止窗口大小调整（人机的方法：当用户调整窗口大小时修改窗口大小为设定大小）
    onWidthChanged: {
        if(donot)
        if(!is_ag)
        {
            if(!isShow)
                win.width=800
            else
                win.width=900
        }
        else
        {
            win.width=1366
        }

    }
    onHeightChanged: {
        if(donot)
        if(!is_ag)
            win.height=600
        else
            win.height=700
    }
    GFile{
        id:file
    }
    SoundEffect{//按键音效
        id:press_su
        source: "qrc:/images/raw/click.wav"
        function play_()
        {
            if(doud) press_su.play()
        }
    }
    SoundEffect{//吃到食物音效
        id:move_ea
        source: "qrc:/images/raw/eat.wav"
    }
    Text {//加载提示
        id: load_
        z:2147483647
        visible: true
        font.pixelSize: 30
        font.bold: true
        text: qsTr("loading...")
    }
    Image{//开始界面
        visible: false
        id:start_item
        x:0
        y:0
        width: 800
        height:600
        TextInput {
            x:600
            y:10
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
            x:600
            y:40
            width: 190
            height: 20
            font.pointSize: 8
            text: "按F7打开全屏（不是作者说的）"
            onDisplayTextChanged:
            {
                text="按F7打开全屏"
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
            z:10
            x:10
            y:200
            width: 100
            height: 50
            color: "#EEEE00"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: qsTr("彩蛋")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    win.x=0
                    win.y=32
                    win.width=1366
                    win.height=700
                    winn.visible=true
                    start_item.visible=false
                    is_ag=true
                }
            }
        }
        Rectangle {//开始游戏按钮
            id:start_bu
            z:10
            x:325
            y:200
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
                    timer.running=true
                    timer2.running=true
                    timer3.running=true
                    start_item.visible=false
                    item.visible=true
                    press_su.play_()
                }
            }
        }
        Rectangle {//高概率模式设置按钮
            id:set_bu_high
            z:10
            x:260
            y:300
            width: 120
            height: 50
            color: "#CDCDC1"
            Text {
                id:set_bu_high_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("未开启高概率模式")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(lxj_s==0.85)
                    {
                        lxj_s=0.95
                        lxj_ss=0.8
                        lxj_t=0.75
                        lxj_tt=0.6
                        lxj_h=0.4
                        lxj_st=0.2
                        lxj_m=0.1
                        high_text.visible=true
                        set_bu_high.color="#FF0000"
                        set_bu_high_text.text="已开启高概率模式"
                    }
                    else
                    {
                        lxj_s=0.85
                        lxj_ss=0.8
                        lxj_t=0.7
                        lxj_tt=0.67
                        lxj_h=0.6
                        lxj_st=0.55
                        lxj_m=0.45
                        high_text.visible=false
                        set_bu_high.color="#CDCDC1"
                        set_bu_high_text.text="未开启高概率模式"
                    }
                    press_su.play_()
                }
            }
        }
        Rectangle {//开局加速设置按钮
            id:set_bu_fast
            z:10
            x:420
            y:300
            width: 120
            height: 50
            color: "#CDCDC1"
            Text {
                id:set_bu_fast_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("未开启开局加速")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(timer.fast==0)
                    {
                        timer.fast+=180
                        timer.interval=100
                        speed_text.visible=true
                        set_bu_fast.color="#00FFFF"
                        set_bu_fast_text.text="已开启开局加速"
                    }
                    else
                    {
                        timer.fast=0
                        timer.interval=200
                        speed_text.visible=false
                        set_bu_fast.color="#CDCDC1"
                        set_bu_fast_text.text="未开启开局加速"
                    }
                    press_su.play_()
                }
            }
        }
        Rectangle {//扫雷开关
            id:set_bu_mine
            z:10
            x:260
            y:360
            width: 120
            height: 50
            color: "#CDCDC1"
            Text {
                id:set_bu_mine_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("未开启扫雷")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(!canMine)
                    {
                        canMine=true
                        set_bu_mine.color="#00FF00"
                        set_bu_mine_text.text="已开启扫雷"
                        bu_mine.color="#00FF00"
                        bu_mine_text.text="已开启扫雷    "
                    }
                    else
                    {
                        canMine=false
                        set_bu_mine.color="#CDCDC1"
                        set_bu_mine_text.text="未开启扫雷"
                        bu_mine.color="#CDCDC1"
                        bu_mine_text.text="未开启扫雷    "
                    }
                    press_su.play_()
                }
            }
        }
        Rectangle {//开发者模式开关
            id:set_bu_cont
            z:10
            x:420
            y:360
            width: 120
            height: 50
            color: "#CDCDC1"
            Text {
                id:set_bu_cont_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("未开启开发者模式")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    control=true
                    set_bu_cont.color="#00008B"
                    set_bu_cont_text.text="已开启开发者模式"
                    win.title="snackQML//开发者模式"
                    press_su.play_()
                }
            }
        }

    }
    Image {//额...
        visible: false
        id: photo
        z:114514
        property int aa:0
        source: "https://p1.music.126.net/15-M_C_SUgY33WYEEl_Q9Q==/109951168126517713.jpg?param=1000y1000"
        Timer{
            id:pppp
            repeat:true
            interval: 2000
            running:false
            onTriggered: {
                switch(photo.aa)
                {
                case 0:
                    photo.source="https://p1.music.126.net/9bx3V4Oo0qxFt4OtBLtyBg==/109951163130444820.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 1:
                    photo.source="https://p1.music.126.net/EIJc2Wt5AEsIHCFcVxm6pg==/109951165033567317.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 2:
                    photo.source="https://p2.music.126.net/JJ_72FD1PPUbZzRVaNHIqA==/109951169794265026.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 3:
                    photo.source="https://i.biliimg.com/bfs/im/d38bdae3fa8d8b85e7dbdbed6fb3de22ad884119.jpg@1000w_1000h_1c.webp"
                    photo.aa++
                    break
                case 4:
                    photo.source="https://p1.music.126.net/DYuSvlYf4_4U5bfCG_q6Kg==/109951168719855496.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 5:
                    photo.source="https://i.biliimg.com/bfs/im/156109d76a9daf76ac1625897f5f3ecc60b5691f.jpg@1000w_1000h_1c.webp"
                    photo.aa++
                    break
                case 6:
                    photo.source="https://img2.kuwo.cn/star/starheads/1000/83/18/1611172212.jpg"
                    photo.aa++
                    break
                case 7:
                    photo.source="https://i.biliimg.com/bfs/article/e22d58214351aa709f08bde103ccdd3110830290.jpg@1000w_1000h_1c.webp"
                    photo.aa++
                    break
                case 8:
                    photo.source="https://i.biliimg.com/bfs/im/a588f702ff7b000304988a0866d80ecc831f44df.png@1000w_1000h_1c.webp"
                    photo.aa++
                    break
                case 9:
                    photo.source="https://p2.music.126.net/bYXOKOl47nSjxQPyw2X09Q==/109951169280368880.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 10:
                    photo.source="https://p2.music.126.net/JmJMKCyzgL-S7c5mUa6s2g==/109951169146353144.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 11:
                    photo.source="https://p2.music.126.net/MYIl1dPJCMt0ay9zmIJRtQ==/17783501068032491.jpg?param=1000y1000"
                    photo.aa++
                    break
                case 12:
                    photo.source="https://i.biliimg.com/bfs/article/d5d2f89f399f200cc58853cad0c555b910830290.png@1000w_1000h_1c.webp"
                    photo.aa++
                    break
                case 13:
                    photo.source="https://p2.music.126.net/k488cSs0FSFo1WHGbigFpA==/109951168993334060.jpg?param=1000y1000"
                    photo.aa++
                    break
                default:
                    photo.source="https://p1.music.126.net/15-M_C_SUgY33WYEEl_Q9Q==/109951168126517713.jpg?param=1000y1000"
                    photo.aa=0
                }
           }
        }
    }
    Image{//游戏界面
        visible: false
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
            m_t_.text="最高分："+maxcent
            mt_t_.text="用时："+Math.floor(maxt/100)+"s"
            if(Qt.platform.os!="windows")
                control_bu.visible=true
            start_item.visible=true
            load_.visible=false
        }
        Timer{//计时专用计时器
            property int t:0
            property int tt
            id:timer3
            interval: 10
            repeat: true
            running:false
            onTriggered:{
                t+=1
                tt=t/100
                time_text.text=tt+"s"
            }
        }
        Timer{//计时器2：食物生成
            property int c:0
            property int x0 //存储生成的食物的位置
            property int y0 //存储生成的食物的位置
            property var im //存储生成的食物（Image）
            id: timer2;
            interval: 200;
            repeat: true;
            running:false
            onTriggered:{
                if(isNe)
                {
                    try{
                        timer2.im.destroy()
                    }catch(error)
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
                        else if(lxj>lxj_m && canMine)
                        {
                            im_type=5
                            var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_mine.png'; width: 20; height: 20}", item);

                        }
                        else
                        {
                            im_type=0
                            var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);
                        }
                        x0=image.x=parseInt(Math.random()*40)*20
                        y0=image.y=parseInt(Math.random()*30)*20
                        c++
                        isNe=false
                    }
                }
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
        Rectangle {//显示穿过状态（按钮）
            id:bu_through
            z:10
            x:800
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
                function allow()
                {
                    bu_through.color="#B200FF"
                    bu_through_bu.text="允许爬上自身"
                    throuth_text.visible=true
                    isThro=true
                }
                function refuse()
                {
                    bu_through_bu.text="不允许爬上自身"
                    throuth_text.visible=false
                    timer.throuth=0
                    isThro=false
                    bu_through.color="#CDCDC1"
                }
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
        Rectangle {//显示扫雷状态（按钮）
            id:bu_mine
            z:10
            x:800
            y:270
            width: 120
            height: 30
            color: "#CDCDC1"
            Text {
                id:bu_mine_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("未开启扫雷    ")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(control)
                    {
                        if(!canMine)
                        {
                            canMine=true
                            bu_mine.color="#00FF00"
                            bu_mine_text.text="已开启扫雷    "
                        }
                        else
                        {
                            canMine=false
                            bu_mine.color="#CDCDC1"
                            bu_mine_text.text="未开启扫雷    "
                        }
                        press_su.play_()
                    }
                }
            }
        }
        Rectangle{//显示移动按钮的按钮
            id:control__bu
            x:800
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
            x:800
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
        Image {//暂停背景蒙版
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
        Image {//暂停按钮
            id: pause_
            x:820
            y:550
            source: "qrc:/images/images/pause_bu.png"
            function true_()
            {
                pause=true
                pause_.source="qrc:/images/images/_pause_bu.png"
                pause_i.visible=true
                timer.running=false
                timer2.running=false
                timer3.running=false
            }
            function false_()
            {
                pause=false
                pause_.source="qrc:/images/images/pause_bu.png"
                pause_i.visible=false
                timer.running=true
                timer2.running=true
                timer3.running=true
            }

            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(pause)
                        pause_.false_()
                    else
                        pause_.true_()
                    press_su.play_()
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
            function show()
            {
                isShow=true
                win.width=900
                sho.source="qrc:/images/images/show_true.png"
            }
            function hide()
            {
                isShow=false
                win.width=800
                sho.source="qrc:/images/images/show_false.png"
            }

            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(sho.source=="qrc:/images/images/show_false.png")
                        sho.show()
                    else
                        sho.hide()
                    press_su.play_()
                }
            }
        }
        Item{//移动按钮
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
        Image {//蛇头
            z:2147483646
            x:200
            y:200
            width: 20
            height: 20
            visible: true
            id: hear
            source: "qrc:/images/images/snack_hear.png"
        }

        Item {//蛇身体
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
                running:false
                onTriggered:{
                    if(throuth>0) timer.throuth--
                    if(throuth<=0)
                        bu_through_bu.refuse()
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
                        isEat=true
                    }
                    else if(snack.a==1)
                    {
                        if(hear.x>0 && (isThro? true:(!isp(hear.x-20,hear.y)))){
                            hear.x-=20
                            body_move(hear.x+20,hear.y,180)
                        }
                        hear.rotation=180
                        isEat=true
                    }
                    else if(snack.s==1)
                    {
                        if(hear.y<580 && (isThro? true:(!isp(hear.x,hear.y+20)))){
                            hear.y+=20
                            body_move(hear.x,hear.y-20,90)
                        }
                        hear.rotation=90
                        isEat=true
                    }
                    else if(snack.d==1)
                    {
                        if(hear.x<780 && (isThro? true:(!isp(hear.x+20,hear.y)))){
                            hear.x+=20
                            body_move(hear.x-20,hear.y,0)
                        }
                        hear.rotation=0
                        isEat=true
                    }
                    if(hear.x==timer2.x0 && hear.y==timer2.y0 && isEat)//吃到食物
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
                            bu_through_bu.allow()
                            break
                        case 20:
                            if(timer.throuth>2147481847)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=1800
                            bu_through_bu.allow()
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
                            bu_through_bu.allow()
                            break
                        case 5:
                            timer.running=false
                            timer2.running=false
                            minesweep()
                            break
                        default:break
                        }
                        l_t.text=(snack.num+3)+"m"
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
                        isNe=true
                        timer2.im.destroy()
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
            else if(event.key===Qt.Key_F12)//f12打开开发者模式
            {
                win.title="SnackQML//开发者模式"
                control=true
                press_su.play_()
            }
            else if(event.key===Qt.Key_Space)//esc打开退出界面
            {
                if(!quit.visible)
                {
                    if(pause)
                    {
                        pause_.false_()
                    }
                    else
                    {
                        pause_.true_()
                    }
                }
                else
                {
                    quit.visible=false
                    pause_.false_()
                }
                press_su.play_()
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
                if(mine_item.visible)
                {
                    timer.running=true
                    timer2.running=true
                    var i,j
                    for(i=0;i<=9;i++)
                        for(j=0;j<=9;j++)
                            blocks[10*i+j].destroy()
                    mine_item.visible=false
                    press_su.play_()
                    isEat=false
                }
                else
                {
                    if(!quit.visible)
                    {
                        quit.visible=true
                        pause=true
                        pause_.source="qrc:/images/images/_pause_bu.png"
                        pause_ic.visible=false
                        pause_i.visible=true
                        timer.running=false
                        timer2.running=false
                        timer3.running=false
                        press_su.play_()
                    }
                    else
                    {
                        quit.visible=false
                        pause=false
                        pause_.source="qrc:/images/images/pause_bu.png"
                        pause_ic.visible=true
                        pause_i.visible=false
                        timer.running=true
                        timer2.running=true
                        timer3.running=true
                        press_su.play_()
                    }
                }
                press_su.play_()
            }
            else if(event.key===Qt.Key_Enter && quit.visible)
            {
                Qt.quit()
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
                press_su.play_()
            }
            else if(event.key===Qt.Key_F2 &&control)
            {
                if(timer.throuth>0)
                {
                    bu_through_bu.refuse()
                }
                else
                {
                    timer.throuth=2147483647
                    bu_through_bu.allow()
                }
                press_su.play_()
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
                    lxj_m=0.1
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
                    lxj_m=0.45
                    high_text.visible=false
                }
                press_su.play_()
            }
            else if(event.key===Qt.Key_F5 &&control)
            {
                im_type=0
                var image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);
                x0=image.x=parseInt(Math.random()*40)*20
                y0=image.y=parseInt(Math.random()*30)*20
                c++
                press_su.play_()
            }
            else if(event.key===Qt.Key_F4 &&control)
            {
                if(canMine)
                {
                    canMine=false
                    bu_mine.color="#CDCDC1"
                    bu_mine_text.text="未开启扫雷    "
                }
                else
                {
                    canMine=true
                    bu_mine.color="#00FF00"
                    bu_mine_text.text="已开启扫雷    "
                }
                press_su.play_()
            }
            else if(event.key===Qt.Key_F6 &&control)
            {
                if(mine_item.height==330)
                {
                    mine__x.visible=false
                    mine__y.visible=false
                    mine_item.height=290
                }
                else
                {
                    mine__x.visible=true
                    mine__y.visible=true
                    mine_item.height=330
                }
                press_su.play_()
            }
            else if(event.key===Qt.Key_F7)
            {
                if(win.visibility==Window.Windowed)
                {
                    donot=false
                    win.visibility=Window.FullScreen
                    photo.visible=true
                    photo.x=(win.width-win.height)/2
                    photo.width=win.height
                    photo.height=win.height
                    pppp.running=true
                }
                else
                {
                    donot=true
                    win.visibility=Window.Windowed
                    photo.visible=false
                    pppp.running=true
                }
            }
            else if(event.key===Qt.Key_Tab)//显示面板
            {
                if(isShow)
                    sho.hide()
                else
                    sho.show()
                press_su.play_()
            }
        }
    }
    Image{//扫雷界面
        source: "qrc:/images/images/back_null.png"
        visible:false
        id:mine_item
        width: 220
        height: 300
        x:290
        y:150
        MouseArea{
            x:10
            y:10
            width: 220
            height: 220
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onMouseXChanged: {
                mine_x.text="x:"+mouseX
            }
            onMouseYChanged: {
                mine_y.text="y:"+mouseY
            }

            onClicked: {
                if (mouse.button==Qt.RightButton)
                    flags[parseInt((mouseX)/20)*10+parseInt((mouseY)/20)].visible=true
                else if(mouse.button==Qt.LeftButton)
                {
                    hide_blocks--
                    var b=(mouseX-(mouseX)%20)/20
                    var a=(mouseY-(mouseY)%20)/20
                    var i=b*10+a
                    if(blocks[i].visible==true)
                    {
                        if(blocks[i].mine==1)
                        {
                            mine_w_l_text.text="失败"
                            addcent-=10
                        }
                        else
                        {
                            var t=0
                            if(a>0)
                                t+=mine[(a-1)*10+b]
                            if(a<9)
                                t+=mine[(a+1)*10+b]
                            if(b>0)
                                t+=mine[a*10+(b-1)]
                            if(b<9)
                                t+=mine[a*10+(b+1)]
                            if(a>0 && b>0)
                                t+=mine[(a-1)*10+b-1]
                            if(a>0 && b<9)
                                t+=mine[(a-1)*10+b+1]
                            if(a<9 && b>0)
                                t+=mine[(a+1)*10+b-1]
                            if(a<9 && b<9)
                                t+=mine[(a+1)*10+b+1]
                            if(t>0)
                            {
                                var mun=Qt.createQmlObject("import QtQuick 2.14; Image{z:5678;source:'qrc:/num/images/"+t+".png';width:20;height:20}", mine_item);
                                mun.x=b*20+10
                                mun.y=a*20+10
                                mun.visible=true
                            }
                            addcent+=1
                        }
                        blocks[i].visible=false
                        hide_blocks--
                        if(hide_blocks==mines)
                        {
                            mine_w_l_text.text="获胜"
                            addcent+=20
                        }
                    }
                }
            }
        }

        Rectangle {//关闭扫雷界面按钮
            id:mine_quit_bu
            z:10
            x:10
            y:230
            width: 90
            height: 50
            color: "#EEEE00"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("关闭")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    timer.running=true
                    timer2.running=true
                    var i,j
                    for(i=0;i<=9;i++)
                        for(j=0;j<=9;j++)
                            blocks[10*i+j].destroy()
                    mine_item.visible=false
                    press_su.play_()
                    isEat=false
                    timer2.im.destroy()
                }
            }
        }
        Rectangle {//显示扫雷状态
            z:10
            x:120
            y:230
            width: 90
            height: 50
            color: "#EEEE00"
            Text {
                id:mine_w_l_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("扫雷中")
            }
        }
        Rectangle {//显示鼠标x坐标
            visible: false
            id:mine__x
            z:10
            x:10
            y:290
            width: 50
            height: 30
            color: "#EEEE00"
            Text {
                id:mine_x
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("x:0")
            }
        }
        Rectangle {//显示鼠标y坐标
            visible: false
            id:mine__y
            z:10
            x:110
            y:290
            width: 50
            height: 30
            color: "#EEEE00"
            Text {
                id:mine_y
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("y:0")
            }
        }
    }

    Image{//退出确认界面
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
                            press_su.play_()
                        }
                    }
                }
            }
        }
    }

    Item {//彩蛋
        id:winn
        width: 1366
        height: 700
        z:9999
        visible: false;
        Component.onCompleted: {
            file_q_source="C:/Users/"+file_q.getUser()+"/AppData/Local/Green_Game_m"
            file_q.create(file_q_source)
            file_q.source=file_q_source+"/game.ff"
            if(file_q.is(file_q.source))
            {

                file_q.source=file_q_source+"/x.ff"
                item2_back.x=Number(file_q.read())
                file_q.source=file_q_source+"/y.ff"
                item2_back.y=Number(file_q.read())
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

        //背景
        Image {
            width: winn.width
            height: winn.height
            visible:true
            source:"qrc:/i/i/back.png"
        }
        //控制事件
        Timer {
            function mant(){
                if(tank.source=="qrc:/i/i/artillery1.png")
                    tank.source="qrc:/i/i/artillery2.png"
                else
                    tank.source="qrc:/i/i/artillery1.png"
            }

            function ifw(){
                var ra= (tank.rotation-90)*Math.PI/180;
                var a=item2_back.x-Math.cos(ra) * 1;
                if(a<=tank.x && a>=(tank.x-2000+tank.width*Math.cos(ra)))
                    item2_back.x=a
                a=item2_back.y-Math.sin(ra) * 1;
                if(a<=tank.y && a>=(tank.y-1400+Math.sin(ra) * tank.height))
                    item2_back.y=a
            }
            function ifs(){
                var ra= (tank.rotation-90)*Math.PI/180;
                var a=item2_back.x+Math.cos(ra) * 0.6;
                if(a<=tank.x && a>=(tank.x-2000+tank.width*Math.cos(ra)))
                    item2_back.x=a
                a=item2_back.y+Math.sin(ra) * 0.6;
                if(a<=tank.y && a>=(tank.y-1400+Math.sin(ra) * tank.height))
                    item2_back.y=a
            }
            function ifa(){
                     tank.rotation-=0.5;
            }
            function ifd(){
                    tank.rotation+=0.5;
            }
            id: timer0;
            interval: 20;
            repeat: true;
            running:false;
            onTriggered:{
                var ra= (tank.rotation-90)*Math.PI/180;
                //坦克移动，转向
                if(last=="w"){
                    if(w==1 && s==1 && a==0 && d==0)
                    {
                        tttt++
                        mant()
                        last="w"
                        ifs()
                    }
                    else if(w==1 && ( a==1 || d==1 ) && s==0)
                    {
                        tttt++
                        mant()
                        last="w"
                        ifw()
                        if(a==1)
                            ifa()
                        else
                            ifd()
                    }
                    else if(w==1)
                    {
                        tttt++
                        mant()
                        last="w"
                        ifw()
                    }
                    else if(s==1)
                    {
                        tttt++
                        mant()
                        last="s"
                        ifs()
                    }
                    else if(a==1)
                    {
                        tttt++
                        mant()
                        last="a"
                        ifa()
                    }
                    else if(d==1)
                    {
                        tttt++
                        mant()
                        last="d"
                        ifd()
                    }
                }
                else if(last=="s"){
                    if(s==1 && w==1 && a==0 && d==0)
                    {
                        tttt++
                        mant()
                        last="s"
                        ifw()
                    }
                    else if(s==1 && ( a==1 || d==1 ) && w==0)
                    {
                        tttt++
                        mant()
                        ifs()
                        last="s"
                        if(a==1)
                            ifa()
                        else
                            ifd()
                    }
                    else if(w==1)
                    {
                        tttt++
                        mant()
                        last="w"
                        ifw()
                    }
                    else if(s==1)
                    {
                        tttt++
                        mant()
                        last="s"
                        ifs()
                    }
                    else if(a==1)
                    {
                        tttt++
                        mant()
                        last="a"
                        ifa()
                    }
                    else if(d==1)
                    {
                        tttt++
                        mant()
                        last="d"
                        ifd()
                    }
                }
                else if(last=="a"){
                    if(a==1 && d==1 && w==0 && s==0)
                    {
                        tttt++
                        mant()
                        last="a"
                        ifd()
                    }
                    else if(a==1 && ( w==1 || s==1 ) && d==0)
                    {
                        tttt++
                        mant()
                        ifa()
                        last="a"
                        if(w==1)
                            ifw()
                        else
                            ifs()
                    }
                    else if(w==1)
                    {
                        tttt++
                        mant()
                        last="w"
                        ifw()
                    }
                    else if(s==1)
                    {
                        tttt++
                        mant()
                        last="s"
                        ifs()
                    }
                    else if(a==1)
                    {
                        tttt++
                        mant()
                        last="a"
                        ifa()
                    }
                    else if(d==1)
                    {
                        tttt++
                        mant()
                        last="d"
                        ifd()
                    }
                }
                else if(last=="d"){
                    if(d==1 && a==1 && w==0 && s==0)
                    {
                        tttt++
                        mant()
                        last="d"
                        ifa()
                    }
                    else if(d==1 && ( w==1 || s==1 ) && a==0)
                    {
                        tttt++
                        mant()
                        ifd()
                        last="d"
                        if(w==1)
                            ifw()
                        else
                            ifs()
                    }
                    else if(w==1)
                    {
                        tttt++
                        mant()
                        last="w"
                        ifw()
                    }
                    else if(s==1)
                    {
                        tttt++
                        mant()
                        last="s"
                        ifs()
                    }
                    else if(a==1)
                    {
                        tttt++
                        mant()
                        last="a"
                        ifa()
                    }
                    else if(d==1)
                    {
                        tttt++
                        mant()
                        last="d"
                        ifd()
                    }
                }
                if(w==0 && s==0)
                {
                    ba.source="qrc:/b/i/but/left.svg"
                    bd.source="qrc:/b/i/but/right.svg"
                }
                if(a==0 && d==0)
                {
                    bw.source="qrc:/b/i/but/front.svg"
                    bs.source="qrc:/b/i/but/behi.svg"
                }
                //切换弹药类型
                if(r==1)
                {
                    r=0
                    if(br.iss==0)
                    {
                        br.iss=1
                        br.source="qrc:/b/i/but/bilbil.svg"
                    }
                    else
                    {
                        br.iss=0
                        br.source="qrc:/b/i/but/tobol.svg"
                    }
                }
                //炮塔转向
                if(issh==0)
                {
                    if(llst=="q")
                    {
                        if(q==1 && e==1)
                        {
                            tank_top.rotation+=0.4
                            llst="q"
                        }
                        else if(q==1)
                        {
                            tank_top.rotation-=0.4
                            llst="q"
                        }
                        else if(e==1)
                        {
                            tank_top.rotation+=0.4
                            llst="e"
                        }
                    }
                    else  if(llst=="e")
                    {
                        if(q==1 && e==1)
                        {
                            tank_top.rotation-=0.4
                            llst="e"
                        }
                        else if(q==1)
                        {
                            tank_top.rotation-=0.4
                            llst="q"
                        }
                        else if(e==1)
                        {
                            tank_top.rotation+=0.4
                            llst="e"
                        }
                    }
                }
                else
                {
                    q==0
                    e==0
                }
                //射击 space
                if(ts>0)
                {
                    ts--;
                    tex.text=qsTr("装弹："+ts+"ms")
                }
                else if(sp==1)
                {
                    sp=0;
                    bsp.source="qrc:/b/i/but/space2.svg"
                    bq.source="qrc:/b/i/but/left2_n.svg"
                    be.source="qrc:/b/i/but/right2_n.svg"
                    if(br.iss==0)
                    {
                        ts=150;
                        creata_b()
                    }
                    else
                    {
                        ts=200
                        creatprs()
                    }
                }
                else
                {
                    bsp.iss=0
                    bsp.source="qrc:/b/i/but/space.svg"
                }
                file_q.source=file_q_source+"/x.ff"
                file_q.write(item2_back.x.toString())
                file_q.source=file_q_source+"/y.ff"
                file_q.write(item2_back.y.toString())
                file_q.source=file_q_source+"/1.ff"
                file_q.write(tank.rotation.toString())
                file_q.source=file_q_source+"/2.ff"
                file_q.write(tank_top.rotation.toString())
            }
        }

        //单位选择视图
        Item {
            id:item_ch
            width: winn.width
            height:winn.height
            x:0
            y:0
            visible: false
            property int type_ch:1
            Image {
                id:ch_tank
                source: "qrc:/i/i/artillery1.png"
                width: 58
                height: 76
                x:(winn.width-width)/2
                y:(winn.height-height)/2
                Image {
                    id: ch_tank_top
                    width: 26;
                    height: 130;
                    x: 16
                    y:-25
                    source: "qrc:/i/i/artillery_turret.png"
                }
            }
            //上一个
            Image {
                id:ch_last
                width: 80
                height:400
                x:0
                y:(winn.height-400)/2
                source: "qrc:/b/i/but/ch_last.svg"
            }
            //下一个
            Image {
                id: ch_next
                width: 80
                height:400
                x:winn.width-80
                y:(winn.height-400)/2
                source: "qrc:/b/i/but/ch_next.svg"
            }
            //开始按钮
            Image {
                id: ch_done
                x:winn.width-width-10
                y:winn.height-height-10
                source: "qrc:/b/i/but/start.svg"
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        wclick(ch_done,function(){
                            cet.startl(1,function(){
                                item_ch.visible=false;
                                item2.visible=true;})
                            timer.start()
                            item2.forceActiveFocus()
                            timer.running=true;
                        })
                    }
                    onEntered: {
                    }
                }
            }
            //返回
            Image {
                id: ch_exit
                x:10
                y:winn.height-height-10
                source: "qrc:/b/i/but/mune.svg"
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        wclick(ch_exit,function(){
                            cet.startl(1,function(){
                                item_ch.visible=false;
                                item1.visible=true;})
                            item1.forceActiveFocus()
                        })
                    }
                }
            }
        }
        //开始视图
        Item {
            id: item1
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
                anchors.centerIn:item1;
            }
            //开始按钮
            Image {
                id:start_bu_q
                y: (winn.height-height)/2
                visible: true;
                source: "qrc:/b/i/but/start.svg"
                anchors.centerIn: item1;
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        wclick(start_bu_q,function(){
                            cet.startl(1,function(){
                                item1.visible=false;
                                item_ch.visible=true;})
                            timer0.start()
                            item2.forceActiveFocus()
                            timer0.running=true;
                        })

                    }
                }
            }
            //退出按钮
            Image {
                id: exit_q
                source: "qrc:/b/i/but/exit.svg"
                x:(winn.width-width)/2
                y:setting.y+75
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        is_ag=false
                        winn.visible=false
                        win.width=900
                        win.height=600
                        start_item.visible=true
                        item.focus=true
                    }
                }
            }
            //设置按钮
            Image {
                id: setting
                source: "qrc:/b/i/but/setting.svg"
                x:(winn.width-width)/2
                y:start_bu_q.y+75
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        wclick(setting,function(){
                            item3.visible=true
                        })

                    }
                }
            }
        }

        //游戏视图
        Item {
            id:item2;
            visible: false;
            anchors.fill: parent
            rotation: 0
            focus: true;
            //背景
            Item {
                id: item2_back
                x:0
                y:0
                visible: true
                width: 2000
                height: 1400;
                Image {
                    width: 2000
                    height: 1400;
                    source: "qrc:/i/i/playing.png"
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
                            //console.log("st")
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
                                bq.source="qrc:/b/i/but/left2.svg"
                                be.source="qrc:/b/i/but/right2.svg"
                                bsp
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
                                bq.source="qrc:/b/i/but/left2.svg"
                                be.source="qrc:/b/i/but/right2.svg"
                                bsp
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
                    source:"qrc:/ex/i/explo1/f1.png"
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
                                fir.source="qrc:/ex/i/explo1/f1.png"
                                break
                            case 6:
                                fit.ty=7
                                fir.source="qrc:/ex/i/explo1/f2.png"
                                break
                            case 7:
                                fit.ty=8
                                fir.source="qrc:/ex/i/explo1/f3.png"
                                break
                            case 8:
                                fit.ty=9
                                fir.source="qrc:/ex/i/explo1/f4.png"
                                break
                            default:
                                fit.ty=0
                                fir.visible=false
                            }
                        }
                    }
                }
            }
            //装弹进度
            Image {
                x:70
                y:10
                width: 180
                height: 50
                source: "qrc:/i/i/tt.png"
                Text {
                            id: tex
                            text: qsTr("装弹：0s")
                            anchors.centerIn: parent
                            font.pixelSize:30
                        }
                }

            //炮弹类型图标兼切换按钮
            Image {
                id:br
                width:84
                height: 59
                x:winn.width-90
                y:10
                source:"qrc:/b/i/but/tobol.svg"
                visible: true
                property int iss:0
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onPressed: {
                        r=1
                    }
                }
            }
            //设置按钮
            Image {
                id: pece
                source: "qrc:/b/i/but/pause.png"
                x:10
                y:10
                width: 50
                height: 50
                MouseArea {
                    anchors.fill: parent;
                    z: 2
                    onClicked: {
                        item3.visible=true
                        item3.forceActiveFocus()
                        exit_q2.visible=true
                        menu.visible=true
                    }
                }
            }
            //键盘事件
            Keys.onPressed:{
                if(event.key===Qt.Key_A)
                    a=1;
                else if(event.key===Qt.Key_D)
                    d=1;
                else if(event.key===Qt.Key_W)
                    w=1;
                else if(event.key===Qt.Key_S)
                    s=1;
                else if(event.key===Qt.Key_Q)
                    q=1;
                else if(event.key===Qt.Key_E)
                    e=1;
                else if(event.key===Qt.Key_Space)
                    sp=1;
                else if(event.key===Qt.Key_R)
                    r=1
                else if(event.key===Qt.Key_Escape)
                {
                    item3.visible=true
                    item3.forceActiveFocus()
                    exit_q2.visible=true
                    timer0.stop()
                    menu.visible=true
                    a=d=w=s=q=e=sp=0
                }
            }
            Keys.onReleased: {
                if(event.key===Qt.Key_A)
                    a=0;
                else if(event.key===Qt.Key_D)
                    d=0;
                else if(event.key===Qt.Key_W)
                    w=0;
                else if(event.key===Qt.Key_S)
                    s=0;
                else if(event.key===Qt.Key_Q)
                    q=0;
                else if(event.key===Qt.Key_E)
                    e=0;
                else if(event.key===Qt.Key_Space)
                    sp=0
            }
            //按钮
            Item {
                id:item_bu
                x:0
                y:0
                visible: true
                width: 1000
                height: 700
                Image {
                    id:bw
                    width: 62
                    height: 74
                    x:100
                    y:winn.height-180
                    source: "qrc:/b/i/but/front.svg"
                    visible: true
                    MouseArea {
                        anchors.fill: parent;
                        z: 1
                        Timer {
                            interval : 40;
                            repeat : true;
                        }
                        onPressed: {
                            var a=bw
                            a.width=53
                            a.height=60
                            a.x+=4.4
                            a.y+=7
                            w=1
                        }
                        onReleased: {
                            var a=bw
                            a.width=62
                            a.height=74
                            a.x-=4.4
                            a.y-=7
                            w=0
                        }
                    }
                }
                Image {
                    id:ba
                    width: 74
                    height: 62
                    x:10
                    y:winn.height-86
                    source: "qrc:/b/i/but/left.svg"
                    visible: true
                    MouseArea {
                        anchors.fill: parent;
                        z: 1
                        onPressed: {
                            var ai=ba
                            ai.width=60
                            ai.height=53
                            ai.x+=7
                            ai.y+=4.4
                            a=1
                        }
                        onReleased: {
                            var ai=ba
                            ai.width=74
                            ai.height=62
                            ai.x-=7
                            ai.y-=4.4
                            a=0
                        }
                    }
                }
                Image {
                    id:bs
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
                            var a=bs
                            a.width=53
                            a.height=60
                            a.x+=4.4
                            a.y+=7
                            s=1
                        }
                        onReleased: {
                            var a=bs
                            a.width=62
                            a.height=74
                            a.x-=4.4
                            a.y-=7
                            s=0
                        }
                    }
                }
                Image {
                    id:bd
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
                            var a=bd
                            a.width=60
                            a.height=53
                            a.x+=7
                            a.y+=4.4
                            d=1
                        }
                        onReleased: {
                            var a=bd
                            a.width=74
                            a.height=62
                            a.x-=7
                            a.y-=4.4
                            d=0
                        }
                    }
                }
                Image {
                    id:bq
                    width: 74
                    height: 58
                    x:winn.width-194
                    y:winn.height-140
                    source: "qrc:/b/i/but/left2.svg"
                    visible: true
                    MouseArea {
                        anchors.fill: parent;
                        z: 1
                        onPressed: {
                            if(bq.source=="qrc:/b/i/but/left2_n.svg")
                                return
                            var a=bq
                            a.width=60
                            a.height=47
                            a.x+=7
                            a.y+=5.5
                            q=1
                        }
                        onReleased: {
                            var a=bq
                            a.width=74
                            a.height=58
                            a.x-=7
                            a.y-=5.5
                            q=0
                        }
                    }
                }
                Image {
                    id:be
                    width: 74
                    height: 58
                    x:winn.width-86
                    y:winn.height-140
                    source: "qrc:/b/i/but/right2.svg"
                    visible: true
                    MouseArea {
                        anchors.fill: parent;
                        z: 1
                        onPressed: {
                            if(bq.source=="qrc:/b/i/but/left2_n.svg")
                                return
                            var a=be
                            a.width=60
                            a.height=47
                            a.x+=7
                            a.y+=5.5
                            e=1
                        }
                        onReleased: {
                            var a=be
                            a.width=74
                            a.height=58
                            a.x-=7
                            a.y-=5.5
                            e=0
                        }
                    }
                }
                Image {
                    id:bsp
                    width: 158
                    height: 67
                    x:winn.width-183
                    y:winn.height-70
                    source: "qrc:/b/i/but/space.svg"
                    visible: true
                    property int iss:0
                    MouseArea {
                        anchors.fill: parent;
                        z: 1
                        onPressed: {
                            if(bsp.iss==0)
                            {
                                sp=1
                                bsp.iss=1
                                bsp.source="qrc:/b/i/but/space2.svg"
                            }
                        }
                    }
                }
            }
        }

        //设置界面
        Item {
            id: item3
            width: 600
            height: 600
            x:(winn.width-width)
            y:(winn.height-height)
            visible: false
            z:1
            anchors.centerIn:item1;
            //背景
            Image {
                id: back1
                width: 600
                height: 600
                source: "qrc:/i/i/back2.png"
            }
            //退出设置按钮
            Image {
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
                        if(item2.visible==true)
                        {
                            item3.visible=false
                            exit_q2.visible=false
                            item2.forceActiveFocus()
                            timer0.start()
                        }
                        else
                            item3.visible=false
                    }
                }
            }
            //显示控制按钮设置文字
            Text {
                x:60
                y:50
                id: tx
                text: qsTr("显示控制按钮")
                color:"#00FF00"
                font.pixelSize:30
            }
            //显示设置按钮设置按钮
            Image {
                id:bss
                x:260
                y:40
                source: "qrc:/b/i/but/noo.png"
                visible: true
                property int issss
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked:{
                            if(bss.source=="qrc:/b/i/but/yes.png")
                            {
                                creatbol(275.5,56.5,item3)
                                bss.source="qrc:/b/i/but/noo.png"
                                item_bu.visible=false
                                item2.forceActiveFocus()
                            }
                            else
                            {
                                bss.source="qrc:/b/i/but/yes.png"
                                item_bu.visible=true
                                item2.forceActiveFocus()
                            }
                    }
                }
            }
            //退出游戏按钮
            Image {
                id: exit_q2
                visible: false
                source: "qrc:/b/i/but/exit.svg"
                x:10
                y:item3.height-height
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        is_ag=false
                        winn.visible=false
                        win.width=900
                        win.height=600
                        start_item.visible=true
                        item.focus=true
                    }
                }
            }
            //返回主菜单按钮
            Image {
                id: menu
                visible: false
                source: "qrc:/b/i/but/mune.svg"
                x:item3.width-10-width
                y:item3.height-height
                MouseArea {
                    anchors.fill: parent;
                    z: 1
                    onClicked: {
                        wclick(exit_q,function(){
                            cet.startl(2,function(){
                                item2.visible=false
                                item3.visible=false
                                exit_q2.visible=false
                                menu.visible=false
                                item1.visible=true
                                timer.stop()
                                ts=0
                                issh=0
                                br.iss=0
                                tex.text=qsTr("装弹："+ts+"ms")
                                br.source="qrc:/b/i/but/tobol.svg"
                            })
                        })
                    }
                }
            }
            Keys.onPressed:{
                if(event.key===Qt.Key_Escape)
                {
                    item3.visible=false
                    exit_q2.visible=false
                    item2.forceActiveFocus()
                    timer0.start()
                }
            }
        }
        //切换特效
        Image {
            id: witer
            source: "qrc:/i/i/witer.png"
            x:0
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

                id:cet
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
        function wclick(ptr,fun){
            var i=0
            var j=0.95
            var x0=ptr.x,y0=ptr.y,w0=ptr.width,h0=ptr.height
            var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
            t1.interval = 40;
            t1.repeat = true
            t1.triggered.connect(function(){
                i++
                /*ptr.x+=ptr.width*(1-j)
                ptr.y+=ptr.height*(1-j)
                ptr.width*=j
                ptr.height*=j*/
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
    }
    function wclick(ptr,fun){
        var i=0
        var j=0.95
        var x0=ptr.x,y0=ptr.y,w0=ptr.width,h0=ptr.height
        var t1 = Qt.createQmlObject("import QtQuick 2.12; Timer {}",winn);
        t1.interval = 40;
        t1.repeat = true
        t1.triggered.connect(function(){
            i++
            /*ptr.x+=ptr.width*(1-j)
            ptr.y+=ptr.height*(1-j)
            ptr.width*=j
            ptr.height*=j*/
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

}
