import QtQuick
Image{
    width: 900
    height:600
    property int centl:0
    property int t
    source:"qrc:/images/images/pause.png"
    function show(cent,time)
    {
        visible=true
        centl=cent
        t=time
    }
    Image {
        x:400
        y:245
        width: 100
        height:110
        source:"qrc:/images/images/pause.png"
        Text{
            x:10
            y:10
            color:"#FF0000"
            text:"游戏失败"
            font.pixelSize: 20
        }
        Text{
            x:10
            y:40
            text:"分数："+centl
            font.pixelSize: 20
        }
        Text{
            x:10
            y:70
            text:"用时："+t
            font.pixelSize: 20
        }
    }
}


