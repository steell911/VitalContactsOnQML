import QtQuick 2.4

MainForm {
    id: mainForm
    width: 800
    height: 520

    GridView {
        id: background
        anchors.fill: mainForm
        opacity: 0.2
        Image {
            source: "Content/poverhnost_fon_odnotonnyy_temnyy_2560x1600.jpg"
        }
    }

    property int mainWidth: mainForm.width
    property int mainHeight: mainForm.height

    property int mouseX: 0

    mouseArea.onClicked: {
       // Qt.quit();
        mouseX += 30;
    }

    property real shift: 3
    property var currentDay
    property int hours
    property int minutes
    property int seconds
    property bool night: false

    function timeChanged() {
        var date = new Date;
        currentDay = date.getDay()
        hours = date.getUTCHours() + shift
        night = (hours < 7 || hours > 19)
        minutes = date.getMinutes()
        seconds = date.getSeconds()
    }

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: mainForm.timeChanged()

    }

    Item {
        id: header
        width: logo.width + headerText.width
        height: logo.height
        Image {
            id: logo
            source: "Content/vit.png"
        }
        Text {
            id: headerText
            color: "#404040"
            text: "Vital Development Corp."
            font.bold: true
            font.pointSize: 18
            anchors.left: logo.right
            anchors.leftMargin: 10
            anchors.verticalCenter: logo.verticalCenter
        }
        Rectangle {
            anchors.top: header.bottom
            anchors.topMargin: 5
            width: parent.parent.width
            height: 2
            color: "#008004"
        }
    }

    Title {
        id: contactsTitle
        _text: "Contact Information";
        anchors.top: header.bottom;
        anchors.topMargin: 25;
        anchors.left: header.left;
        anchors.leftMargin: 15
    }

    Column {
        id: contactsList
        spacing: 10
        anchors.top: contactsTitle.bottom
        anchors.topMargin: 15
        anchors.left: contactsTitle.left
        Signature {
            id: location
            sourceIcon: "Content/globe.png"
            iconSize: 40
            titleText: "Adress:"
            mainText: "Engel'sa prospect, build 38 lit.K, \n" +
                      "Saint-Petersburg, Russia, 194156"
        }
        Signature {
            id: telephone
            sourceIcon: "Content/phone.png"
            iconSize: 40
            titleText: "Phone:"
            mainText: "+7 (812) 702-10-89 \n" +
                      "+7 (812) 326-38-47"
        }
        Signature {
            id: mail
            sourceIcon: "Content/mail.png"
            iconSize: 40
            titleText: "E-mail:"
            mainText: "Sales questions: <i>sale@vital-spb.ru</i><br>
                       Export questions: <i>export@vital-spb.com</i><br>
                       For partners: <i>partners@vital-spb.ru</i><br>
                       For technical support: <i>support@vital-spb.ru</i>"
        }
    }
    Title {id: workingHours; _text: "Working Hours"; anchors.top: contactsTitle.top; anchors.left: contactsList.right; anchors.leftMargin: 50}
    Column {
        id: workingList
        spacing: 30
        anchors.top: workingHours.bottom
        anchors.left: workingHours.left
        anchors.topMargin: 15
        Signature {
            id: workingTime
            sourceIcon: "Content/calendar.png"
            iconSize: 40
            titleText: "Working hours:"
            mainText: "Monday - Friday: 9.00-18.00, \nSaturday - Sunday: out of service"
        }
        Item {
            id: currentTime
            height: timeSignature.height
            width: timeSignature.width
            Signature {
                id: timeSignature
                sourceIcon: "Content/clock.png"
                iconSize: 40
                titleText: "Technical support:"
                mainText: "Time in Saint-Petersburg\n" +
                          (mainForm.currentDay==1 ? "Mon" : "") +
                          (mainForm.currentDay==2 ? "Tue" : "") +
                          (mainForm.currentDay==3 ? "Wed" : "") +
                          (mainForm.currentDay==4 ? "Thu" : "") +
                          (mainForm.currentDay==5 ? "Fri" : "") +
                          (mainForm.currentDay==6 ? "Sat" : "") +
                          (mainForm.currentDay==7 ? "Sun" : "") +
                          " " + mainForm.hours + ":" + ((mainForm.minutes<10)?("0"+mainForm.minutes):mainForm.minutes) + "\n" +
                          (((mainForm.currentDay<6)&((mainForm.hours>=9)&(mainForm.hours<18)))?("Technical support now is available"):("Technical support now is not available"))
            }
            Clock {id: clock; shift: +3; anchors.horizontalCenter: timeSignature.horizontalCenter; anchors.leftMargin: 15; anchors.top: timeSignature.bottom; anchors.topMargin: 15}
        }
    }

}
