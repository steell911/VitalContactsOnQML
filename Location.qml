import QtQuick 2.0

Item {
    id: contactInformation
    width: Math.max(title.width, adress.width)
    height: title.height + adress.height
    Text {
        id: title

        text: "Contact Information"
        font.bold: true
        font.pointSize: 16
        color: "#404040"
    }
    Rectangle {
        id: titleLine
        width: title.width
        height: 10
        anchors.top: title.bottom
        anchors.topMargin: 5
        color: "#77B3D4"
    }

    //  adress
    Image {
        id: locationIcon
        source: "Content/globe.png"
        width: 40
        height: width
        anchors.top: titleLine.bottom
        anchors.topMargin: 15
    }
    Text {
        id: adressTitle
        anchors.verticalCenter: locationIcon.verticalCenter
        anchors.left: locationIcon.right
        anchors.leftMargin: 15
        text: "Adress:"
        font.bold: true
        font.pointSize: 12
        color: "#404040"
    }
    Text {
        id: adress
        anchors.top: locationIcon.bottom
        anchors.left: adressTitle.left
        text: "Engel'sa prospect, build 38 lit.K, St.-Petersburg, Russia, 194156"
        font.pointSize: 10
    }

    //  telephone
    Image {
        id: telephoneIcon
        source: "Content/phone.png"
        width: 40
        height: width
        anchors.top: adress.bottom
        anchors.topMargin: 15
    }
    Text {
        id: telephoneTitle
        anchors.verticalCenter: telephoneIcon.verticalCenter
        anchors.left: telephoneIcon.right
        anchors.leftMargin: 15
        text: "Telephone:"
        font.bold: true
        font.pointSize: 12
        color: "#404040"
    }
    Text {
        id: telephone
        anchors.top: telephoneIcon.bottom
        anchors.left: telephoneTitle.left
        text: "+7 (812) 702-10-89 \n+7 (812) 326-38-47"
        font.pointSize: 10
    }

    //  mail
    Image {
        id: mailIcon
        source: "Content/mail.png"
        width: 40
        height: width
        anchors.top: telephone.bottom
        anchors.topMargin: 15
    }
    Text {
        id: mailTitle
        anchors.verticalCenter: mailIcon.verticalCenter
        anchors.left: mailIcon.right
        anchors.leftMargin: 15
        text: "E-mail:"
        font.bold: true
        font.pointSize: 12
        color: "#404040"
    }
    Text {
        id: mail
        anchors.top: mailIcon.bottom
        anchors.left: mailTitle.left
        text: "Sales questions sale@vital-spb.ru \nExport questions export@vital-spb.com \nFor partners partners@vital-spb.ru"
        font.pointSize: 10
    }
}

