import QtQuick

Item {
    visible: true
    property bool isPress:false
    onWidthChanged: {
        a.width=width-10
    }
    onHeightChanged: {
        height=20
    }

    Rectangle{
        color:"#FFFFFF"
        y:7
        x:8
        height: 6
        id:a
    }
    Rectangle{
        id:b
        color:"#FFFF00"
        width: 16
        height: 16
        x:0
        y:2
        radius: 100
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onMouseXChanged: {
            console.log("1")
            if(containsPress)
            {
                console.log("2")
                b.x=mouseX
            }
        }
        onPressed: {
            isPress=true
        }
        onReleased: {
            isPress=false
        }
    }

}
