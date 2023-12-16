
$(document).ready(function () {
    var link = "http://127.0.0.1:5300/"

    $("#upload_game_button").click(function (event) {
        var game_name = $("#game_name").val();
        var game_description = $("#game_description").val();
        console.log("uploading game");
        fetch(link + 'api/game', { method: 'POST', body: 'game_name=' + game_name + '&game_description=' + game_description, headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
            .then(response => {
                response.json().then(data => {
                    console.log(data.message);
                    if (data.message == "success") {
                        alert("上傳成功");
                        window.location.href = "/lobby";
                    }
                    else {
                        $("#message").text(data.message).show();
                    }
                });
            })
            .catch(error => {
                console.log(error);
            });

    });
});
