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

    header:ToolBar{

        RowLayout{
            spacing: 20
            anchors.fill: parent

            ToolButton{
                Image{
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/drawer.png"
                }
                onClicked: drawer.open();
            }

            Label{
                id: titlelabel
                text: "Teia Agroecológica"
                font.pixelSize: 20
                font.italic: true
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton{

            }

        }
    }

    Drawer{
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        z: -2

        ListView{
            id: listView
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate{
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    if(listView.currentIndex != index){
                        listView.currentIndex = index
                        titlelabel.text = ""
                        stackView.replace(model.source)
                    }
                    drawer.close()
                }
            }

            model: ListModel{
                ListElement{ title: "Início"; source: "qrc:/Pages/inicio.qml" }
                ListElement{ title: "Configurações"; source: "qrc:/pages/settings.qml" }
                ListElement{ title: "About"; source: "qrc:/pages/about.qml" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }

        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane{
            id: pane
            font.pointSize: 8

            Text {
                id: text3
                x: 76
                y: 72
                width: 46
                height: 24
                text: qsTr("Usuario")
                font.pixelSize: 12
            }

            ComboBox {
                id: tipoUsuario
                model: ["Cliente", "Cooperativa", "Produtor"]
                x: 133
                y: 72
                width: 142
                height: 24
                currentIndex: -2
            }

            Text {
                id: text1
                x: 76
                y: 102
                width: 37
                height: 20
                text: qsTr("Login")
                font.pixelSize: 12
            }

            TextInput {
                id: login
                x: 133
                y: 102
                width: 142
                height: 20
                text: qsTr("")
                horizontalAlignment: Text.AlignLeft
                font.family: "Verdana"
                selectionColor: "#150080"
                font.pixelSize: 12
                focus: true
            }

            Text {
                id: text2
                x: 76
                y: 128
                width: 38
                height: 20
                text: qsTr("Senha:")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            TextInput {
                id: senha
                echoMode: TextInput.Password
                x: 133
                y: 128
                width: 142
                height: 20
                text: qsTr("")
                font.pixelSize: 12
                focus: true
            }

            Button {
                id: logar
                x: 76
                y: 222
                width: 191
                height: 40
                text: qsTr("Entrar")
                onClicked: {
                    if (!login.text.length)
                        window.alert(qsTr("Erro!"), qsTr("Por favor! Informe seu login!"), null, null)
                    else if (!senha.text.length)
                        window.alert(qsTr("Erro!"), qsTr("Por favor! Informe sua senha!"), null, null)
                    else{
                        var result = SCRIPT.requestHttp("http://hackathon-cjlcarvalho.c9users.io/login", 'user=' + login.text +'&pw=' + senha.text);
                        if(result){
                            console.log("Logado");
                        }else{
                            console.log("Erro");
                        }
                    }
                }
            }

            Button {
                id: cadastroBtn
                x: 76
                y: 176
                width: 191
                height: 40
                text: qsTr("Cadastrar-se")
                onClicked:{
                    cadastroPage.visible = true;
                    stackView.visible = false;
                }
            }

        }
    }

    Page {
        id: cadastroPage
        visible: false
        width: window.width
        contentHeight: aboutColumn.height

        Column {
            spacing: 10
            anchors { fill: parent; margins: 16 }

            ComboBox {
                id: usuario
                width: 150
                height: 40
                model: ["Cliente", "Cooperativa", "Produtor"]
                currentIndex: -2
            }

            Label { text: "Nome Completo:" }
            TextField {
                id: nome
                width: parent.width
                height: 20
            }

            Label { text: "Login:" }
            TextField {
                id: user
                width: parent.width
                height: 20
            }

            Label { text: "Senha:" }
            TextField {
                id: pw
                width: parent.width
                height: 20
                echoMode: TextField.Password
            }

            Label { text: "Confirmar senha:" }
            TextField {
                id: pwconfirm
                width: parent.width
                height: 20
                echoMode: TextField.Password
            }

            Button {
                x: 0
                y: 200
                text: "Cadastrar"
                width: parent.width
                height: 40
                onClicked: {
                    if(pwconfirm.text != pw.text){
                        showdialog("Erro!", "As senhas não conferem!")
                    }else{
                        var result = SCRIPT.requestHttp("http://hackathon-cjlcarvalho.c9users.io/login", 'user='+ login.text +'&pw=' + senha.text + '&nome=' + nome.text);
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

    Popup {
        id: aboutDialog
        modal: true
        focus: true
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            spacing: 20

            Label {
                text: "About"
                font.bold: true
            }

            Label {
                width: aboutDialog.availableWidth
                text: "Desenvolvido por Team IFBA."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

        }
    }
}
