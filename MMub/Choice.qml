import QtQuick

Item {
    property bool choice:true
    onChoiceChanged: {
        if(choice)
        {
            yes.color="#00FF00"
            no.color="#CDC5BF"
        }
        else
        {
            yes.color="#CDC5BF"
            no.color="#FF0000"
        }
    }
    width: 120
    Rectangle{
        id:yes
        width: 40
        height:25
        color:"#00FF00"
        Text{
            anchors.centerIn:parent
            font.pixelSize: 15
            text:"开启"
            horizontalAlignment: Text.AlignHCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                choice=true
                yes.color="#00FF00"
                no.color="#CDC5BF"
            }
        }
    }
    Rectangle{
        id:no
        x:40
        width: 40
        height:25
        color:"#CDC5BF"
        Text{
            anchors.centerIn:parent
            font.pixelSize: 15
            text:"关闭"
            horizontalAlignment: Text.AlignHCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                choice=false
                yes.color="#CDC5BF"
                no.color="#FF0000"
            }
        }
    }
}
