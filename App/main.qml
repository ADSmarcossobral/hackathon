import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import "qrc:/javascript/script.js" as SCRIPT

ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 520
    title: "Teia Agroecológica"

    Loader{
        id: pageLoad
    }

    Page{
        id: pageMain
        x: -5
        y: 0
        width: 365
        height: 520
        Pane {
            id: pane
            x: 37
            y: 31
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
            x: 37
            y: 188
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

        Button{
            x: 228
            y: 425
            text: "Começar"
            onClicked: {
                pageMain.visible = false
                pageLoad.source = "qrc:/Pages/login.qml"
            }
        }
    }
}
