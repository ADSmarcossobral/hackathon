import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import "javascript/script.js" as SCRIPT

Button {
    text: "Cadastrar"
    height: 40
    onClicked: {
        if(pwconfirm.text != pw.text){
            showdialog("Erro!", "As senhas não conferem!")
        }else{
            result = SCRIPT.requestHttp("http://hackathon-cjlcarvalho.c9users.io/login", 'user='+ login.text +'&pw=' + senha.text + '&nome=' + nome.text + '&endereco=' + endereco + '&bairro=' + bairro + '&municipio=' + municipio + '&territorio=' + territorio + '&uf=' +uf + '&cpf=' + cpf + '&dap=' + dap + '&nomePropriedade' + nomePropriedade + '&cooperativa=' + cooperativa + '&osc=' + osc);
            if (result) {
                showdialog("OK", "Registrado com sucesso!")
            } else {
                showdialog("Erro!", "Não foi possível realizar o cadastro!")
            }
        }
    }
}
