var link = "http://127.0.0.1:5300/";
$(document).ready(function () {
    console.log("doing session check");
    fetch(link + 'api/session', { method: "GET" })
        .then((response) => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then((data) => {
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
        .catch((err) => {
            console.log('錯誤:', err);
        });
});
