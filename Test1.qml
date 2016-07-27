import QtQuick 2.4

Item {
    id: singleLegend

    width: {
        if (ListView.view && ListView.view.width >= 10)
            return ListView.view.width / Math.floor(ListView.view.width / 200.0);
        else
            return 10;
    }

    height: {
        if (ListView.view && ListView.view.height >= 15)
            return ListView.view.height;
        else
            return 15;
    }

//        x: dial.width*clock.scale
    property color iconColor
    property string sector: "hello"

    Item {
        anchors.centerIn: parent
        width: 10; height: 15
    Rectangle {
        id: legendIcon



        width: 15
        height:  15
        color: iconColor
        border.color: "black"
        border.width: 2

    }
    Text {
        id: legendText
        x: legendIcon.width*1.5

        text: sector
    }
    }
}
