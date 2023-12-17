
$(document).ready(function () {
    var link = "http://127.0.0.1:5300/"

    //用Enter鍵觸發按鈕
    const input = document.querySelectorAll('input');
    input.forEach((item) => {
        item.addEventListener("keyup", (e) => {
            if (e.key === 'Enter') {
                document.getElementById('register_button').click();
            }
        });
    });

    $("#register_button").click(function (event) {
        event.preventDefault();
        var username = $("#register_username").val();
        var email = $("#register_email").val();
        var password = $("#register_password").val();
        var password_check = $("#register_password_check").val();

        if (password != password_check) {
            $("#register_message").text("密碼不一致").show();
        }
        else {
            fetch(link + 'api/user', { method: 'POST', body: 'username=' + username + '&email=' + email + '&password=' + password, headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
                .then(response => {
                    response.json().then(data => {
                        console.log(data.message);
                        if (data.message == "success") {
                            alert("註冊成功");
                            window.location.href = "/";
                        }
                        else if (data.message == "email is already used") {
                            $("#register_message").text("該電子郵件已經被使用").show();
                        }
                        else {
                            $("#register_message").text(data.message).show();
                        }
                    });
                })
                .catch(error => {
                    $("#register_message").text(error).show();
                    console.log(error);
                });
        }





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
