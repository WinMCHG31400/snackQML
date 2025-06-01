import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

Button {
    id: control
    property int radiusBg: 0
    property color colorText: {
        if (enabled)
            return control.down ? "#1677ff" : control.hovered ? "#4096ff" : "#000000"
        else return Qt.rgba(0,0,0,0.45);
    }
    property color colorBg: {
        if (enabled)
                return control.checked? (control.down ? "#1677ff" : control.hovered ? "#4096ff" : "#80808080"):(control.down ? "#1677ff" : control.hovered ? "#604096ff" : "#00ffffff")
        else return Qt.rgba(0,0,0,0);
    }
    property color colorBorder: {
        if (enabled)
                return control.down ? "#1677ff" : control.hovered ? "#69b1ff" : "#80808080";
        else return "#4096ff";
    }
    property string contentDescription: text
    property string toolTipText

    checkable: true
    width: implicitContentWidth + leftPadding + rightPadding+height
    height: implicitContentHeight + topPadding + bottomPadding
    padding: 2
    font {
        family: "微软雅黑"
        pixelSize: 16
    }
    contentItem:Text{
        text: control.text
        font: control.font
        color: control.colorText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: control.height/2
        anchors.verticalCenterOffset: 1
        elide: Text.ElideRight
    }


    background: Item {
        Rectangle {
            id: __bg
            x:control.padding
            y:control.padding
            width: control.height
            height: control.height
            Rectangle{
                anchors.centerIn: __bg
                color: control.colorBg
                radius:control.radiusBg
                width: control.height*0.7
                height: width
            }
            radius:control.radiusBg
            border.width: 1
            border.color: control.enabled ? control.colorBorder : "#80808080"
        }
    }
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked();
}
