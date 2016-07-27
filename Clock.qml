import QtQuick 2.0

Item {
    id: clock

    width: diameter
    height: diameter

    property real shift
    property int hours
    property int minutes
    property int seconds
    property bool night: false
    property int diameter: 150

    property string sourceClockface: "Content/ClockVit.png"
    property string sourceClockfaceN: "Content/ClockVit.png"
    property string sourceHourArrow: "Content/HourArrowVit.png"
    property string sourceHourArrowN: "Content/HourArrowVit.png"
    property string sourceMinuteArrow: "Content/MinuteArrowVit.png"
    property string sourceMinuteArrowN: "Content/MinuteArrowVit.png"
    property string sourceSecondArrow: "Content/SecondArrowVit.png"
    property string sourceSecondArrowN: "Content/SecondArrowVit.png"

    function timeChanged() {
        var date = new Date;
        hours = date.getUTCHours() + shift
        night = (hours < 7 || hours > 19)
        minutes = date.getMinutes()
        seconds = date.getSeconds()
    }

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: clock.timeChanged()
    }

    Image {
        id: dial
        source: clock.sourceClockface
        anchors.fill: clock
        visible: !clock.night
    }
    Image {
        id: dialNight
        source: clock.sourceClockfaceN
        anchors.fill: clock
        visible: clock.night
    }
    Image {
        id: hourArrow
        source:clock.sourceHourArrow
        anchors.fill: dial
        visible: !clock.night
        transform: Rotation {
            axis.x: 0
            axis.y: 0
            axis.z: 1
            origin.x: dial.width/2
            origin.y: dial.height/2
            angle: clock.hours*30 + clock.minutes*0.5
        }
    }
    Image {
        id: hourArrowNight
        source:clock.sourceHourArrowN
        anchors.fill: dial
        visible: clock.night
        transform: Rotation {
            axis.x: 0
            axis.y: 0
            axis.z: 1
            origin.x: dial.width/2
            origin.y: dial.height/2
            angle: clock.hours*30 + clock.minutes*0.5
        }
    }
    Image {
        id: minuteArrow
        source: clock.sourceMinuteArrow
        anchors.fill: dial
        visible: !clock.night
        transform: Rotation {
            axis.x: 0
            axis.y: 0
            axis.z: 1
            origin.x: dial.width/2
            origin.y: dial.height/2
            angle: clock.minutes*6
        }
    }
    Image {
        id: minuteArrowNight
        source: clock.sourceMinuteArrowN
        anchors.fill: dial
        visible: clock.night
        transform: Rotation {
            axis.x: 0
            axis.y: 0
            axis.z: 1
            origin.x: dial.width/2
            origin.y: dial.height/2
            angle: clock.minutes*6
        }
    }
    Image {
        id: secondArrow
        source: clock.sourceSecondArrow
        anchors.fill: dial
        visible: !clock.night
        transform: Rotation {
            axis.x: 0
            axis.y: 0
            axis.z: 1
            origin.x: dial.width/2
            origin.y: dial.height/2
            angle: clock.seconds*6
        }
    }
    Image {
        id: secondArrowNight
        source: clock.sourceSecondArrowN
        anchors.fill: dial
        visible: clock.night
        transform: Rotation {
            axis.x: 0
            axis.y: 0
            axis.z: 1
            origin.x: dial.width/2
            origin.y: dial.height/2
            angle: clock.seconds*6
        }
    }
}

