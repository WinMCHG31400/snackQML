import QtQuick

Image {//额...
    function run(i){
        pppp.running=i
    }

    visible: false
    z:114514
    property int aa:0
    source: "http://jtapi.bendibao.com/ditie/inc/cd/xianluda.gif?2024083115"
    Timer{
        function next(){
            switch(photo.aa)
            {
            case 0:
                photo.source="https://p1.music.126.net/9bx3V4Oo0qxFt4OtBLtyBg==/109951163130444820.jpg?param=1000y1000"
                photo.aa++
                break
            case 1:
                photo.source="https://p1.music.126.net/EIJc2Wt5AEsIHCFcVxm6pg==/109951165033567317.jpg?param=1000y1000"
                photo.aa++
                break
            case 2:
                photo.source="https://p2.music.126.net/JJ_72FD1PPUbZzRVaNHIqA==/109951169794265026.jpg?param=1000y1000"
                photo.aa++
                break
            case 3:
                photo.source="https://i.biliimg.com/bfs/im/d38bdae3fa8d8b85e7dbdbed6fb3de22ad884119.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 4:
                photo.source="https://p1.music.126.net/DYuSvlYf4_4U5bfCG_q6Kg==/109951168719855496.jpg?param=1000y1000"
                photo.aa++
                break
            case 5:
                photo.source="https://i.biliimg.com/bfs/im/156109d76a9daf76ac1625897f5f3ecc60b5691f.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 6:
                photo.source="https://img2.kuwo.cn/star/starheads/1000/83/18/1611172212.jpg"
                photo.aa++
                break
            case 7:
                photo.source="https://i.biliimg.com/bfs/article/e22d58214351aa709f08bde103ccdd3110830290.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 8:
                photo.source="https://i.biliimg.com/bfs/im/a588f702ff7b000304988a0866d80ecc831f44df.png@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 9:
                photo.source="https://p2.music.126.net/bYXOKOl47nSjxQPyw2X09Q==/109951169280368880.jpg?param=1000y1000"
                photo.aa++
                break
            case 10:
                photo.source="https://p2.music.126.net/JmJMKCyzgL-S7c5mUa6s2g==/109951169146353144.jpg?param=1000y1000"
                photo.aa++
                break
            case 11:
                photo.source="https://p2.music.126.net/MYIl1dPJCMt0ay9zmIJRtQ==/17783501068032491.jpg?param=1000y1000"
                photo.aa++
                break
            case 12:
                photo.source="https://i.biliimg.com/bfs/article/d5d2f89f399f200cc58853cad0c555b910830290.png@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 13:
                photo.source="https://p2.music.126.net/k488cSs0FSFo1WHGbigFpA==/109951168993334060.jpg?param=1000y1000"
                photo.aa++
                break
            case 14:
                photo.source="https://i.biliimg.com/bfs/im/38080b13b5c33344b39ade9bdf912c4f9e516ae5.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 15:
                photo.source="https://p2.music.126.net/uX5M80cnoqZrauAlNr236Q==/109951162907863034.jpg?param=1000y1000"
                photo.aa++
                break
            case 16:
                photo.source="https://p2.music.126.net/ZRF3_9Syzlvjel3SV3eMew==/109951168132838093.jpg?param=1000y1000"
                photo.aa++
                break
            case 17:
                photo.source="https://p2.music.126.net/4g4I3R1BZIS_-2zWlzFbrw==/109951164912852348.jpg?param=1000y1000"
                photo.aa++
                break
            case 18:
                photo.source="https://i.biliimg.com/bfs/im/a40aff309016580683887148a11d478b0cc141c7.png@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 19:
                photo.source="https://i.biliimg.com/bfs/article/4e297ed841ab414eb45091c0aae47d8d10830290.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 20:
                photo.source="https://p2.music.126.net/IbRFbNXW5jwOUS5UNPQF7Q==/109951165604772506.jpg?param=1000y1000"
                photo.aa++
                break
            case 21:
                photo.source="https://p2.music.126.net/jA7PDJ6cOrfQOOxJlEiMnA==/109951164843126961.jpg?param=1000y1000"
                photo.aa++
                break
            case 22:
                photo.source="https://i.biliimg.com/bfs/im/5a910a2e23f2c8019f8fe5387c0a0e65db67206e.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 23:
                photo.source="https://i.biliimg.com/bfs/article/968cab0794c174d0a638515c5d523f8410830290.png@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 24:
                photo.source="https://p1.music.126.net/N_uwtB2mmwHQvzLXO3bzdA==/109951166711714910.jpg?param=1000y1000"
                photo.aa++
                break
            case 25:
                photo.source="https://i.biliimg.com/bfs/im/f860b226326a4d7d232f2e742c7547f5db5b90a8.jpg@1000w_1000h_1c.webp"
                photo.aa++
                break
            case 26:
                photo.source="https://p1.music.126.net/15-M_C_SUgY33WYEEl_Q9Q==/109951168126517713.jpg?param=1000y1000"
                photo.aa++
                break
            default:
                photo.source="http://jtapi.bendibao.com/ditie/inc/cd/xianluda.gif?2024083115"
                photo.aa=0
            }
        }
        id:pppp
        repeat:true
        interval: 4000
        running:false
        onTriggered: {
            pppp.next()
       }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            pppp.next()
        }
    }
    Rectangle {
        x:-140
        y:190
        width: 140
        height: 90
        Rectangle {//自动播放开关
            id:bu_auto
            z:10
            x:10
            y:10
            width: 120
            height: 50
            color: "#00FF00"
            Text {
                id:bu_auto_text
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr("自动播放")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(!pppp.running)
                    {
                        pppp.running=true
                        bu_auto.color="#00FF00"
                        bu_auto_text.text="自动播放"
                    }
                    else
                    {
                        pppp.running=false
                        bu_auto.color="#CDCDC1"
                        bu_auto_text.text="手动播放"

                    }
                    press_su.play_()
                }
            }
        }
        Rectangle {
            x:10
            y:60
            width: 120
            height: 20
            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                font.bold: true
                text: qsTr("点击图片切换到下一张")
            }
        }
    }



}

