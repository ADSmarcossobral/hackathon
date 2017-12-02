import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

Page{
    width: 320
    height: 560
    Pane {
        id: pane
        x: 15
        y: 39
        width: 291
        height: 124

        Text {
            id: text1
            x: 0
            y: 105
            text: qsTr("Seja bem vindo a nossa TEIA")
            font.pixelSize: 12
        }

        Image {
            id: image
            x: 185
            y: -3
            width: 100
            height: 115
            source: "qrc:/images/LogoTeia.png"
        }
    }

    Pane {
        id: pane1
        x: 15
        y: 185
        width: 291
        height: 123

        Text {
            id: text2
            x: -5
            y: 18
            text: qsTr("Conectamos você, cliente, ao produto desejado.")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: -5
            y: 43
            text: qsTr("Escolha seu produto e te mostramos o produtor.")
            font.pixelSize: 12
        }
    }

    Image {
        id: image1
        x: 249
        y: 384
        width: 43
        height: 34
        source: "qrc:/images/arrow.png"
    }

}
