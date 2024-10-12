import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Bridge 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("")
    //    flags: Window.FramelessWindowHint
    Bridge{
        id: bridge
    }
    function func(i){
        text.text = i
        console.log("func:"+i);
    }
    Row{
        TextField{
            width: 100
            height: 40
            id: text_field
        }
        Button{
            width: 100
            height: 40
            text: qsTr("send to cpp")
            onClicked: {
                text_field.text
                bridge.call(text_field.text);
            }
        }
        Rectangle{
            width: 100
            height: 40
            Text {
                text: qsTr("from cpp:")
            }
        }

        Rectangle{
            width: 100
            height: 40
            Text{
                leftPadding: 2
                id: text
                text: ""
                color: "red"
            }
        }
    }
}
