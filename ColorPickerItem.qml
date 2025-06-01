import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    id: root
    width: 200
    height: 79
    readonly property real r:redSlider.value
    readonly property real g:greSlider.value
    readonly property real b:bluSlider.value
    readonly property real a:alpSlider.value
    readonly property color color_:Qt.rgba(r,g,b,a)
    function setColor(r_,g_,b_,a_){
        redScroll.setValue(r_)
        greScroll.setValue(g_)
        bluScroll.setValue(b_)
        alpScroll.setValue(a_)
    }
    signal accepted();
    signal rejected();
    Item {
        x:1
        y:1
        property point startPos: Qt.point(0, 0)
        property point offsetPos: Qt.point(0, 0)
        Rectangle {
            anchors.fill: parent
            color: "#f6f6f6"
        }
        Item{
            x:162
            Item {
                id: previewItem
                width: 38
                height: 15

                Grid {
                    id: previwBackground
                    anchors.fill: parent
                    rows: 11
                    columns: 11
                    clip: true

                    property real cellWidth: width / columns
                    property real cellHeight: height / rows

                    Repeater {
                        model: parent.columns * parent.rows

                        Rectangle {
                            width: previwBackground.cellWidth
                            height: width
                            color: (index % 2 == 0) ? "gray" : "transparent"
                        }
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    color: Qt.rgba(redSlider.value,greSlider.value,bluSlider.value,alpSlider.value)
                    border.color: "#e6e6e6"
                    border.width: 1
                }
            }
            Rectangle{
                x:0
                y:15
                width: 38
                height: 15
                color:Qt.rgba(0.8,0.8,0.8)
                Text{
                    anchors.fill: parent
                    id:vr
                    text:"R:"+(redSlider.value * 255).toFixed(0);
                    font.pixelSize: 14
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Rectangle{
                x:0
                y:30
                width: 38
                height: 15
                color:Qt.rgba(0.8,0.8,0.8)
                Text{
                    anchors.fill: parent
                    id:vg
                    text:"G:"+(greSlider.value * 255).toFixed(0);
                    font.pixelSize: 14
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Rectangle{
                x:0
                y:45
                width: 38
                height: 15
                color:Qt.rgba(0.8,0.8,0.8)
                Text{
                    anchors.fill: parent
                    id:vb
                    text:"B:"+(bluSlider.value * 255).toFixed(0);
                    font.pixelSize: 14
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Rectangle{
                x:0
                y:60
                width: 38
                height: 15
                color:Qt.rgba(0.8,0.8,0.8)
                Text{
                    anchors.fill: parent
                    id:va
                    text:"A:"+(alpSlider.value * 255).toFixed(0);
                    font.pixelSize: 14
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Item{
            id:redScroll
            function setValue(vl){
                redSlider.x = Math.min(Math.max(0,vl*(redPicker.width-redSlider.width)),redPicker.width-redSlider.width)
            }
            Cbutton{
                width: 10
                height: 15
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: "<"
                onClicked: redScroll.setValue(redSlider.value-1/256)
                toolTipText: "减小"
            }
            Cbutton{
                width: 10
                height: 15
                x:150
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: ">"
                onClicked: redScroll.setValue(redSlider.value+1/256)
                toolTipText: "增大"
            }
            Rectangle {
                id: redPicker
                width: 140
                height: 15
                x:10
                y:0
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0;  color: Qt.rgba(0,greSlider.value,bluSlider.value) }
                    GradientStop { position: 1.0;  color: Qt.rgba(1,greSlider.value,bluSlider.value) }
                }

                Rectangle {
                    id: redSlider
                    width: height
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    border.color: "#e6e6e6"
                    border.width: 2
                    scale: 0.9
                    color: Qt.rgba(redSlider.value,greSlider.value,bluSlider.value)

                    property real value: x / (parent.width - width)
                }

                MouseArea {
                    anchors.fill: parent

                    function handleCursorPos(x) {
                        let halfWidth = redSlider.width * 0.5;
                        redSlider.x = Math.max(0, Math.min(width, x + halfWidth) - redSlider.width);
                    }
                    onPressed: (mouse) => {
                        handleCursorPos(mouse.x, mouse.y);
                    }
                    onPositionChanged: (mouse) => handleCursorPos(mouse.x);
                }
            }
        }


        Item{
            id:greScroll
            y:20
            function setValue(vl){
                greSlider.x = Math.min(Math.max(0,vl*(grePicker.width-greSlider.width)),grePicker.width-greSlider.width)
            }
            Cbutton{
                width: 10
                height: 15
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: "<"
                onClicked: greScroll.setValue(greSlider.value-1/256)
                toolTipText: "减小"
            }
            Cbutton{
                width: 10
                height: 15
                x:150
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: ">"
                onClicked: greScroll.setValue(greSlider.value+1/256)
                toolTipText: "增大"
            }
            Rectangle {
                id: grePicker
                width: 140
                height: 15
                x:10
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0;  color: Qt.rgba(redSlider.value,0,bluSlider.value) }
                    GradientStop { position: 1.0;  color: Qt.rgba(redSlider.value,1,bluSlider.value) }
                }

                Rectangle {
                    id: greSlider
                    width: height
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    border.color: "#e6e6e6"
                    border.width: 2
                    scale: 0.9
                    color: Qt.rgba(redSlider.value,greSlider.value,bluSlider.value)

                    property real value: x / (parent.width - width)
                }

                MouseArea {
                    anchors.fill: parent

                    function handleCursorPos(x) {
                        let halfWidth = greSlider.width * 0.5;
                        greSlider.x = Math.max(0, Math.min(width, x + halfWidth) - greSlider.width);
                    }
                    onPressed: (mouse) => {
                        handleCursorPos(mouse.x, mouse.y);
                    }
                    onPositionChanged: (mouse) => handleCursorPos(mouse.x);
                }
            }
        }



        Item{
            id:bluScroll
            y:40
            function setValue(vl){
                bluSlider.x = Math.min(Math.max(0,vl*(bluPicker.width-bluSlider.width)),bluPicker.width-bluSlider.width)
            }
            Cbutton{
                width: 10
                height: 15
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: "<"
                onClicked: bluScroll.setValue(bluSlider.value-1/256)
                toolTipText: "减小"
            }
            Cbutton{
                width: 10
                height: 15
                x:150
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: ">"
                onClicked: bluScroll.setValue(bluSlider.value+1/256)
                toolTipText: "增大"
            }
            Rectangle {
                id: bluPicker
                width: 140
                height: 15
                x:10
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0;  color: Qt.rgba(redSlider.value,greSlider.value,0) }
                    GradientStop { position: 1.0;  color: Qt.rgba(redSlider.value,greSlider.value,1) }
                }

                Rectangle {
                    id: bluSlider
                    width: height
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    border.color: "#e6e6e6"
                    border.width: 2
                    scale: 0.9
                    color: Qt.rgba(redSlider.value,greSlider.value,bluSlider.value)

                    property real value: x / (parent.width - width)
                }

                MouseArea {
                    anchors.fill: parent

                    function handleCursorPos(x) {
                        let halfWidth = bluSlider.width * 0.5;
                        bluSlider.x = Math.max(0, Math.min(width, x + halfWidth) - bluSlider.width);
                    }
                    onPressed: (mouse) => {
                        handleCursorPos(mouse.x, mouse.y);
                    }
                    onPositionChanged: (mouse) => handleCursorPos(mouse.x);
                }
            }
        }
        Item{
            id:alpScroll
            y:60
            function setValue(vl){
                alpSlider.x = Math.min(Math.max(0,vl*(alphaPicker.width-alpSlider.width)),alphaPicker.width-alpSlider.width)
            }
            Cbutton{
                width: 10
                height: 15
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: "<"
                onClicked: alpScroll.setValue(alpSlider.value-1/256)
                toolTipText: "减小"
            }
            Cbutton{
                width: 10
                height: 15
                x:150
                radiusBg: 0
                padding: 0
                topPadding:0
                bottomPadding: 0
                text: ">"
                onClicked: alpScroll.setValue(alpSlider.value+1/256)
                toolTipText: "增大"
            }
            Item {
                id: alpPickerItem
                width: 140
                height: 15
                x:10
                Grid {
                    id: alphaPicker
                    anchors.fill: parent
                    rows: 4
                    columns: 29
                    clip: true

                    property real cellWidth: width / columns
                    property real cellHeight: height / rows

                    Repeater {
                        model: parent.columns * parent.rows

                        Rectangle {
                            width: alphaPicker.cellWidth
                            height: width
                            color: (index % 2 == 0) ? "gray" : "transparent"
                        }
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 1.0; color: "#ff000000" }
                        GradientStop { position: 0.0; color: "#00ffffff" }
                    }
                }

                Rectangle {
                    id: alpSlider
                    x: parent.width - width
                    width: height
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    color: Qt.rgba(0.1, 0.1, 0.1, (value + 1.0) / 2.0)
                    border.color: "#e6e6e6"
                    border.width: 2
                    scale: 0.9


                    property real value: x / (parent.width - width)

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 1
                        color: "transparent"
                        border.color: "white"
                        border.width: 1
                    }
                }

                MouseArea {
                    anchors.fill: parent

                    function handleCursorPos(x) {
                        let halfWidth = alpSlider.width * 0.5;
                        alpSlider.x = Math.max(0, Math.min(width, x + halfWidth) - alpSlider.width);
                    }
                    onPressed: (mouse) => {
                                   handleCursorPos(mouse.x, mouse.y);
                               }

                    onPositionChanged: (mouse) => handleCursorPos(mouse.x);
                }
            }
        }
    }

}
