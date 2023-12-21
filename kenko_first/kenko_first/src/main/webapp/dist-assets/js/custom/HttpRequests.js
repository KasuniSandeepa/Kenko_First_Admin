
//--change language in http-session
function LanguageChange(Language, FromUrl) {
    alert('Language: ' + Language + ', FromUrl: ' + FromUrl);
    console.log('Language: ' + Language + ', FromUrl: ' + FromUrl);
    let RequestUrl = "LanguageChangeServlet?Language=" + Language;
    alert('RequestUrl: ' + RequestUrl);
    console.log('RequestUrl: ' + RequestUrl);

    let xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xhttp = new XMLHttpRequest("Microsoft.XMLHttp");
    }

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            let ResponseText = xhttp.responseText;
            alert('ResponseText: ' + ResponseText);
            console.log('ResponseText: ' + ResponseText);
            //refresh current page
            window.location.href = FromUrl;
        }
    };
    xhttp.open("GET", RequestUrl, true);
    xhttp.send();
}
