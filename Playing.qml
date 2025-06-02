import QtQuick

Image{//游戏界面

    id:item
    property int x0 //存储生成的食物的位置
    property int y0 //存储生成的食物的位置
    property var im //存储生成的食物（Image）
    property bool canEat:true    //是否可以吃食物
    property bool canGenerate:true     //是否允许食物生成
    property bool isShow_:false //控制
    property bool canThrough:$through>0?true:false  //是否可以爬上自身
    property bool isFast:$fast>0?true:false
    property int im_type        //生成的食物的种类
    property bool control:false //是否开启开发者模式
    property int addcent:0      //额外增加的分数
    property int maxcent:0
    property int type:0
    property int maxtype:3
    property bool is_autoMove:false

    property int difficulty:200
    property bool canDie:true
    property int next_type:0
    property bool next:false
    property real back_opacity:0.1
    enabled: false

    visible: false
    opacity: 0
    width: 800
    height: 600
    function initialize(ac,t,f,th,tp,x,y,r){
        addcent=ac
        timer3.tt=t
        $fast=f
        $through=th
        setType(tp)
        hear.x=x
        hear.y=y
        hear.rotation=r
    }
    function save(path="./.save")
    {
        file.setSource(path)
        var a=snack.body.length+","+addcent+","+timer3.tt+","+$fast+","+$through+","+type+","
        a+=hear.x+","+hear.y+","+hear.rotation+","
        for(var i=0;i<snack.body.length;i++)
            a+=snack.body[i].x+","+snack.body[i].y+","+snack.body[i].rotation+","
        file.write(a)
    }

    function generate_food()
    {
        var lxj=Math.random()
        var image
        if(type==0 ||type==3)
        {
            if(lxj>0.9)
            {
                im_type=1
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_speed.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.85)
            {
                im_type=10
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_speed_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.75)
            {
                im_type=2
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_throuth.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.7)
            {
                im_type=20
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_throuth_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.65)
            {
                im_type=3
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_high.png'; width: 20; height: 20}", item);

            }
            else if(lxj>0.6)
            {
                im_type=4
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_s&t.png'; width: 20; height: 20}", item);

            }
            else
            {
                im_type=0
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food.png'; width: 20; height: 20}", item);
            }

        }
        else if(type==1)
        {
            if(lxj>0.9)
            {
                im_type=1
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_speed.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.8)
            {
                im_type=10
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_speed_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.7)
            {
                im_type=2
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_throuth.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.6)
            {
                im_type=20
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_throuth_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.5)
            {
                im_type=3
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_high.png'; width: 20; height: 20}", item);

            }
            else if(lxj>0.4)
            {
                im_type=4
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_s&t.png'; width: 20; height: 20}", item);

            }
            else
            {
                im_type=0
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food.png'; width: 20; height: 20}", item);
            }
        }
        else
        {
            im_type=0
            image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food.png'; width: 20; height: 20}", item);

        }
        x0=image.x=parseInt(Math.random()*40)*20
        y0=image.y=parseInt(Math.random()*30)*20
    }
    function setType(i){
        if(type==3 || type==2)
            is_autoMove=1
        else
            is_autoMove=0
        set_difficulty(200)
        type=i
        switch(type){
        case 0:
        case 1:is_autoMove=false
            break
        default:is_autoMove=true
        }
        im.destroy()
        generate_food()
    }
    function set_difficulty(i){
        difficulty=i
    }
    function die_(){
        timer.running=false
        timer3.running=false
        die.show(snack.cent+addcent,timer.tt/100)
    }
    function press_W()
    {
        if(is_autoMove==1)
        {
            if(snack.num==-1? true:hear.rotation!=90)
                hear.rotation=270
        }
        else
            snack.w=1;
    }
    function press_A()
    {
        if(is_autoMove==1)
        {
            if(snack.num==-1? true:hear.rotation!=0)
                hear.rotation=180
        }
        else
            snack.a=1
    }
    function press_S()
    {
        if(is_autoMove==1)
        {
            if(snack.num==-1? true:hear.rotation!=270)
                hear.rotation=90
        }
        else
            snack.s=1;
    }
    function press_D()
    {
        if(is_autoMove==1)
        {

            if(snack.num==-1? true:hear.rotation!=180)
            {
                hear.rotation=0
            }
        }
        else
            snack.d=1;
    }
    function createBody(x=-1,y=-1,r=-1)
    {
        snack.cent++
        snack.num++
        var image=snack.body[snack.num]= Qt.createQmlObject("import QtQuick; Image { z:2; source: './images/snack_body1.png'; width: 20; height: 20}", item);
        var aa
        if(snack.num>=1)
            aa=snack.body[snack.num-1]
        else
            aa=hear
        var re=aa.rotation*Math.PI/180.0
        image.rotation=r===-1?aa.rotation:r
        image.x=x===-1?aa.x+(-Math.cos(re)*20):x
        image.y=y===-1?aa.y+(-Math.sin(re)*20):y
        image.z=2147483600-snack.num
    }
    Rectangle{
        id:back
        color:"#00000000"
        anchors.fill: parent
        opacity: back_opacity
    }

    Component.onCompleted: {
        var i,j
        for(i=0;i<800;i+=20)//
        {
            for(j=0;j<600;j+=20)
            {
                var image = Qt.createQmlObject("import QtQuick; Image { z:-1; source: './images/back.png'; width: 20; height: 20}", back);
                image.x=i
                image.y=j
            }
        }
        if(Qt.platform.os!="windows")
            control_bu.visible=true
        generate_food()
        file.setSource("./data.d")
        maxcent=file.read()
    }
    onEnabledChanged:{
        if(enabled)
        {
            item.visible=true
            item.focus=true
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
            case -1:$win.next(1)
                break
            case 0:
                $win.next(1);
            }
            item.enabled=false
            item.visible=false
            next=false
        }
    }
    NumberAnimation  on opacity {
        running: enabled
        duration: 1350
        easing.type: Easing.InOutQuad
        easing.overshoot: 1.0
        to: 1.0
        onStopped: {
            timer.running=true
            timer3.running=true
        }
    }
    Timer{//计时专用计时器
        property int t:0
        property int tt:0
        id:timer3
        interval: 10
        repeat: true
        running:false
        onTriggered:{
            if(!pausen)
            {
                t+=1
                tt=t/100
                time_text.text=tt+"s"
            }
        }
    }
    Item{//移动按钮
        id:control_bu
        visible: false
        z:2147483647
        opacity:0.6
        Image{
            id:up
            x:100
            y:480
            width:30
            height:30
            source:"./images/button.png"
            MouseArea{
                anchors.fill: parent;
                onPressed:
                    press_W()
                onReleased:
                    snack.w=0
            }
        }
        Image{
            id:left
            x:40
            y:540
            width: 30
            height:30
            rotation: 270
            source:"./images/button.png"
            MouseArea{
                anchors.fill: parent;
                onPressed:
                    press_A()
                onReleased:
                    snack.a=0
            }
        }
        Image{
            id:down
            x:100
            y:540
            width: 30
            height:30
            rotation: 180
            source:"./images/button.png"
            MouseArea{
                anchors.fill: parent;
                onPressed:
                    press_S()
                onReleased:
                    snack.s=0
            }
        }
        Image{
            id:right
            x:160
            y:540
            z:10
            width: 30
            height:30
            rotation: 90
            source:"./images/button.png"
            MouseArea{
                anchors.fill: parent;
                onPressed:
                    press_D()
                onReleased:
                    snack.d=0
            }
        }
    }
    Image {//蛇头
        z:2147483646
        x:200
        y:200
        width: 20
        height: 20
        visible: true
        id: hear
        source: "./images/snack_hear.png"
    }
    Item {//蛇身体
        z:2
        focus: true
        id:snack
        x:0
        y:0
        width: 800
        height: 600
        property int cent:0
        property int w: 0
        property int a: 0
        property int s: 0
        property int d: 0
        property var body:[1200]
        property int num:-1
        Timer{
            function body_move(x,y,r){
                var x0,y0,r0
                for(var i=0;i<=snack.num;i++)
                {
                    x0=snack.body[i].x
                    y0=snack.body[i].y
                    r0=snack.body[i].rotation
                    snack.body[i].x=x
                    snack.body[i].y=y
                    snack.body[i].rotation=r
                    x=x0
                    y=y0
                    r=r0
                }
            }
            function isBody(x,y){
                for(var i=0;i<=snack.num;i++)
                {
                    if(snack.body[i].y==y && snack.body[i].x==x)
                        return true
                }
                return false
            }
            id: timer;
            repeat: true;
            running:false
            interval:isFast?difficulty/2:difficulty
            onTriggered:{
                if(!pausen)
                {
                    if(is_autoMove)
                    {
                        switch(hear.rotation)
                        {
                        case 270:
                            if(canThrough? true:(!isBody(hear.x,hear.y-20))){
                                body_move(hear.x,hear.y,270)
                                if(hear.y==0)
                                    hear.y=580
                                else
                                    hear.y-=20
                            }
                            else if(canDie)
                                die_l()
                            hear.rotation=270
                            canEat=true
                            break
                        case 180:
                            if(canThrough? true:(!isBody(hear.x-20,hear.y))){
                                body_move(hear.x,hear.y,180)
                                if(hear.x==0)
                                    hear.x=780
                                else
                                    hear.x-=20
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=180
                            canEat=true
                            break
                        case 90:
                            if((canThrough? true:(!isBody(hear.x,hear.y+20)))){
                                body_move(hear.x,hear.y,90)
                                if(hear.y==580)
                                    hear.y=0
                                else
                                    hear.y+=20
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=90
                            canEat=true
                            break
                        case 0:
                            if((canThrough? true:(!isBody(hear.x+20,hear.y)))){
                                body_move(hear.x,hear.y,0)
                                if(hear.x==780)
                                    hear.x=0
                                else
                                    hear.x+=20
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=0
                            canEat=true
                            break
                        }
                    }
                    if($through>0) $through--
                    if($fast>0) $fast--
                    if(!is_autoMove){
                        if(snack.w==1)
                        {
                            if(hear.y>0 && (canThrough? true:(!isBody(hear.x,hear.y-20)))){
                                hear.y-=20
                                body_move(hear.x,hear.y+20,270)
                            }
                            hear.rotation=270
                            canEat=true
                        }
                        else if(snack.a==1)
                        {
                            if(hear.x>0 && (canThrough? true:(!isBody(hear.x-20,hear.y)))){
                                hear.x-=20
                                body_move(hear.x+20,hear.y,180)
                            }
                            hear.rotation=180
                            canEat=true
                        }
                        else if(snack.s==1)
                        {
                            if(hear.y<580 && (canThrough? true:(!isBody(hear.x,hear.y+20)))){
                                hear.y+=20
                                body_move(hear.x,hear.y-20,90)
                            }
                            hear.rotation=90
                            canEat=true
                        }
                        else if(snack.d==1)
                        {
                            if(hear.x<780 && (canThrough? true:(!isBody(hear.x+20,hear.y)))){
                                hear.x+=20
                                body_move(hear.x-20,hear.y,0)
                            }
                            hear.rotation=0
                            canEat=true
                        }
                    }
                    if(hear.x==x0 && hear.y==y0 && canEat)//吃到食物
                    {
                        move_ea.play()
                        switch(im_type)
                        {
                        case 1:
                            if($fast>2147483467)
                                $fast=2147483647
                            else
                                $fast+=180
                            break
                        case 10:
                            if($fast>2147481847)
                                $fast=2147483647
                            else
                                $fast+=1800
                            break
                        case 2:
                            if($through>2147483467)
                                $through=2147483647
                            else
                                $through+=180
                            break
                        case 20:
                            if($through>2147481847)
                                $through=2147483647
                            else
                                $through+=1800
                            break
                        case 3:
                            addcent+=9
                            break
                        case 4:
                            if($fast>2147483467)
                                $fast=2147483647
                            else
                                $fast+=180
                            if($through>2147483467)
                                $through=2147483647
                            else
                                $through+=180
                            break
                        default:break
                        }
                        createBody()
                        if((snack.cent+addcent)>maxcent)
                        {
                            file.setSource("./data.d")
                            file.write(snack.cent+addcent)
                        }
                        im.destroy()
                        generate_food()
                    }
                }

            }
        }
    }

    Image{//面板
        id:item_mm
        source:"./images/back_null.png"
        x:800
        y:0
        width: 100
        height: 600
        property int type
        Rectangle {//显示分数
            id:cent_text
            z:10
            x:0
            y:0
            width: 100
            height: 40
            color: "#FFFF00"
            Text {
                id: cent
                anchors.centerIn: parent
                font.pixelSize: 30
                font.bold: true
                text: qsTr(""+(snack.cent+addcent))
            }
        }
        Rectangle {//显示长度
            id:lon_text
            z:10
            x:0
            y:40
            width: 100
            height: 40
            color: "#FFFF00"
            Text {
                id: l_t
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
                text: (snack.num+3)+"m"
            }
        }
        Rectangle {//显示时间
            id:time_
            z:10
            x:0
            y:80
            width: 100
            height: 40
            color: "#FFFF00"
            Text {
                id: time_text
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
                text: timer.tt+"s"
            }
        }
        Rectangle {//显示加速状态
            id:speed_text
            z:10
            x:0
            y:130
            width: 100
            visible: $fast>0?true:false
            height: 30
            color: "#00FFFF"
            Text {
                id: s_t
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr($fast+"0ms")
            }
        }
        Rectangle {//显示穿过状态
            id:throuth_text
            z:10
            x:0
            y:160
            width: 100
            height: 30
            visible: $through>0
            color: "#B200FF"
            Text {
                id: t_t
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: qsTr($through+"0ms")
            }
        }
        Rectangle {//显示模式
            id:high_text
            z:10
            x:0
            y:195
            width: 100
            height: 30
            color: {
                switch(type){
                case 0:return "#FFD700"
                case 1:return "#00FFFF"
                case 2:return "#FFFAFA"
                case 3:return "#FF0000"
                }

            }
            Text {
                id: h_t
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                text: {
                    switch(type){
                    case 0:return $enMode?"Common":"普通模式"
                    case 1:return $enMode?"High Odds":"高概率模式"
                    case 2:return $enMode?"Typical":"经典模式"
                    case 3:return $enMode?"Hard":"困难模式"
                    }
                }
            }
        }
        Rectangle {//显示穿过状态（按钮）
            id:bu_through
            z:10
            x:0
            y:235
            width: 100
            height: 30
            color: "#CDCDC1"
            Text {
                id:bu_through_bu
                anchors.centerIn: parent
                font.pixelSize: $enMode?10:14
                font.bold: true
                text: $through>0?($enMode?"Can't through self":"不允许爬上自身"):($enMode?"Can through self":"允许爬上自身")
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(control)//开发者模式下允许使用按钮修改
                    {
                        if(!canThrough)
                        {
                            bu_through_bu.allow()
                            timer.throuth=2147483647
                        }
                        else
                            bu_through_bu.refuse()
                        press_su.play_()
                    }
                }
            }
        }
        Rectangle{//显示移动按钮的按钮
            id:control__bu
            x:0
            y:305
            z:10
            width: 100
            height: 30
            color: "#FFFFFF"
            Text {
                id:bu_control__bu
                anchors.centerIn: parent
                font.pixelSize: $enMode?10:14
                font.bold: true
                text: $enMode?"hide control button":"隐藏控制按钮"
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    if(control_bu.visible)
                    {
                        bu_control__bu.text=$enMode?"hide control button":"隐藏控制按钮"
                        control_bu.visible=false
                    }
                    else
                    {
                        bu_control__bu.text=$enMode?"显示 control button":"显示控制按钮"
                        control_bu.visible=true
                    }
                    press_su.play_()
                }
            }
        }
        Cbutton{//音效按钮
            type:4
            id:soude_bu
            x:0
            y:340
            z:10
            width: 100
            height: 30
            colorBg: "#FFFFFF"
            checkable: true
            checked: true
            colorBorder: "#00000000"
            onCheckedChanged: $doud=checked
            Text {
                id:bu_soude__bu
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: $doud?($enMode?"Adiuo":"开启音效"):($enMode?"No Adiuo":"关闭音效")
            }
        }
        Rectangle {//帮助按钮
            z:10
            x:0
            y:420
            width: 100
            height: 30
            color: "#EEEE00"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: $enMode?"Help":"帮助"
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    help.visible=true
                }
            }
        }
        Rectangle {//显示最高分
            id:maxcent_text
            z:10
            x:0
            y:470
            width: 100
            height: 30
            color: "#FF0000"
            Text {
                id: m_t
                anchors.centerIn: parent
                font.pixelSize: $enMode?12:14
                font.bold: true
                text: qsTr(($enMode?"Max Cent:":"最高分：")+maxcent)
            }
        }
        Image {//暂停按钮
            id: pause_
            x:20
            y:550
            source: pause_i.enabled?"./images/_pause_bu.png":"./images/pause_bu.png"
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    pause_i.enabled=!pause_i.enabled
                    press_su.play_()
                }
            }
        }
    }



    Image{
        visible: false
        width: 900
        height:600
        property int centl:0
        Behavior on opacity { NumberAnimation { easing.type: Easing.InOutQuad; duration: 1350 } }
        property int t
        opacity: 0
        id:die
        z:2147483647
        source:"./images/pause.png"
        function show(cent,time)
        {
            visible=true
            opacity=1
            centl=cent
            t=time
        }
        Image {
            x:400
            y:245
            width: 100
            height:110
            source:"./images/pause.png"
            Text{
                x:10
                y:10
                color:"#FF0000"
                text:$enMode?"Game Over":"游戏失败"
                font.pixelSize: 20
            }
            Text{
                x:10
                y:40
                text:($enMode?"Cent:":"分数：")+die.centl
                font.pixelSize: 20
            }
            Text{
                x:10
                y:70
                text:($enMode?"Time:":"用时：")+die.t
                font.pixelSize: 20
            }
        }
    }

    Image {//暂停
        enabled: false
        property bool next:false
        id: pause_i
        opacity: 0
        visible: false
        anchors.fill: parent
        z:2147483647
        source: "./images/pause.png"
        Behavior on opacity { NumberAnimation { easing.type: Easing.InOutQuad; duration: 1350 } }
        onEnabledChanged: {
            if(enabled)
            {
                timer.running=false
                timer3.running=false
                pause_i.visible=true
                pause_i.opacity=1
            }
            else
            {
                timer.running=true
                timer3.running=true
                pause_i.opacity=0
            }
        }
        onOpacityChanged: if(opacity==0)pause_i.visible=false


        Item{
            z:2147483647
            Image{
                source: "./images/pause.png"
            }
            Rectangle{
                color: "#E8E8E8"
                x:290
                y:260
                width:260
                height: 80
                Rectangle{//退出按钮
                    x:20
                    y:20
                    z:10
                    width: 100
                    height: 40
                    color: "#FFFFFF"
                    opacity: 0.5
                    Text {
                        id:exit_t
                        anchors.centerIn: parent
                        font.pixelSize: 30
                        font.bold: true
                        text: qsTr($enMode?"Exit":"退出")
                        MouseArea{
                            anchors.fill: parent;
                            onClicked: {
                                save()
                                Qt.quit()
                            }
                        }
                    }
                }
                Rectangle{//取消按钮
                    id:cans
                    x:140
                    y:20
                    z:10
                    width: 100
                    height: 40
                    color: "#FFFFFF"
                    opacity: 0.5
                    Text {
                        id:cnas_t
                        anchors.centerIn: parent
                        font.pixelSize: 30
                        font.bold: true
                        text: qsTr($enMode?"Cancel":"取消")
                        function cancle(){
                        }
                        MouseArea{
                            anchors.fill: parent;
                            onClicked: {
                                pause_i.enabled=false
                            }
                        }
                    }
                }
            }
        }
    }

    Keys.onPressed:(event)=>{
                       if((event.modifiers & Qt.ControlModifier) && event.key === Qt.Key_S)
                       {
                           event.accepted = true
                           save()
                       }
                       else if(event.key===Qt.Key_W)press_W()
                       else if(event.key===Qt.Key_A)press_A()
                       else if(event.key===Qt.Key_S)press_S()
                       else if(event.key===Qt.Key_D)press_D()
                       if(event.key===Qt.Key_Up)press_W()
                       else if(event.key===Qt.Key_Left)press_A()
                       else if(event.key===Qt.Key_Down)press_S()
                       else if(event.key===Qt.Key_Right)press_D()
                       if(event.key===Qt.Key_V)
                       {
                           $doud=!$doud
                           press_su.play()
                       }
                       else if(event.key===Qt.Key_Space)
                       {
                           pause_i.enabled=!pause_i.enabled
                           press_su.play_()
                       }
                       else if(event.key===Qt.Key_Escape)
                       {
                           pause_i.enabled=!pause_i.enabled
                           press_su.play_()
                       }
                   }
    Keys.onReleased: (event)=>{
                         if(event.key===Qt.Key_W)
                         snack.w=0;
                         else if(event.key===Qt.Key_A)
                         snack.a=0;
                         else if(event.key===Qt.Key_S)
                         snack.s=0;
                         else if(event.key===Qt.Key_D)
                         snack.d=0;
                         if(event.key===Qt.Key_Up)
                         snack.w=0;
                         else if(event.key===Qt.Key_Left)
                         snack.a=0;
                         else if(event.key===Qt.Key_Down)
                         snack.s=0;
                         else if(event.key===Qt.Key_Right)
                         snack.d=0;
                         else if(event.key===Qt.Key_Enter && quit.visible)
                         {
                             Qt.quit()
                         }
                         else if(event.key===Qt.Key_F12)//f12打开开发者模式
                         {
                             win.title=$enMode?"SnackQml//Developer's Mode":"SnackQML//开发者模式"
                             control=true
                             press_su.play_()
                         }
                         else if(event.key===Qt.Key_F1 &&control)
                         {
                             if($fast>0)
                             {
                                 $fast=0
                             }
                             else
                             {
                                 $fast=2147483647
                             }
                             press_su.play_()
                         }
                         else if(event.key===Qt.Key_F2 &&control)
                         {
                             if($through>0)
                             {
                                 $through=0
                             }
                             else
                             {
                                 $through=2147483647
                             }
                             press_su.play_()
                         }
                         else if(event.key===Qt.Key_F3 &&control)
                         {
                             if(type==maxtype)
                             type=0
                             else
                             type++
                             setType(type)
                             press_su.play_()
                         }
                         else if(event.key===Qt.Key_F4 &&control)
                         {
                             im.destroy()
                             generate_food()
                         }
                     }
}

