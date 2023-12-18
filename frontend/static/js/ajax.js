
$(document).ready(function () {
    console.log("doing session check");
    fetch('http://127.0.0.1:8000/get_session', { method: "GET" })
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

