import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Button {
    id: control
    property int type:0
    property int radiusBg: 0
    property color colorText_common:"#000000"
    property color colorText_hovered:"#4096ff"
    property color colorText_down:"#1677ff"
    property color colorBorder_common:"#80808080"
    property color colorBorder_hovered:"#69b1ff"
    property color colorBorder_down:"#1677ff"
    property color colorBg_common:"#00000000"
    property color colorBg_hovered: "#d4d4d4"
    property color colorBg_down:"#4096ff"
    property color colorText: {
        if (enabled)
        {
            switch(type){
            case 0:
                return control.down ? "#1677ff" : control.hovered ? "#4096ff" : "#000000"
            case 1:
                return "#000000"
            case 2:
                return "#00000000"
            case 3:
                return control.down ? "#ff1600" : control.hovered ? "#FF7070" : "#000000"
            case 4:
                return control.down ? colorText_down : control.hovered ? colorText_hovered : colorText_common
            }
        }
        else return Qt.rgba(0,0,0,0.45);
    }
    property color colorBg: {
        if (enabled)
        {
            switch(type){
            case 0:return control.down ? "#00ffffff" : control.hovered ? "#00ffffff" : "#00ffffff";
            case 1:return control.down ? "#4096ff" : control.hovered ? "#90c8f6" : (control.seleted?"#90c8f6":"#00ffffff");
            case 2:return control.seleted ? "#4096ff" : control.hovered ? "#d4d4d4" :"#00000000"
            case 3:return "#00000000"
            case 4:return control.down ? colorBg_down : control.hovered ? colorBg_hovered : colorBg_common
            }
        }
        else return Qt.rgba(0,0,0,0.45);
    }
    property color colorBorder: {
        if (enabled){
            switch(type){
            case 0:return control.down ? "#1677ff" : control.hovered ? "#69b1ff" : "#80808080";
            case 1:return "#FFFFFF";
            case 2:return "#00000000"
            case 3:return control.down ? "#ff1600" : control.hovered ? "#FF7070" : "#000000"
            case 4:return control.down ? colorBorder_down : control.hovered ? colorBorder_hovered : colorBorder_common
            }
        }
        else return "#4096ff";
    }
    property string contentDescription: text
    property string toolTipText
    property bool seleted:false
    property string img

    width: implicitContentWidth + leftPadding + rightPadding
    height: implicitContentHeight + topPadding + bottomPadding
    padding: 4
    topPadding: 2
    bottomPadding: 2
    font {
        family: "微软雅黑"
        pixelSize: 12
    }
    contentItem: Text {
        text: control.text
        font: control.font
        color: control.colorText
        horizontalAlignment: type!=2?Text.AlignHCenter:Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        leftPadding: type==1?height:0
    }
    background: Item {
        Rectangle {
            id: __bg
            width: realWidth
            height: realHeight
            anchors.centerIn: parent
            radius:control.radiusBg
            color: control.colorBg
            border.width: 1
            border.color: control.enabled ? control.colorBorder : "transparent"

            property real realWidth: parent.width
            property real realHeight: parent.height
        }
        Image{
            width: control.height
            height: width
            source: "./images/check.png"
            visible: type==1?(checkable?(checked?true:false):false):false
        }
        Image {
            visible: type==2
            id:img_
            anchors.centerIn:parent
            source: img
            x:width*0.25
            y:x
            width: parent.width>parent.height ? control.height*0.8 : control.width*0.8
            height: width
            ColorOverlay{
                anchors.fill: parent
                color:"#FFFFFF"
                source: parent
                visible: seleted?true:false
            }
        }
    }
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked();
}
