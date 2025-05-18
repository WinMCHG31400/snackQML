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
                return control.down ? "#80ffffff" : control.hovered ? "#30ffffff" : "#00ffffff";
        else return Qt.rgba(0,0,0,0.45);
    }
    property color colorBorder: {
        if (enabled)
                return control.down ? "#1677ff" : control.hovered ? "#69b1ff" : "#80808080";
            else return "#4096ff";
    }
    property string contentDescription: text
    property string toolTipText

    width: implicitContentWidth + leftPadding + rightPadding
    height: implicitContentHeight + topPadding + bottomPadding
    padding: 4
    topPadding: 2
    bottomPadding: 2
    font {
        family: "微软雅黑"
        pixelSize: 16
    }
    contentItem: Text {
        text: control.text
        font: control.font
        color: control.colorText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
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
    }
    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked();
}
