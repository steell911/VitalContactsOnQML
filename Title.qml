import QtQuick 2.4

Item {
    id: title

    width: titleText.width
    height: titleLine.y + titleLine.height
    property string _text: "Hello"
    property int _size: 16
    property color _lineColor: "#77B3D4"
    property color _textColor: "#404040"

    Text {
        id: titleText
        anchors.left: title.left
        text: _text
        font.bold: true
        font.pointSize: _size
        color: _textColor
    }
    Rectangle {
        id: titleLine
        width: title.width
        height: 10
        anchors.left: title.left
        anchors.top: titleText.bottom
        anchors.topMargin: 5
        color: _lineColor
    }
}

