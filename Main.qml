pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import GFile
import QtMultimedia

ApplicationWindow {
    id:win
    //opacity: 0.1
    property string filel       //用于处理文件操作
    property bool $doud:true     //是否开启音效
    property bool donot:true
    property bool canStart:false
    property bool commom:false
    property bool pausen:false
    property var $win:win
    property var $item:item
    property bool $enMode:false
    property int $fast
    property int $through
    property int $control
    visible: true
    minimumHeight: 600
    maximumHeight: 600
    minimumWidth: 900
    maximumWidth: 900
    width: 900
    height: 600
    title: "SnackQML"
    function next(code)
    {
        switch(code)
        {
        case 0:start_item.enabled=true
            break;
        case 1:start_set.enabled=true
            break;
        case 2:item.enabled=true
            break;
        }
    }

    GFile{
        id:file
    }
    SoundEffect{//按键音效
        id:press_su
        source: "./raw/click.wav"
        function play_()
        {
            if($doud) press_su.play()
        }
    }
    SoundEffect{//吃到食物音效
        id:move_ea
        source: "./raw/eat.wav"
    }
    Image{
        anchors.fill: parent
        source: "./images/back_load.png"
    }
    Start{
        id:start_item
        anchors.fill:parent
    }
    Start_set{
        id:start_set
    }
    Playing{
        id:item
    }
    Help{
        id:help
    }
}
