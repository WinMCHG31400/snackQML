import QtQuick 2.14
Item {
    property int w: 0
    property int a: 0
    property int s: 0
    property int d: 0
    Timer{
        id: timer;
        interval: 20;
        repeat: true;
        running:true;
        onTriggered:{
            if(w==1)
            {
                hear.y+=20
                hear.rotation=270
            }
            else if(a==1)
            {
                hear.x-=20
                hear.rotation=180
            }
            else if(s==1)
            {
                hear.y-=20
                hear.rotation=90
            }
            else if(d==1)
            {
                hear.x+=20
                hear.rotation=0
            }
        }
    }

    Image {
        id: hear
        source: "qrc:/images/images/snack_hear.png"
    }
    Keys.onPressed: {
        if(event.key==Qt.Key_W)
            a=1;
        else if(event.key==Qt.Key_A)
            d=1;
        else if(event.key==Qt.Key_S)
            w=1;
        else if(event.key==Qt.Key_D)
            s=1;
    }
    Keys.onReleased: {
        if(event.key==Qt.Key_W)
            a=0;
        else if(event.key==Qt.Key_A)
            d=0;
        else if(event.key==Qt.Key_S)
            w=0;
        else if(event.key==Qt.Key_D)
            s=0;
    }
}
