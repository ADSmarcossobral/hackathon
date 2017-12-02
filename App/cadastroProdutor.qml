
import QtQuick 2.8
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import "../javascript/script.js" as JS

Popup {
    id: cadastroPage

    Column {
        spacing: 10
        anchors { fill: parent; margins: 16 }

        ComboBox {
            id: tipoUsuario
            width: 608
            height: 40
            model: ["Cliente", "Cooperativa", "Produtor"]
            currentIndex: -2
        }

        Label { text: "Nome Completo:" }
        TextField {
            id: nome
            width: parent.width
        }

        Label { text: "Endereco:" }
        TextField {
            id: endereco
            width: parent.width
        }

        Label { text: "Bairro:" }
        TextField {
            id: bairro
            width: parent.width
        }

        Label { text: "municipio:" }
        TextField {
            id: municipio
            width: parent.width
        }

        Label { text: "Território Identidade:" }
        TextField {
            id: territorio
            width: parent.width
        }

        Label { text: "UF:" }
        TextField {
            id: uf
            width: parent.width
        }

        Label { text: "CPF:" }
        TextField {
            id: cpf
            width: parent.width
        }

        Label { text: "DPA:" }
        TextField {
            id: dpa
            width: parent.width
        }

        Label { text: "Nome Propriedade:" }
        TextField {
            id: nomePropriedade
            width: parent.width
        }

        Label { text: "Cooperativa:" }
        TextField {
            id: cooperativa
            width: parent.width
        }

        Label { text: "OSC:" }
        TextField {
            id: osc
            width: parent.width
        }

        Label { text: "Login:" }
        TextField {
            id: user
            width: parent.width
        }

        Label { text: "Senha:" }
        TextField {
            id: pw
            width: parent.width
            echoMode: TextField.Password
        }

        Label { text: "Confirmar senha:" }
        TextField {
            id: pwconfirm
            width: parent.width
            echoMode: TextField.Password
        }

        Button {
            text: "Cadastrar"
            width: parent.width
            onClicked: {
                if(pwconfirm.text != pw.text){
                    showdialog("Erro!", "As senhas não conferem!")
                }else{
                    result = JS.requestHttp("http://hackathon-cjlcarvalho.c9users.io/login", 'user='+ login.text +'&pw=' + senha.text + '&nome=' + nome.text + '&endereco=' + endereco + '&bairro=' + bairro + '&municipio=' + municipio + '&territorio=' + territorio + '&uf=' +uf + '&cpf=' + cpf + '&dap=' + dap + '&nomePropriedade' + nomePropriedade + '&cooperativa=' + cooperativa + '&osc=' + osc);
                    if (result) {
                        showdialog("OK", "Registrado com sucesso!")
                    } else {
                        showdialog("Erro!", "Não foi possível realizar o cadastro!")
                    }
                }
            }
        }
    }
}
