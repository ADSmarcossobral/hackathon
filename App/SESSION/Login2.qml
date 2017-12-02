import QtQuick.Controls 2.2
import QtQuick 2.0

Rectangle {
  width: 640
  height: 480

  Column {
    anchors.centerIn: parent
    spacing: 16
    Column {
      spacing: 4
      Text { text: "Username" }
      TextInput{focus: true}
    }
    Column {
      spacing: 4
      Text { text: "Password" }
      TextInput { input.echoMode: TextInput.Password }
    }
    Row {
      spacing: 16
      anchors.horizontalCenter: parent.horizontalCenter
      Button { text: "Cadastrar-se"; onClicked: console.log("guest") }
      Button { text: "Login"; onClicked: console.log("login") }

    }
  }
}
