pragma ComponentBehavior: Bound

import QtQuick 2.14
import QtQuick.Controls 2.14
import GFile 1.2
import QtMultimedia
import "./MMub"

ApplicationWindow {
    id:win
    //opacity: 0.1
    property string filel       //用于处理文件操作
    property bool doud:true     //是否开启音效
    //不同种类食物生成概率（上一概率值减当前概率值为实际概率）普通食物实际概率=0.55
    property bool donot:true
    property bool canStart:false
    property bool commom:false
    property bool pausen:false
    visible: true
    width: 900
    height: 600
    title: "SnackQML"
    function set_item(item_a,item_b,fun_1,fun_2){
        var timer = Qt.createQmlObject("import QtQuick 2.14; Timer {}", win);
        timer.repeat = true;
        timer.interval = 10;
        timer.triggered.connect(function(){
            if(item_a.opacity>0)
                item_a.opacity-=0.01
            else
            {
                fun_1()
                item_a.visible=false
                item_b.visible=true
                triggered.connect(function(){
                    if(item_b.opacity<1)
                        item_b.opacity+=0.01
                    else
                    {
                        fun_2()
                        this.destroy()
                    }
                })
            }
        })
    }
    function set_type_play(var_){
        if(var_===1)
        {
            lxj_s=0.95
            lxj_ss=0.8
            lxj_t=0.75
            lxj_tt=0.6
            lxj_h=0.4
            lxj_st=0.2
            lxj_m=0.1
            commom=false
            set_bu_fast.visible=true
            set_bu_mine.visible=true
            set_bu_th.visible=true
            high_text.color="#FF0000"
            h_t.text="高概率模式"
            set_bu_high.color="#FF0000"
            set_bu_high_text.text="高\n概\n率\n模\n式"
            bu_through.visible=true
            bu_mine.visible=true
        }
        else if(var_===2)
        {
            lxj_s=0.85
            lxj_ss=0.8
            lxj_t=0.7
            lxj_tt=0.67
            lxj_h=0.6
            lxj_st=0.55
            lxj_m=0.45
            set_bu_fast.visible=true
            set_bu_mine.visible=true
            set_bu_th.visible=true
            commom=false
            high_text.color="#00EEEE"
            h_t.text="普通模式"
            set_bu_high.color="#00EEEE"
            set_bu_high_text.text="普\n通\n模\n式"
            bu_through.visible=true
            bu_mine.visible=true
        }
        else
        {
            high_text.color="#00FF00"
            h_t.text="经典模式"
            set_bu_high.color="#00FF00"
            set_bu_high_text.text="经\n典\n模\n式"
            set_bu_fast.visible=false
            set_bu_mine.visible=false
            set_bu_th.visible=false
            commom=true
            lxj_s=0.85
            lxj_ss=0.8
            lxj_t=0.7
            lxj_tt=0.67
            lxj_h=0.6
            lxj_st=0.55
            lxj_m=0.45
            timer.fast=0
            timer.throuth=0
            isThro=false
            bu_through.visible=false
            bu_mine.visible=false
        }
    }
        //禁止窗口大小调整（人机的方法：当用户调整窗口大小时修改窗口大小为设定大小）
    onWidthChanged: {
        if(donot)
            win.width=900
    }
    onHeightChanged: {
        if(donot)
            win.height=600
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
    Image{
        anchors.fill: parent
        source: "qrc:/images/images/back_load.png"
        Image{
            anchors.fill: parent
            source: "qrc:/images/images/pause.png"
        }
    }

    Load{
        id:load_item
    }

    Playing{
        id:item
    }
    Start{
        id:start_item
    }

    Photo_s{
        id:photo
    }

    Help{
        id:help
    }
    Greengame{
        id:winn
    }
    Start_set{
        id:start_set
    }
}
