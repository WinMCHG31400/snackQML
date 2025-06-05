import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import Clipboard 1.0
import QtMultimedia
import Metadata 1.0

Window {
    id:root
    visible: false
    minimumHeight: 400
    maximumHeight: 400
    minimumWidth: 300
    maximumWidth: 300
    title: $enMode?"SnackQML Setting":"SnackQML设置"
    CscrollBar{
        width:300
        height: 20
        y:1
        text:$enMode?"Opacity":"透明度"
        text_width: 60
        Component.onCompleted: setValue(100)
        minValue: 10
        maxValue: 100
        onValueChanged: win.opacity=value/100
    }
    CscrollBar{
        width:300
        y:22
        height: 20
        text:$enMode?"back Opacity":"背景透明度"
        text_width: $enMode?100:80
        Component.onCompleted: setValue(50)
        minValue: 0
        maxValue: 100
        onValueChanged: $item.back_opacity=value/100
    }
    CscrollBar{
        width:300
        y:43
        height: 20
        text:$enMode?"snack Opacity":"蛇透明度"
        text_width: $enMode?100:80
        Component.onCompleted: setValue(0)
        minValue: 0
        maxValue: 100
        onValueChanged: {
            snackOpacity=value/100
            item.reColor()
        }
    }
    Item{
        y:74
        Text{
            text:$enMode?"Back Image":"背景图片"
            font.pixelSize: 15
        }
        CCheckBox{
            id:isAudioCover
            x:100
            text: $enMode?"Use Audio Cover":"使用音频封面"
            checked: false
            font.pixelSize: 10
            onCheckedChanged: {
                if(checked&&mediaPlayer.hasAudio)
                    _Bg.source="./temp/cover"+metaHandler.getN()+".jpg"
            }
        }

        Rectangle{
            y:20
            width: 300
            height: 20
            border.width: 1
            border.color: "#80808080"
            TextInput{
                anchors.fill: parent
                id:source_text
                color: "black"
                padding:1
                font.pixelSize: 13
            }
        }
        Cbutton{
            id:shtp
            property int type_:0
            x:50
            y:40
            width: 100
            height: 20
            text:{
                switch(type_)
                {
                case 1:return $enMode?"Padding":"填充"
                case 2:return $enMode?"Adapt":"适应"
                default:return $enMode?"Stretch":"拉伸"
                }
            }
            onClicked: {
                if(type_!=2)
                    type_++
                else
                    type_=0
            }
            onType_Changed: _Bg.reset(type_)
        }

        Cbutton{
            x:150
            y:40
            width: 50
            height: 20
            text:$enMode?"Paste":"粘贴"
            onClicked: {
                source_text.text=Clipboard.pasteText()
            }
        }
        Cbutton{
            x:200
            y:40
            width: 50
            height: 20
            text:$enMode?"Load":"加载"
            onClicked: {
                _Bg.reset(shtp.type_,isAudioCover.checked?"./temp/cover"+metaHandler.getN()+".jpg":source_text.text)
            }
        }
        Cbutton{
            x:250
            y:40
            width: 50
            height: 20
            text:$enMode?"Reset":"重置"
            onClicked: {
                _Bg.source="./images/back_load.png"
            }
        }
    }

    Item{
        y:154

        Text{
            y:-20
            text:$enMode?"Back Music":"背景音乐"
            font.pixelSize: 15
        }
        Rectangle{
            width: 300
            height: 20
            border.width: 1
            border.color: "#80808080"
            TextInput{
                anchors.fill: parent
                id:aduio_source_text
                color: "black"
                padding:1
                font.pixelSize: 13
            }
        }
        Image{
            id:cover
            y:20
            x:5
            width: 150
            height: 150
            source:"./images/no_image.png"
        }
        Item{
            x:160
            y:20
            Text{
                id:title
                font.pixelSize: 15
                text:"Title"
            }
            Text{
                y:20
                id:author
                font.pixelSize: 10
                text:"Author"
            }
        }

        Cbutton{
            y:170
            width: 50
            height: 20
            text:$enMode?"Paste":"粘贴"
            onClicked: {
                aduio_source_text.text=Clipboard.pasteText()
            }
        }
        Cbutton{
            x:250
            y:170
            width: 50
            height: 20
            text:mediaPlayer.playing?($enMode?"Pause":"暂停"):($enMode?"Play":"播放")
            onClicked: {
                if(mediaPlayer.playing)
                    mediaPlayer.pause()
                else
                    mediaPlayer.play()
                for(var i=0;i<mediaPlayer.metaData.keys().length;i++)
                    console.log(i+","+mediaPlayer.metaData.keys()[i]+","+mediaPlayer.metaData.stringValue(mediaPlayer.metaData.keys()[i]))
            }
        }
        CscrollBar{
            id:mediaPlayer_positing
            y:170
            x:50
            width: 200
            height: 20
            minValue: 0
            text_width: 0
            value_width: 60
            maxValue: mediaPlayer.duration/100
            Timer{
                interval: 100
                repeat: true
                running:mediaPlayer.playing
                onTriggered:
                    mediaPlayer_positing.setValue(mediaPlayer.position/100)
            }
            onClickChanged: mediaPlayer.position=value*100
        }

        MediaPlayer {
            id: mediaPlayer
            source: "file:///"+aduio_source_text.text
            audioOutput: AudioOutput {}
            onSourceChanged: metaHandler.extractCoverArt(aduio_source_text.text)
            onHasAudioChanged: {
                if(hasAudio)
                {
                    title.text=metaData.value(0)
                    author.text=metaData.value(0)
                    if(isAudioCover.checked)
                        _Bg.reset(shtp.type_,"./temp/cover"+metaHandler.getN()+".jpg")
                    cover.source = ""
                    Qt.callLater(() => cover.source ="./temp/cover"+metaHandler.getN()+".jpg")
                }
                else{
                    cover.source="./images/no_image.png"
                }
            }
        }
        MetaDataHandler {
            id: metaHandler
            onCoverArtSaved: (path) => {
                                 cover.source = ""
                                 cover.source = "./temp/cover"+getN()+".jpg"
                             }
            onErrorOccurred: cover.source="./images/no_image.png"
        }
    }
}
