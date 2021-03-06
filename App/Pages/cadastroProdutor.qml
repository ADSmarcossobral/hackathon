
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
            text: qsTr("CADASTRO DE PRODUTOR")
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
            text: qsTr("Nome Completo")
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
            id: cpf
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
            text: qsTr("CPF")
            font.pixelSize: 12
        }

        TextInput {
            id: dpa
            x: 97
            y: 52
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text4
            x: -5
            y: 55
            text: qsTr("DPA")
            font.pixelSize: 12
        }

        Text {
            id: text5
            x: -6
            y: 83
            text: qsTr("OCS")
            font.pixelSize: 12
        }

        TextInput {
            id: ocs
            x: 97
            y: 80
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text6
            x: -7
            y: 109
            text: qsTr("Endereço")
            font.pixelSize: 12
        }

        TextInput {
            id: endereco
            x: 97
            y: 106
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text7
            x: -7
            y: 136
            text: qsTr("Bairro")
            font.pixelSize: 12
        }

        Text {
            id: text8
            x: -7
            y: 166
            text: qsTr("Municipio")
            font.pixelSize: 12
        }

        Text {
            id: text9
            x: -7
            y: 192
            text: qsTr("Territorio")
            font.pixelSize: 12
        }

        TextInput {
            id: bairro
            x: 97
            y: 133
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        TextInput {
            id: municipio
            x: 97
            y: 163
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        TextInput {
            id: territorio
            x: 97
            y: 189
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text10
            x: -7
            y: 218
            text: qsTr("Login")
            font.pixelSize: 12
        }

        TextInput {
            id: user
            x: 97
            y: 215
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text11
            x: -7
            y: 246
            text: qsTr("Senha")
            font.pixelSize: 12
        }

        TextInput {
            id: senha
            x: 97
            y: 243
            width: 169
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Button {
            id: cadastrar
            x: 81
            y: 274
            width: 100
            height: 19            
            text: qsTr("Finalizar")
        }
    }

}
