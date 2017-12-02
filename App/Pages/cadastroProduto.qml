
import QtQuick 2.8
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import "../javascript/script.js" as JS

Page{
    width: 320
    height: 560

    Pane {
        id: pane
        x: 18
        y: 8
        width: 285
        height: 162

        Image {
            id: image
            x: 173
            y: -6
            width: 100
            height: 138
            source: "qrc:/images/LogoTeia.png"
        }

        Text {
            id: text1
            x: 43
            y: 136
            text: qsTr("CADASTRO DE PRODUTO")
            font.bold: true
            font.pixelSize: 12
        }
    }

    Pane {
        id: pane1
        x: 18
        y: 198
        width: 285
        height: 317

        Text {
            id: text2
            x: -6
            y: 3
            text: qsTr("Nome")
            font.pixelSize: 12
        }

        TextInput {
            id: nome
            x: 97
            y: 0
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        TextInput {
            id: peso
            x: 97
            y: 26
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: -6
            y: 29
            text: qsTr("Descricao")
            font.pixelSize: 12
        }

        TextInput {
            id: ocs
            x: 97
            y: 52
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Button {
            id: cadastrar
            x: 81
            y: 281
            width: 100
            height: 19
            text: qsTr("Finalizar")
        }

        Text {
            id: text4
            x: -6
            y: 55
            text: qsTr("OCS")
            font.pixelSize: 12
        }

        Text {
            id: text5
            x: -6
            y: 84
            text: qsTr("Selos")
            font.pixelSize: 12
        }

        ComboBox {
            id: comboBox
            x: 97
            y: 84
            width: 169
            height: 14
            font.family: "Times New Roman"
        }

        Text {
            id: text6
            x: -6
            y: 113
            text: qsTr("DAP")
            font.pixelSize: 12
        }
    }

}
