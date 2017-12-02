
import QtQuick 2.8
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import "../javascript/script.js" as JS

Page{
    width: 320
    height: 560

    header:ToolBar{

        Row{
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

    Pane {
        id: pane
        x: 18
        y: 8
        width: 285
        height: 140

        Image {
            id: image
            x: 173
            y: -6
            width: 100
            height: 138
            source: "qrc:/images/LogoTeia.png"
        }
    }

    Pane {
        id: pane1
        x: 18
        y: 168
        width: 285
        height: 292

        TextInput {
            id: busca
            x: 58
            y: 0
            width: 157
            height: 20
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: text1
            x: 0
            y: 3
            text: qsTr("Busca")
            font.pixelSize: 12
        }

        Image {
            id: image1
            x: 228
            y: 0
            width: 27
            height: 26
            source: "qrc:/qtquickplugin/images/template_image.png"
        }

        Text {
            id: result
            x: 58
            y: 31
            width: 157
            height: 14
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: descricao
            x: 58
            y: 51
            width: 157
            height: 14
            text: qsTr("")
            font.pixelSize: 12
        }

        Image {
            id: foto
            x: 81
            y: 84
            width: 100
            height: 100
            source: "qrc:/qtquickplugin/images/template_image.png"
        }

        Text {
            id: text2
            x: 0
            y: 196
            text: qsTr("QUEM PRODUZ:")
            font.pixelSize: 12
        }

        Text {
            id: produtor
            x: 0
            y: 216
            width: 215
            height: 14
            text: qsTr("")
            font.pixelSize: 12
        }

        Text {
            id: cooperativa
            x: 0
            y: 236
            width: 215
            height: 14
            text: qsTr("")
            font.pixelSize: 12
        }
    }

}
