function parseJson(str) {
    return str.toString().replace("<pre>", "").replace("</pre>", "");
}

function createWindows() {
    var component = Qt.createComponent("qrc:/Pages/cadastroProdutor");
    console.log("Component Status:", component.status, component.errorString());
    var page = component.createObject(window, {"x": 100, "y": 300});
    page.show();
}

function request(type, url, args, callback) {
    var xhr = new XMLHttpRequest
    xhr.open(type === "POST" ? "POST" : "GET", url, true)
    xhr.setRequestHeader("Content-type", "Application/Json")
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            try {
                callback(xhr.status, JSON.parse(parseJson(xhr.responseText)))
            } catch(e) {
                console.log("Request error:")
                console.error(e)
            }
        }
    }
    xhr.send(args || ({}))
}

function requestHttp1(url, data){
    var http = new XMLHttpRequest();
    http.open("POST", url, true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.onreadystatechange = function() {
        if(http.readyState == 4 && http.status == 200) {
            console.log("Enviado");
            return JSON.parse(JSON.stringify(http.responseText));
        }
        console.log("Não enviado");
        return;
    }
    http.send(data);
}

function requestHttp3(url, data){
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function() {
        if (xhr.readyState == xhr.DONE) {
            console.log("Enviado");
            var result = JSON.parse(JSON.stringify(xhr.responseText));
        }
        if (xhr.status == 200 && xhr.readyState == 4) {
            return true;
        } else{
            console.log("hmmm?");
            return false;
        }
    }
    xhr.send(data);
}

function requestHttp2(url, user, pw){
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/postman", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
        user: data,
        pw: pw
    }));
    xhr.onload = function() {
      console.log("HELLO")
      console.log(this.responseText);
      var data = JSON.parse(this.responseText);
      console.log(data);
    }
}

function requestHttp(url, data){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        
      }
    };
    xhttp.open("POST", url, true);
    xhttp.send(data);
}
