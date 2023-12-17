var link = "http://127.0.0.1:5300/";
$('.imgur').change(function () {
    var reader = new FileReader();
    reader.onload = function (e) {
        var iurl = e.target.result.substr(e.target.result.indexOf(",") + 1, e.target.result.length);
        var clientId = "3328cf6f44c685f";
        fetch("https://api.imgur.com/3/upload", {
            method: "POST",
            headers: {
                "Authorization": "Client-ID " + clientId,
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                image: iurl,
                type: "base64"
            })
        })
        .then(response => response.json())
        .then(fdone)
        .catch(() => alert("圖片上傳失敗，請稍後再試"));
    };
    reader.readAsDataURL(this.files[0]);
});

function fdone(data) {
    fetch(link+"api/game", {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            image_url: data.data.link
        })
    })
    .then(response => response.json())
    .then(response => {
        console.log(data.data.link);
        alert(response);
    })
    .catch(error => console.error(error));
}

