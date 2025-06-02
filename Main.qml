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
        id:_Bg
        width: win.width
        height: win.height
        x:0
        y:0
        source: "./images/back_load.png"
        function reset(type_,source_=source)
        {
            source = ""
            Qt.callLater(() => source = source_)
            var sw=sourceSize.width,sh=sourceSize.height
            switch(type_)
            {
            case 1:
                if(sh/sw>win.height/win.width)
                {
                    width=win.width
                    height=width*(sh/sw)
                    x=0
                    y=(win.height-height)/2
                }
                else if(sh/sw<win.height/win.width)
                {
                    height=win.height
                    width=height*(sw/sh)
                    x=(win.width-width)/2
                    y=0
                }
                break
            case 2:
                if(sh/sw<win.height/win.width)
                {
                    width=win.width
                    height=width*(sh/sw)
                    x=0
                    y=(win.height-height)/2
                }
                else if(sh/sw>win.height/win.width)
                {
                    height=win.height
                    width=height*(sw/sh)
                    x=(win.width-width)/2
                    y=0
                }
                break
            default:
                _Bg.width=win.width
                _Bg.height=win.height
                x=y=0
            }
        }
    }
    Start{
        id:start_item
        anchors.fill:parent
    }
    Start_set{
        id:start_set
    }
    SaveLoader{
        id:saveLoader
    }

    Playing{
        id:item
    }
    Help{
        id:help
    }
    Setting{
        id:setting
    }
}
