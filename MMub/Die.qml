import QtQuick

Window {
    property int centl:0
    property int t
    width: 100
    height:60
    function show(cent)
    {
        centl=cent
    }

    Text{
        text:"游戏失败\n分数："+centl
        font.pixelSize: 20
    }
}
