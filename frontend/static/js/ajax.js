var link = "http://127.0.0.1:8000/get_session";
if(location.href.includes("ckcsc.net"))
    link = "https://playground.ckcsc.net/get_session";
$(document).ready(function () {
    console.log("doing session check");
    fetch(link, { method: "GET" })
        .then(response => {
            console.log(response);
            response.json().then(data => {
                console.log(data.message);
                if (data.message != "not logged in") {
                    $("#username_selection_text").text(data.message).show();
                    $("#register_selection").attr('style', "display:none!important");
                    $("#login_selection").attr('style', "display:none!important");
                }
                else {
                    $("#username_selection").attr('style', "display:none!important");
                    $("#logout_selection").attr('style', "display:none!important");
                }
            })
        });
});

