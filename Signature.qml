import QtQuick 2.0

Item {
    id: signature

    width: main.x + main.width
    height: main.y + main.height
    property string sourceIcon
    property int iconSize
    property string titleText: "Title"
    property color titleColor: "#404040"
    property int titleSize: 16
    property string mainText: "Main text"
    property color mainColor: "#404040"
    property int mainSize: 12

    Image {
        id: icon
        source: sourceIcon
        width: iconSize
        height: iconSize
    }
    Text {
        id: title
        color: signature.titleColor
        text: signature.titleText
        font.pointSize: signature.titleSize
        anchors.verticalCenter: icon.verticalCenter
        anchors.left: icon.right
        anchors.leftMargin: 15
    }
    Text {
        id: main
        color: signature.mainColor
        text: signature.mainText
        font.pointSize: signature.mainSize
        anchors.top: icon.bottom
        anchors.left: title.left
    }
}

