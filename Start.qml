import QtQuick

Item{//开始界面
    id:root
    enabled: false
    property int next_type:0
    property bool next:false
    onEnabledChanged:{
        if(enabled)
        {
            root.opacity=1
            root.visible=true
        }
    }
    NumberAnimation  on opacity {
        running: next
        duration: 1350
        easing.type: Easing.InOutQuad
        easing.overshoot: 1.0
        to: 0
        onStopped: {
            switch(next_type)
            {
            case -1:Qt.exit(0);
            case 1:
                root.enabled=false
                root.visible=false
                next=false
                $win.next(2)
                break
            case 0:;
            }
            root.enabled=false
            root.visible=false
            next=false
            $win.next(1)
        }
    }
    Timer{
        interval: 500
        running: true
        repeat: false
        onTriggered: root.enabled=true
    }
    Image{
        source: "./images/title.png"
        anchors.centerIn: parent
        NumberAnimation  on anchors.verticalCenterOffset {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: -100
        }
    }
    Cbutton{
        NumberAnimation  on opacity {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 1.0
        }
        NumberAnimation  on opacity {
            running: next
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 0
        }
        radiusBg: 10
        type:4
        width: 150
        height: 50
        text: $enMode?"Start":"开始游戏"
        font.pixelSize: 25
        anchors.centerIn: parent
        colorBg_common: "#EEEE00"
        colorBg_down: "#DDDD00"
        colorBg_hovered: "#FFFF00"
        opacity: 0
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked: {
            next_type=0
            next=true
        }
    }
    Cbutton{
        NumberAnimation  on opacity {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 1.0
        }
        NumberAnimation  on opacity {
            running: next
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 0
        }
        radiusBg: 10
        type:4
        width: 150
        height: 50
        text: $enMode?"Load":"加载游戏"
        font.pixelSize: 25
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 70
        colorBg_common: "#EEEE00"
        colorBg_down: "#DDDD00"
        colorBg_hovered: "#FFFF00"
        opacity: 0
        colorBorder: "#00000000"
        colorText: "#000000"
        Component.onCompleted: visible=file.is("./.save")

        onClicked: {
            file.setSource("./.save")
            var s=file.read(),x,y,r,n,i,ac,t,f,tp,th
            n=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            ac=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            t=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            f=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            th=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            tp=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            x=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            y=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            r=Number(s.slice(0,s.indexOf(",")))
            s=s.slice(s.indexOf(",")+1,s.length)
            $item.initialize(ac,t,f,th,tp,x,y,r)
            for(i=0;i<n;i++)
            {
                x=Number(s.slice(0,s.indexOf(",")))
                s=s.slice(s.indexOf(",")+1,s.length)
                y=Number(s.slice(0,s.indexOf(",")))
                s=s.slice(s.indexOf(",")+1,s.length)
                r=Number(s.slice(0,s.indexOf(",")))
                s=s.slice(s.indexOf(",")+1,s.length)
                $item.createBody(x,y,r)
            }
            next_type=1
            next=true
        }
    }
    Cbutton{
        id:exit_button
        NumberAnimation  on opacity {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 1.0
        }
        NumberAnimation  on opacity {
            running: next
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 0
        }
        NumberAnimation  on x {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: 0
        }
        NumberAnimation  on x {
            running: next
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: -exit_button.width
        }
        type:4
        width: 50
        height: 50
        text: $enMode?"Exit":"退出"
        padding: 0
        font.pixelSize: 20
        y:parent.height-height
        x:-width
        colorBg_common: "#EE2222"
        colorBg_down: "#DE2222"
        colorBg_hovered: "#FF2222"
        opacity: 0
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked:{
            next_type=-1
            next=true
        }
    }
    Cbutton{
        id:enMode_button
        NumberAnimation  on opacity {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 1.0
        }
        NumberAnimation  on opacity {
            running: next
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 0
        }
        NumberAnimation  on x {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: 0
        }
        NumberAnimation  on x {
            running: next
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: -exit_button.width
        }
        type:4
        width: 50
        height: 50
        text: $enMode?"中文":"English"
        padding: 0
        font.pixelSize: $enMode?20:12
        y:0
        x:-width
        colorBg_common: "#33ffffff"
        colorBg_down: "#33ffffff"
        colorBg_hovered: "#33ffffff"
        opacity: 0
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked:{
            $enMode=!$enMode
            file.setSource(filel+"./.en")
            file.write($enMode)
        }
        Component.onCompleted: {
            file.setSource(filel+"./.en")
            $enMode=file.read()=="true"?true:false
        }
    }
    Cbutton{
        id:help_button
        NumberAnimation  on opacity {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 1.0
        }
        NumberAnimation  on opacity {
            running: next
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 0
        }
        NumberAnimation  on x {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: root.width-help_button.width
        }
        NumberAnimation  on x {
            running: next
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: root.width
        }
        type:4
        width: 50
        height: 50
        text: $enMode?"help":"帮助"
        padding: 0
        font.pixelSize: 20
        y:0
        x:parent.width
        colorBg_common: "#00EE00"
        colorBg_down: "#00DD00"
        colorBg_hovered: "#0FF000"
        opacity: 0
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked:
        {
            help.visible=true
        }
    }
    Cbutton{
        id:setting_button
        NumberAnimation  on opacity {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 1.0
        }
        NumberAnimation  on opacity {
            running: next
            duration: 1350
            easing.type: Easing.InCubic
            easing.overshoot: 1.0
            to: 0
        }
        NumberAnimation  on x {
            running: root.enabled
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: root.width-help_button.width
        }
        NumberAnimation  on x {
            running: next
            duration: 1350
            easing.type: Easing.InOutQuad
            easing.overshoot: 1.0
            to: root.width
        }
        type:4
        width: 50
        height: 50
        text: $enMode?"Setting":"设置"
        padding: 0
        font.pixelSize: $enMode?12:20
        y:parent.height-height
        x:parent.width
        colorBg_common: "#5f6061"
        colorBg_down: "#5f6061"
        colorBg_hovered: "#5f6061"
        opacity: 0
        colorBorder: "#00000000"
        colorText: "#000000"
        onClicked:
        {
            setting.visible=true
        }
    }
}
