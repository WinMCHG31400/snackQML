import QtQuick

Image{//加载界面
    function canstart(){
        start_text.text="点击开始"
        canStart=true
    }
    function canNext()
    {
        retrun=!(start_timer.running && start_timer2.running)
    }

    property bool canStart:false
    property int maxcent
    property int maxt
    anchors.fill: parent
    Component.onCompleted: {
        filel="C:/Users/"+file.getUser()+"/AppData/LocalLow/snackQt"
        if(file.is(filel+"/data.d"))
        {
            file.setSource(filel+"/data.d")
            maxcent=Number(file.read())
            file.setSource(filel+"/data2.d")
            maxt=Number(file.read())
        }
        else
        {
            file.create(filel)
            file.setSource(filel+"/data.d")
            file.write("0")
            file.setSource(filel+"/data2.d")
            file.write("0")
        }
        item.setMaxcent(maxcent)
        item.setMaxtime(maxt)
        start_item.setMaxcent(maxcent)
        start_item.setMaxtime(maxt)
        item.maxcent=maxcent
    }

    Timer{
        id:start_timer
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(load_item.opacity>0)
                load_item.opacity-=0.01
            else
            {
                load_item.visible=false
                start_item.visible=true
                start_timer.running=false
                start_timer2.running=true
            }
        }

    }
    Timer{
        id:start_timer2
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(start_item.opacity<1)
                start_item.opacity+=0.01
            else
                running=false
        }
    }
    Rectangle{
        anchors.verticalCenterOffset: 10
        anchors.horizontalCenterOffset: 0
        anchors.centerIn:parent
        width: 200
        height: 270
        color: "#FFFFFF"
        opacity: 0.6
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(canStart)
                {
                    start_timer.running=true
                }
            }
        }
    }
    Text{
        anchors.verticalCenterOffset: -70
        anchors.horizontalCenterOffset: 0
        anchors.centerIn:parent
        width: 100
        height: 30
        font.pixelSize: 10
        font.bold: true
        text: qsTr("Made with")
        horizontalAlignment: Text.AlignHCenter
    }
    Image {
        anchors.centerIn: parent
        source: "qrc:/images/images/Qt.png"
    }
    Text{
        id:start_text
        anchors.verticalCenterOffset: 100
        anchors.horizontalCenterOffset: 0
        anchors.centerIn:parent
        width: 100
        height: 30
        font.pixelSize: 10
        font.bold: true
        text: qsTr("加载中...")
        opacity: 0.3
        horizontalAlignment: Text.AlignHCenter
        Timer{
            running: true
            repeat: true
            interval: 10
            property bool add:true
            onTriggered: {
                if(start_text.opacity==1)
                    add=false
                else if(start_text.opacity==0)
                    add=true
                if(add)
                    start_text.opacity+=0.01
                else
                    start_text.opacity-=0.01

            }
        }
    }
}
