import QtQuick
import GFile

Rectangle{
    property var file
    property var par
    property string num:""
    property int n
    property bool type:true
    border.width: 1
    border.color: "#80808080"
    width: 140
    height: 20
    GFile{
        id:afile
    }
    z:-1
    function setc(ss)
    {
        afile.source=ss
        var s=afile.read(),r_,g_,b_,a_
        r_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        g_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        b_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        a_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        sr1.color=Qt.rgba(r_,g_,b_,a_)                                    //文字颜色
        r_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        g_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        b_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        a_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        sr2.color=Qt.rgba(r_,g_,b_,a_)                                    //边框颜色
        r_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        g_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        b_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        a_=s.slice(0,s.indexOf(","))
        s=s.slice(s.indexOf(",")+1,s.length)
        sr3.color=Qt.rgba(r_,g_,b_,a_)
    }

    Timer{
        interval: 10
        onTriggered:setc("./file/saves/"+num+".txt")
        repeat: false
        running: true
    }

    Text{
        x:22
        text:num
        font.pixelSize: 15
    }
    Item{
        x:1
        y:1
        width: 18
        height: 18
        Grid {
            id: background
            anchors.fill: parent
            rows: 7
            columns: 7
            clip: true
            Repeater {
                model: parent.columns * parent.rows
                Rectangle {
                    width: 3
                    height: width
                    color: (index % 2 == 0) ? "gray" : "transparent"
                }
            }
        }
        Rectangle{
            id:sr1
            width: 6
            height: 18
        }
        Rectangle{
            id:sr2
            width: 6
            height: 18
            x:6
        }
        Rectangle{
            id:sr3
            width: 6
            height: 18
            x:12
        }
    }
    ImaButton{
        id:b1
        x:80
        radiusBg: 0
        colorBorder: "#00000000"
        width: 18
        height: 18
        y:1
        img:"./images/reset.png"
        toolTipText: "加载"
        onClicked: file.read2("./file/saves/"+num+".txt")
    }
    ImaButton{
        id:b2
        x:100
        radiusBg: 0
        colorBorder: "#00000000"
        width: 18
        height: 18
        y:1
        img:"./images/save.png"
        toolTipText:  "保存"
        onClicked: {
            file.save2("./file/saves/"+num+".txt")
            setc("./file/saves/"+num+".txt")
        }
    }
    ImaButton{
        id:b3
        x:120
        radiusBg: 0
        colorBorder: "#00000000"
        width: 18
        height: 18
        y:1
        img:"./images/del.png"
        toolTipText:  "删除"
        onClicked: {
            afile.del()
            par.remove(n)
        }
    }
}
