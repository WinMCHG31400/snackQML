import QtQuick

Image{//游戏界面

    function generate_food()
    {
        var lxj=Math.random()
        var image
        if(type==0 ||type==3)
        {
            if(lxj>0.9)
            {
                im_type=1
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_speed.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.85)
            {
                im_type=10
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_speed_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.75)
            {
                im_type=2
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_throuth.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.7)
            {
                im_type=20
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_throuth_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.65)
            {
                im_type=3
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_high.png'; width: 20; height: 20}", item);

            }
            else if(lxj>0.6)
            {
                im_type=4
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_s&t.png'; width: 20; height: 20}", item);

            }
            else
            {
                im_type=0
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);
            }

        }
        else if(type==1)
        {
            if(lxj>0.9)
            {
                im_type=1
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_speed.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.8)
            {
                im_type=10
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_speed_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.7)
            {
                im_type=2
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_throuth.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.6)
            {
                im_type=20
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_throuth_big.png'; width: 20; height: 20}", item);
            }
            else if(lxj>0.5)
            {
                im_type=3
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_high.png'; width: 20; height: 20}", item);

            }
            else if(lxj>0.4)
            {
                im_type=4
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food_s&t.png'; width: 20; height: 20}", item);

            }
            else
            {
                im_type=0
                image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);
            }
        }
        else
        {
            im_type=0
            image =im= Qt.createQmlObject("import QtQuick 2.14; Image { z:2147483647; source: 'qrc:/images/images/food.png'; width: 20; height: 20}", item);

        }
        x0=image.x=parseInt(Math.random()*40)*20
        y0=image.y=parseInt(Math.random()*30)*20
        //c++
    }
    function continua()
    {
        item.visible=true
        timer.running=true
        timer3.running=true
    }
    function setMaxtime(maxt){
        item_mm.setMaxtime(maxt)
    }
    function setMaxcent(maxcent){
        item_mm.setMaxcent(maxcent)
    }
    function setType(i){
        if(type==3 || type==2)
            smove=1
        else
            smove=0
        // if(type==3)
        //     timer.interval=100
        // else
        //     timer.interval=200
        set_difficulty(200)
        type=i
        item_mm.setType(i)
        im.destroy()
        generate_food()
    }
    function pause()
    {
        pausen=true
        item_mm.pause(true)
        timer.running=false
        timer3.running=false
        pause_i.visible=true
        pp_timer1.running=true
    }
    function pause_()
    {
        pp_timer2.running=true
    }
    function set_difficulty(i){
        sett.setd()
        timer.interval=difficulty=i
    }
    function diel(){
        pausen=true
        die.show(snack.cent+addcent,timer.tt/100)
    }
    function fastl()
    {
        if(timer.fast>0)
        {
            timer.interval=difficulty
            timer.fast=0
        }
        else
        {
            item_mm.sp_setText("2147483647")
            item_mm.sp_visible(true)
            timer.interval=difficulty/2
            timer.fast=2147483647
        }
    }
    function throl(){
        if(timer.throuth>0)
        {
            item_mm.th_refuse()
        }
        else
        {
            timer.throuth=2147483647
            item_mm.th_allow()
        }
    }
    function regen(){
        im.destroy()
        generate_food()
    }

    id:item
    property int x0 //存储生成的食物的位置
    property int y0 //存储生成的食物的位置
    property var im //存储生成的食物（Image）
    property bool isEat:true    //是否可以吃食物
    property bool isNe:true     //是否允许食物生成
    property bool isShow_:false //控制
    property bool isThro:false  //是否可以爬上自身
    property int im_type        //生成的食物的种类
    property bool control:false //是否开启开发者模式
    property int addcent:0      //额外增加的分数
    property int maxcent
    property int type:0
    property int maxtype:3
    property int smove:0
    property int difficulty:200
    property bool candie:true
    visible: false
    opacity: 0
    x:0
    y:0
    width: 800
    height: 600
    Component.onCompleted: {
        var i,j
        for(i=0;i<800;i+=20)//
        {
           for(j=0;j<600;j+=20)
            {
                var image = Qt.createQmlObject("import QtQuick 2.14; Image { z:-1; source: 'qrc:/images/images/back.png'; width: 20; height: 20}", item);
                image.x=i
                image.y=j
            }
        }
        if(Qt.platform.os!="windows")
            control_bu.visible=true
        generate_food()
        load_item.canstart()
    }
    Timer{
        id:pp_timer1
        interval: 5
        repeat: true
        running: false
        onTriggered: {
            if(pause_i.opacity<1)
                pause_i.opacity+=0.01
            else
            {
                running=false
            }
        }
    }
    Timer{
        id:pp_timer2
        interval: 5
        repeat: true
        running: false
        onTriggered: {
            if(pause_i.opacity>0)
                pause_i.opacity-=0.01
            else
            {
                pausen=false
                item_mm.pause(false)
                pause_i.visible=false
                timer.running=true
                timer3.running=true
                running=false
            }
        }
    }
    Timer{
        id:start_timer5
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            console.log("2")
            if(item.opacity>0)
                item.opacity-=0.1
            else
            {
                item.visible=false
                start_item.visible=true
                start_timer5.running=false
                start_timer6.running=true
            }
        }

    }
    Timer{
        id:start_timer6
        interval: 10
        repeat: true
        running: false
        onTriggered: {
            if(start_item.opacity<1)
                start_item.opacity+=0.1
            else
                start_timer6.running=false
        }
    }
    Timer{//计时专用计时器
        property int t:0
        property int tt
        id:timer3
        interval: 10
        repeat: true
        running:false
        onTriggered:{
            if(!pausen)
            {
                t+=1
                tt=t/100
                item_mm.setTime(tt)
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
            source:"qrc:/images/images/button.png"
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
            source:"qrc:/images/images/button.png"
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
            source:"qrc:/images/images/button.png"
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
            source:"qrc:/images/images/button.png"
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
        source: "qrc:/images/images/snack_hear.png"
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
            function isp(x,y){
                for(var i=0;i<=snack.num;i++)
                {
                    if(snack.body[i].y==y && snack.body[i].x==x)
                        return true
                }
                return false
            }
            property int fast:0
            property int throuth:0
            id: timer;
            repeat: true;
            running:false
            onTriggered:{
                if(fast>0)
                    timer.interval=difficulty/2
                else
                    timer.interval=difficulty
                if(!pausen)
                {
                    if(smove==1)
                    {
                        switch(hear.rotation)
                        {
                        case 270:
                            if(isThro? true:(!isp(hear.x,hear.y-20))){
                                body_move(hear.x,hear.y,270)
                                if(hear.y==0)
                                    hear.y=580
                                else
                                    hear.y-=20
                            }
                            else if(candie)
                                diel()
                            hear.rotation=270
                            isEat=true
                            break
                        case 180:
                            if(isThro? true:(!isp(hear.x-20,hear.y))){
                                body_move(hear.x,hear.y,180)
                                if(hear.x==0)
                                    hear.x=780
                                else
                                    hear.x-=20
                            }
                            else if(candie)
                                diel()
                            hear.rotation=180
                            isEat=true
                            break
                        case 90:
                            if((isThro? true:(!isp(hear.x,hear.y+20)))){
                                body_move(hear.x,hear.y,90)
                                if(hear.y==580)
                                    hear.y=0
                                else
                                    hear.y+=20
                            }
                            else if(candie)
                                diel()
                            hear.rotation=90
                            isEat=true
                            break
                        case 0:
                            if((isThro? true:(!isp(hear.x+20,hear.y)))){
                                body_move(hear.x,hear.y,0)
                                if(hear.x==780)
                                    hear.x=0
                                else
                                    hear.x+=20
                            }
                            else if(candie)
                                diel()
                            hear.rotation=0
                            isEat=true
                            break
                        }
                    }
                    if(throuth>0) timer.throuth--
                    if(throuth<=0)
                        item_mm.th_refuse()
                    if(fast>0) timer.fast--
                    if(fast<=0)
                    {
                        item_mm.sp_visible(false)
                        if(type==0 || type==1)
                             timer.interval=200
                        else
                            timer.interval=difficulty
                    }
                    if(smove==0){
                        if(snack.w==1)
                        {
                            if(hear.y>0 && (isThro? true:(!isp(hear.x,hear.y-20)))){
                                hear.y-=20
                                body_move(hear.x,hear.y+20,270)
                            }
                            hear.rotation=270
                            isEat=true
                        }
                        else if(snack.a==1)
                        {
                            if(hear.x>0 && (isThro? true:(!isp(hear.x-20,hear.y)))){
                                hear.x-=20
                                body_move(hear.x+20,hear.y,180)
                            }
                            hear.rotation=180
                            isEat=true
                        }
                        else if(snack.s==1)
                        {
                            if(hear.y<580 && (isThro? true:(!isp(hear.x,hear.y+20)))){
                                hear.y+=20
                                body_move(hear.x,hear.y-20,90)
                            }
                            hear.rotation=90
                            isEat=true
                        }
                        else if(snack.d==1)
                        {
                            if(hear.x<780 && (isThro? true:(!isp(hear.x+20,hear.y)))){
                                hear.x+=20
                                body_move(hear.x-20,hear.y,0)
                            }
                            hear.rotation=0
                            isEat=true
                        }
                    }
                    if(hear.x==x0 && hear.y==y0 && isEat)//吃到食物
                    {
                        if(doud) move_ea.play()
                        switch(im_type)
                        {
                        case 1:
                            if(timer.fast>2147483467)
                                timer.fast=2147483647
                            else
                                timer.fast+=180
                            timer.interval=difficulty/2
                            item_mm.sp_visible(true)
                            break
                        case 10:
                            if(timer.fast>2147481847)
                                timer.fast=2147483647
                            else
                                timer.fast+=1800
                            timer.interval=difficulty/2
                            item_mm.sp_visible(true)
                            break
                        case 2:
                            if(timer.throuth>2147483467)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=180
                            item_mm.th_allow()
                            break
                        case 20:
                            if(timer.throuth>2147481847)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=1800
                            item_mm.th_allow()
                            break
                        case 3:
                            addcent+=9
                            break
                        case 4:
                            if(timer.fast>2147483467)
                                timer.fast=2147483647
                            else
                                timer.fast+=180
                            timer.interval=difficulty/2
                            item_mm.sp_visible(true)
                            if(timer.throuth>2147483467)
                                timer.throuth=2147483647
                            else
                                timer.throuth+=180
                            item_mm.th_allow()
                            break
                        default:break
                        }
                        item_mm.set_length((snack.num+3)+"m")
                        snack.cent++
                        snack.num++
                        var image=snack.body[snack.num]= Qt.createQmlObject("import QtQuick 2.14; Image { z:2; source: 'qrc:/images/images/snack_body1.png'; width: 20; height: 20}", item);
                        var aa
                        if(snack.num>=1)
                            aa=snack.body[snack.num-1]
                        else
                            aa=hear
                        var re=aa.rotation*Math.PI/180.0
                        image.rotation=aa.rotation
                        image.x=aa.x+(-Math.cos(re)*20)
                        image.y=aa.y+(-Math.sin(re)*20)
                        image.z=2147483600-snack.num
                        if((snack.cent+addcent)>maxcent)
                        {
                            file.setSource(filel+"/data.d")
                            file.write(snack.cent+addcent)
                            item_mm.setMaxcent(snack.cent+addcent)
                            file.setSource(filel+"/data2.d")
                            file.write(timer3.t)
                            item_mm.setMaxcent(Math.floor(timer3.t/100))
                        }
                        im.destroy()
                        generate_food()
                    }
                }

            }
        }
    }
    Faceplate{
        id:item_mm
    }

    Die{
        z:2147483647
        visible: false
        id:die
    }
    Image {//暂停
        id: pause_i
        opacity: 0
        visible: false
        x:0
        y:0
        z:2147483647
        source: "qrc:/images/images/pause.png"
        Exit_item{
            id:exit_item
        }
    }

    function press_W()
    {
        if(smove==1)
        {
            if(snack.num==-1? true:hear.rotation!=90)
                hear.rotation=270
        }
        else
            snack.w=1;
    }
    function press_A()
    {
        if(smove==1)
        {
            if(snack.num==-1? true:hear.rotation!=0)
                hear.rotation=180
        }
        else
            snack.a=1
    }
    function press_S()
    {
        if(smove==1)
        {
            if(snack.num==-1? true:hear.rotation!=270)
                hear.rotation=90
        }
        else
            snack.s=1;
    }
    function press_D()
    {
        if(smove==1)
        {

            if(snack.num==-1? true:hear.rotation!=180)
            {
                hear.rotation=0
            }
        }
        else
            snack.d=1;
    }

    Keys.onPressed: {
        if(event.key===Qt.Key_W)
        {
            press_W()
        }
        else if(event.key===Qt.Key_A)
        {
            press_A()
        }
        else if(event.key===Qt.Key_S)
        {
            press_S()
        }
        else if(event.key===Qt.Key_D)
        {
            press_D()
        }
        if(event.key===Qt.Key_Up)
        {
            press_W()
        }
        else if(event.key===Qt.Key_Left)
        {
            press_A()
        }
        else if(event.key===Qt.Key_Down)
        {
            press_S()
        }
        else if(event.key===Qt.Key_Right)
        {
            press_D()
        }
        if(event.key===Qt.Key_V)
        {
            if(doud)
            {
                doud=false
                bu_soude__bu.text="关闭音效"
            }
            else
            {
                doud=true
                bu_soude__bu.text="开启音效"
                press_su.play()
            }
        }
        else if(event.key===Qt.Key_Space)
        {
            if(pause_i.visible)
                item.pause_()
            else
                item.pause()
            press_su.play_()
        }
        else if(event.key===Qt.Key_Escape)
        {
            if(pause_i.visible)
                item.pause_()
            else
                item.pause()
        }
    }
    Keys.onReleased: {
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
            win.title="SnackQML//开发者模式"
            control=true
            press_su.play_()
        }
        else if(event.key===Qt.Key_F1 &&control)
        {
            if(timer.fast>0)
            {
                timer.interval=difficulty
                timer.fast=0
            }
            else
            {
                item_mm.sp_setText("2147483647")
                item_mm.sp_visible(true)
                timer.interval=difficulty/2
                timer.fast=2147483647
            }
            press_su.play_()
        }
        else if(event.key===Qt.Key_F2 &&control)
        {
            if(timer.throuth>0)
            {
                item_mm.th_refuse()
            }
            else
            {
                timer.throuth=2147483647
                item_mm.th_allow()
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
        else if(event.key===Qt.Key_F5 &&control)
        {

        }
        else if(event.key===Qt.Key_F6 &&control)
        {
            sett.visible=sett.visible? false:true
        }
        else if(event.key===Qt.Key_F7)
        {
            if(win.visibility==Window.Windowed)
            {
                donot=false
                win.visibility=Window.FullScreen
                photo.visible=true
                photo.x=(win.width-win.height)/2
                photo.width=win.height
                photo.height=win.height
                photo.run(true)
            }
            else
            {
                donot=true
                win.visibility=Window.Windowed
                photo.visible=false
                photo.run(false)
            }
        }
    }
}

