import QtQuick

Image{//游戏界面
    id:item
    property int x0 //存储生成的食物的位置
    property int y0 //存储生成的食物的位置
    property var im //存储生成的食物（Image）
    property bool canGenerate:true//是否允许食物生成
    property bool isShow_:false //控制
    property bool canThrough:$through>0?true:false  //是否可以爬上自身
    property bool isFast:$fast>0?true:false
    property int im_type//生成的食物的种类
    property int addcent:0//额外增加的分数
    property int maxcent:0//最高分
    property int type:0//游戏模式
    property bool control:false
    property int maxtype:3//游戏模式最大值
    property bool is_autoMove:false//是否自动移动
    property int generateFoodType:0
    property bool canCrossBorder:false
    property int difficulty:150//难度
    property bool canDie:true//是否允许死亡
    property real back_opacity:0.1//背景透明度
    property real snackOpacity:0//蛇透明度
    property int next_type:0//下一个界面序号
    property bool next:false//下一个界面
    property Component c_body:Qt.createComponent("./SnakeBody.qml")
    property string s
    enabled: false
    visible: false
    opacity: 0
    width: 800
    height: 600
    function initialize(ac=-1,t=0,f=0,th=0,x=0,y=0,r=0,s_){//保存的游戏初始化
        if(ac==-1)
        {
            var c
            c=s.slice(0,s.indexOf(","))=="true"?true:false
            $item.canDie=c
            s=s.slice(s.indexOf(",")+1,s.length)
            c=s.slice(0,s.indexOf(","))=="true"?true:false
            $item.canCrossBorder=c
            s=s.slice(s.indexOf(",")+1,s.length)
            c=s.slice(0,s.indexOf(","))=="true"?true:false
            $item.is_autoMove=c
        }
        else
        {
            addcent=ac
            timer3.t=t*100
            $fast=f
            $through=th
            hear.x=x
            hear.y=y
            hear.rotation=r
            s=s_
        }
    }
    function reColor(){
        for(var i=0;i<snack.body.length;i++)
            snack.body[i].resetColor()
    }
    function save(path="./.save"){//保存游戏
        file.setSource(path)
        var a=type+","+canDie+","+canCrossBorder+","+is_autoMove+","+difficulty+","+snack.body.length+","+addcent+","+timer3.tt+","+$fast+","+$through+","
        a+=hear.x+","+hear.y+","+hear.rotation+","
        for(var i=0;i<snack.body.length;i++)
            a+=snack.body[i].x+","+snack.body[i].y+","+snack.body[i].rotation+","
        file.write(a)
    }
    function generate_food(){//生成食物
        var lxj=Math.random()
        var image
        if(generateFoodType==0)
        {
            if(lxj>0.95)
            {
                im_type=1
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_speed.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.875)
            {
                im_type=10
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_speed_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.825)
            {
                im_type=2
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_throuth.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.8)
            {
                im_type=20
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_throuth_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.85)
            {
                im_type=3
                image =im= Qt.createQmlObject("import QtQuick; Image { z:214748364; source: './images/food_high.png'; width: 20; height: 20}", item);

            }
            else if(lxj>0.83)
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
        else if(generateFoodType==1)
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
        image.z=2147483467
        if(snack.body.length<600)
        {
            if(timer.isBody(x0,y0)){
                im.destroy()
                generate_food()
            }
        }
        else if(x0==hear.x&&y0==hear.y){
            im.destroy()
            generate_food()
        }
    }
    function setType(i){//修改模式
        type=i
        switch(type){
        case 0:
            canCrossBorder=false
            generateFoodType=0
            is_autoMove=false
            break
        case 1:
            canCrossBorder=true
            generateFoodType=2
            is_autoMove=true
            break
        case 2:
            canCrossBorder=false
            generateFoodType=1
            is_autoMove=false
            break
        case 3:break
        }
        im.destroy()
        generate_food()
    }
    function set_difficulty(i){//修改难度
        difficulty=i
    }
    function die_(){//死亡
        timer.running=false
        timer3.running=false
        die.show(snack.cent+addcent,timer.tt/100)
    }
    function press_W(){
        if(is_autoMove==1)
        {
            if(snack.body.length>0)
            {
                if(snack.body[0].rotation!=90)hear.rotation=270
            }
            else hear.rotation=270
        }
        else
            snack.w=1;
    }
    function press_A(){
        if(is_autoMove==1)
        {
            if(snack.body.length>0)
            {
                if(snack.body[0].rotation!=0)hear.rotation=180
            }
            else hear.rotation=180
        }
        else
            snack.a=1
    }
    function press_S(){
        if(is_autoMove==1)
        {
            if(snack.body.length>0)
            {
                if(snack.body[0].rotation!=270)hear.rotation=90
            }
            else hear.rotation=90
        }
        else
            snack.s=1;
    }
    function press_D(){
        if(is_autoMove==1)
        {
            if(snack.body.length>0)
            {
                if(snack.body[0].rotation!=180)hear.rotation=0
            }
            else hear.rotation=0
        }
        else
            snack.d=1;
    }
    function createBody(x=-1,y=-1,r=-1){//生成身体
        var this_body=c_body.createObject(item)
        snack.body.push(this_body)
        var last_body=snack.body.length>=1?snack.body[snack.body.length-1]:hear
        var re=last_body.rotation*Math.PI/180.0
        this_body.initialize(item,snack,hear,2047483467-snack.body.length,r===-1?last_body.rotation:r,x===-1?last_body.x+(-Math.cos(re)*20):x,y===-1?last_body.y+(-Math.sin(re)*20):y,snack.body.length-1)
        for(var i=0;i<snack.body.length;i++)
        {
            snack.body[i].resetColor()
            snack.body[i].resetRotation()
        }
    }
    Rectangle{//背景
        id:back
        color:"#00000000"
        anchors.fill: parent
        opacity: back_opacity
    }
    Component.onCompleted: {//生成背景
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
        onStarted: {
            start_set.z=-1
            start_set.visible=false
        }
        onStopped: {
            timer.running=true
            timer3.running=true
            $doud=true
            initialize(-1,0,0,0,0,0,0,s)
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
                lt.text=snack.body.length+1
                ct.text=snack.body.length+addcent+1
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
        property int type:0
        z:2147483466
        x:200
        y:200
        width: 20
        height: 20
        visible: true
        id: hear
        source: type==0?"./images/snack_hear.png":"./images/snack_hear"+hear.type+".png"
        Image{
            id:hear_
            anchors.fill: parent
            source:"./images/snack_hear0.png"
        }
    }
    Item {//蛇身体
        z:2
        focus: true
        id:snack
        x:0
        y:0
        width: 800
        height: 600
        property int w: 0
        property int a: 0
        property int s: 0
        property int d: 0
        property var body:[]
        property int num:-1
        Timer{
            function body_move(x,y,r){
                var x0,y0,r0
                for(var i=0;i<snack.body.length;i++)
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
                    if(snack.body[i].rotation<0)snack.body[i].rotation+=360
                    else if(snack.body[i].rotation>360)snack.body[i].rotation-=360
                }
                for(i=0;i<snack.body.length;i++)
                    snack.body[i].resetRotation()
            }
            function isBody(x,y){
                for(var i=0;i<snack.body.length;i++)
                {
                    if(snack.body[i].y==y && snack.body[i].x==x)
                        return true
                }
                return false
            }
            function getBody(x,y){
                for(var i=0;i<snack.body.length;i++)
                {
                    if(snack.body[i].y==y && snack.body[i].x==x)
                        return i
                }
                return -1
            }
            id: timer;
            repeat: true;
            running:false
            interval:isFast?difficulty/2:difficulty
            onIntervalChanged: $delTime=interval
            onTriggered:{
                if(!pausen)
                {
                    if(is_autoMove)
                    {
                        switch(hear.rotation)
                        {
                        case 270:
                            if(canThrough? true:(!isBody(hear.x,hear.y-20))){
                                if(hear.y>0)
                                {
                                    body_move(hear.x,hear.y,270)
                                    hear.y-=20
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,270)
                                    hear.y=580
                                }
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=270
                            break
                        case 180:
                            if(canThrough? true:(!isBody(hear.x-20,hear.y))){
                                if(hear.x>0)
                                {
                                    body_move(hear.x,hear.y,180)
                                    hear.x-=20
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,180)
                                    hear.x=780
                                }
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=180
                            break
                        case 90:
                            if((canThrough? true:(!isBody(hear.x,hear.y+20)))){
                                if(hear.y<580)
                                {
                                    body_move(hear.x,hear.y,90)
                                    hear.y+=20
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,90)
                                    hear.y=0
                                }
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=90
                            break
                        case 0:
                            if((canThrough? true:(!isBody(hear.x+20,hear.y)))){
                                if(hear.x<780)
                                {
                                    body_move(hear.x,hear.y,0)
                                    hear.x+=20
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,0)
                                    hear.x=0
                                }
                            }
                            else if(canDie)
                                die_()
                            hear.rotation=0
                            break
                        }
                    }
                    if($through>0) $through--
                    if($fast>0) $fast--
                    if(!is_autoMove){
                        var r,f=false,l=hear.rotation
                        if(snack.w==1)r=270
                        else if(snack.a==1)r=180
                        else if(snack.s==1)r=90
                        else if(snack.d==1)r=0
                        switch(r)
                        {
                        case 0:
                            hear.type=0
                            if(canThrough? true:(!isBody(hear.x+20,hear.y))){
                                if(hear.x<780)
                                {
                                    hear.x+=20
                                    body_move(hear.x-20,hear.y,0)
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,0)
                                    hear.x=0
                                }
                            }
                            else if(snack.body.length>0)
                            {
                                if(snack.body[0].rotation==180)
                                    hear.type=3
                                else
                                    f=true
                            }
                            hear.rotation=0
                            break
                        case 90:
                            hear.type=0
                            if(canThrough? true:(!isBody(hear.x,hear.y+20))){
                                if(hear.y<580)
                                {
                                    hear.y+=20
                                    body_move(hear.x,hear.y-20,90)
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,90)
                                    hear.y=0
                                }
                            }
                            else if(snack.body.length>0)
                            {
                                if(snack.body[0].rotation==270)
                                    hear.type=3
                                else
                                    f=true
                            }
                            hear.rotation=90
                            break
                        case 180:
                            hear.type=0
                            if(canThrough? true:(!isBody(hear.x-20,hear.y))){
                                if(hear.x>0)
                                {
                                    body_move(hear.x,hear.y,180)
                                    hear.x-=20
                                }
                                else if(canCrossBorder)
                                {
                                    hear.x=780
                                    body_move(hear.x+20,hear.y,180)
                                }
                            }
                            else if(snack.body.length>0)
                            {
                                if(snack.body[0].rotation==0)
                                    hear.type=3
                                else
                                    f=true
                            }
                            hear.rotation=180
                            break
                        case 270:
                            hear.type=0
                            if(canThrough? true:(!isBody(hear.x,hear.y-20))){
                                if(hear.y>0)
                                {
                                    hear.y-=20
                                    body_move(hear.x,hear.y+20,270)
                                }
                                else if(canCrossBorder)
                                {
                                    body_move(hear.x,hear.y,270)
                                    hear.y=580
                                }
                            }
                            else if(snack.body.length>0)
                            {
                                if(snack.body[0].rotation==90)
                                    hear.type=3
                                else
                                    f=true
                            }
                            hear.rotation=270
                        }
                        if(f)
                        {
                            var this_=hear.rotation-snack.body[0].rotation
                            if(this_<0)this_+=360
                            if(this_==90)
                                hear.type=1
                            else if(this_==270)
                                hear.type=2
                        }
                    }
                    if(hear.x==x0 && hear.y==y0)//吃到食物
                    {
                        move_ea.play_()
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
                        hear_.visible=false
                        if((snack.body.length+addcent)>maxcent)
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
    Rectangle{//参数面板
        id:item_mm
        x:800
        y:0
        width: 100
        height: 600
        Rectangle {//显示分数
            z:10
            x:0
            y:0
            width: 100
            height: 40
            color: "#FFFF00"
            Text {
                id:ct
                anchors.centerIn: parent
                font.pixelSize: 30
                font.bold: true
                text: snack.body.length+addcent
            }
        }
        Rectangle {//显示长度
            z:10
            x:0
            y:40
            width: 100
            height: 40
            color: "#FFFF00"
            Text {
                id: lt
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
                text: snack.body.length
            }
        }
        Rectangle {//显示时间
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
                text: timer3.tt+"s"
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
                case 1:return "#FFFFFF"
                case 2:return "#FF0000"
                case 3:return "#bf00ff"
                }

            }
            Text {
                id: h_t
                anchors.centerIn: parent
                font.pixelSize: 18
                font.bold: true
                text: {
                    switch(type){
                    case 0:return $enMode?"Common":"普通模式"
                    case 1:return $enMode?"Typical":"经典模式"
                    case 2:return $enMode?"High Odds":"高概率模式"
                    case 3:return $enMode?"Custom":"自定义模式"
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
                        bu_control__bu.text=$enMode?"show control button":"显示控制按钮"
                        control_bu.visible=true
                    }

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
            colorBg: "#9aa7d6"
            checkable: true
            checked: true
            colorBorder: "#00000000"
            onClicked: $doud=!checked
            Text {
                id:bu_soude__bu
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: $doud?($enMode?"Adiuo":"开启音效"):($enMode?"No Adiuo":"关闭音效")
            }
        }
        Rectangle {//设置按钮
            z:10
            x:0
            y:380
            width: 100
            height: 30
            color: "#5f6061"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                font.bold: true
                text: $enMode?"Setting":"设置"
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    setting.visible=true
                }
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

                }
            }
        }
    }
    Rectangle{//死亡界面
        visible: false
        width: 900
        height:600
        property int centl:0
        Behavior on opacity { NumberAnimation { easing.type: Easing.InOutQuad; duration: 1350 } }
        property int t
        opacity: 0
        id:die
        z:2147483647
        color:"#40FFFF00"
        function show(cent,time)
        {
            visible=true
            opacity=1
            centl=snack.body.length+addcent
            t=timer3.tt
        }
        Rectangle {
            width: $enMode?140:100
            height:110
            x:(back.width-width)/2
            y:(back.height-height)/2
            color:"#60FFFF00"
            Text{
                x:(parent.width-width)/2
                y:10
                color:"#FF0000"
                text:$enMode?"Game Over":"游戏失败"
                font.pixelSize: 20
            }
            Text{
                x:(parent.width-width)/2
                y:40
                text:($enMode?"cent:":"分数：")+die.centl
                font.pixelSize: 20
            }
            Text{
                x:(parent.width-width)/2
                y:70
                text:($enMode?"time:":"用时：")+die.t
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
    Text{
        text: "canDie:"+canDie+"\ncanCrossBorder:"+canCrossBorder+"\nautoMove:"+is_autoMove+"\ndifficuty:"+difficulty+"\ngenerateFoodType:"+generateFoodType
        visible: $sbInfo
        z:2147483467
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
                       }
                       else if(event.key===Qt.Key_Space)
                       {
                           if(!die.visible)
                           pause_i.enabled=!pause_i.enabled

                       }
                       else if(event.key===Qt.Key_Escape)
                       {
                           if(!die.visible)
                           pause_i.enabled=!pause_i.enabled

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
                             $control=true

                         }
                         else if(event.key===Qt.Key_F1 &&$control)
                         {
                             if($fast>0)
                             {
                                 $fast=0
                             }
                             else
                             {
                                 $fast=2147483647
                             }

                         }
                         else if(event.key===Qt.Key_F2 &&$control)
                         {
                             if($through>0)
                             {
                                 $through=0
                             }
                             else
                             {
                                 $through=2147483647
                             }
                         }
                         else if(event.key===Qt.Key_F3 &&$control)
                         {
                             if(type==maxtype)
                             type=0
                             else
                             type++
                             setType(type)
                         }
                         else if(event.key===Qt.Key_F4 &&$control)
                         {
                             $sbInfo=!$sbInfo
                         }
                         else if(event.key===Qt.Key_F5 &&$control)
                         {
                             im.destroy()
                             generate_food()
                         }
                         else if(event.key===Qt.Key_F6 &&$control)
                         {
                             canDie=!canDie
                         }
                         else if(event.key===Qt.Key_F7 &&$control)
                         {
                             canCrossBorder=!canCrossBorder
                         }
                         else if(event.key===Qt.Key_F8 &&$control)
                         {
                             is_autoMove=!is_autoMove
                         }
                         else if(event.key===Qt.Key_F9 &&$control)
                         {
                             if(generateFoodType==2)
                             generateFoodType=0
                             else
                             generateFoodType+=1
                         }
                     }
}
