import QtQuick

Rectangle {
    id:root
    property var snake
    property var hear
    property int n
    function initialize(s_,h_,z_,r_,x_,y_,n_){
        snake=s_
        hear=h_
        z=z_
        x=x_
        y=y_
        rotation=r_
        n=n_
    }
    function resetColor(){
        color=Qt.rgba(1,0.945,n/snake.body.length,Math.max(1-n/snake.body.length,snackOpacity))
    }
    function resetRotation(){
        if(n+1<snake.body.length)
        {
            var last=n==0?hear:snake.body[n-1]
            var next=snake.body[n+1]
            if((last.x==next.x||last.y==next.y)&&(rotation==next.rotation ||rotation-180==next.rotation))
            {
                im.rotation=0
                im.source="./images/snack_body3.png"
            }
            else
            {
                im.source="./images/snack_body4.png"
                var lastr=last.rotation-rotation
                if(lastr<0)lastr+=360
                else if(lastr>360)lastr-=360
                if(n==0)lastr-=90
                var nextr=next.rotation-rotation
                if(nextr<0)nextr+=360
                else if(nextr>360)nextr-=360
                switch(nextr)
                {
                case 0:
                    switch(lastr)
                    {
                    case 270:
                        im.rotation=180
                        break
                    case 0:
                        im.rotation=00
                        break
                    case 90:
                        im.rotation=90
                        break
                    }
                    break
                case 90:
                    im.rotation=270
                    break
                case 270:
                    im.rotation=0
                    break
                default:
                {
                    if(n+2==snack.body.length)
                    {
                        im.source="./images/snack_body5.png"
                        im.rotation=0
                    }
                    console.log(n+":"+lastr+","+nextr+";"+snake.body.length)
                }
                }
            }
        }
        else
        {
            im.source="./images/snack_body5.png"
            im.rotation=0
        }
    }

    z:2;
    Image{
        id:im
        anchors.fill: parent
        source: "./images/snack_body1.png"
    }
    Item{
        visible: $control
        width: 20
        height: 20
        rotation: 0-parent.rotation
        Text{
            font.pixelSize: 20
            text: n
            color:"#0000FF"
            anchors.centerIn: parent
        }
        Text{
            x:2
            font.pixelSize:8
            text: im.rotation
        }
        Text{
            x:2
            y:10
            color:"#FF0000"
            font.pixelSize:8
            text: root.rotation
        }
    }

    width: 20;
    height: 20
}
