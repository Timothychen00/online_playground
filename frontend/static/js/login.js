
$(document).ready(function () {
    var link = "http://127.0.0.1:5300/"

    //用Enter鍵觸發按鈕
    const input = document.querySelectorAll('input');
    input.forEach((item) => {
        item.addEventListener("keyup", (e) => {
            if (e.key === 'Enter') {
                document.getElementById('login_button').click();
            }
        });
    });

    $("#login_button").click(function (event) {
        event.preventDefault();
        var email = $("#email").val();
        var password = $("#password").val();

        fetch(link + 'api/session', { method: 'POST', mode: 'cors', body: 'email=' + email + '&password=' + password, headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
            .then(response => {
                response.json().then(data => {
                    console.log(data.message);
                    if (data.message == "success") {
                        var verify_data = JSON.stringify({ token: data.token, username: data.username, email: data.email });
                        console.log(verify_data);
                        fetch('http://127.0.0.1:8000/' + 'verify_session', { method: 'POST', mode: 'cors', body: verify_data, headers: { 'Content-Type': 'application/json' } })
                            .then(response => {
                                response.json().then(data => {
                                    console.log(data.message);
                                    if (data.message == "success") {
                                        alert("登入成功");
                                        window.location.href = "/";
                                    }
                                    else {
                                        $("#message").text(data.message).show();
                                    }
                                });
                            })
                            .catch(error => {
                                $("#message").text(error).show();
                                console.log(error);
                            });
                        alert("登入成功");
                        window.location.href = "/";
                    }
                    else {
                        $("#message").text(data.message).show();
                    }
                });
            })
            .catch(error => {
                $("#message").text(error).show();
                console.log(error);
            });



        //         $.ajax({
        //             url: link + "api/user",
        //             method: "POST",
        //             contentType: "application/x-www-form-urlencoded",
        //             body: data,
        //             success: function (response) {
        //                 alert("登入成功");
        //                 window.location.href = "/lobby";
        //             },
        //             error: function (xhr, status, error) {
        //                 var message = xhr.responseJSON.message;
        //                 $("#message").text(message).show();
        //             }
        //         });
    });
});


$("#friend_button").click(function (event) {
    console.log("friend button clicked");
    $("#toastPlacement").attr('style', "display:block!important");

});

$("#close_button").click(function (event) {
    $("#toastPlacement").attr('style', "display:none!important");

});