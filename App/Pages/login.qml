import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import "qrc:/javascript/script.js" as SCRIPT

Page{
    id: pageLogin
    width: 320
    height: 560

    Loader{
        id: loadPage
    }

    Pane {
        id: pane
        x: 23
        y: 21
        width: 272
        height: 146

        TextEdit {
            id: textEdit
            x: 70
            y: 109
            width: 108
            height: 20
            text: "Entrar na TEIA"
            font.pixelSize: 15
        }

        Image {
            id: image
            x: 160
            y: -6
            width: 100
            height: 109
            source: "qrc:/images/LogoTeia.png"
        }
    }

    Pane {
        id: pane1
        x: 23
        y: 195
        width: 272
        height: 262

        Text {
            id: txt
            x: 16
            y: 22
            width: 57
            height: 20
            text: qsTr("USUARIO")
            fontSizeMode: Text.VerticalFit
            font.pixelSize: 12
        }

        TextInput {
            id: user
            x: 87
            y: 17
            width: 161
            height: 29
            text: qsTr("")
            font.pixelSize: 12
        }

        Text{
            id: txt1
            x: 16
            y: 67
            width: 57
            height: 20
            text: qsTr("SENHA")
            fontSizeMode: Text.VerticalFit
            font.pixelSize: 12
        }

        TextInput {
            id: pw
            x: 87
            y: 62
            width: 161
            height: 29
            text: qsTr("")
            font.pixelSize: 12
            echoMode: TextInput.Password
        }

        Text {
            id: text1
            x: 107
            y: 97
            text: qsTr("ESQUECI LOGIN/SENHA")
            font.pixelSize: 12
            MouseArea{

            }
        }

        Button {
            id: entrar
            x: 33
            y: 136
            width: 189
            height: 40
            text: qsTr("Entrar")
            onClicked: {               
                if (!user.text.length)
                    window.alert(qsTr("Erro!"), qsTr("Por favor! Informe seu login!"), null, null)
                else if (!pw.text.length)
                    window.alert(qsTr("Erro!"), qsTr("Por favor! Informe sua senha!"), null, null)
                else{
                    var result = SCRIPT.requestHttp("http://hackathon-cjlcarvalho.c9users.io/login", 'user=' + user.text +'&pw=' + pw.text);
                    //var result = SCRIPT.requestHttp("http://hackathon-cjlcarvalho.c9users.io/login", user, pw);
                    console.log(result);
                    if(result){
                        loadPage.source = "qrc:/Pages/busca.qml"
                    }else{
                        window.alert(qsTr("Erro!"), qsTr("Por favor! Informe um login e senha válida!"), null, null)
                    }
                }
            }
        }

        Button {
            id: cadastro
            x: 33
            y: 191
            width: 189
            height: 40
            text: qsTr("Novo Cadastro")
            onClicked: {
                pane.visible = false
                pane1.visible = false
                loadPage.source = "qrc:/Pages/cadastroProdutor.qml"
            }
        }
    }

}
