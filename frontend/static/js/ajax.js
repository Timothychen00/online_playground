var link = "http://127.0.0.1:5300/"
function insert_user() {
    fetch(link + 'api/user', { method: 'POST', body: 'email=tim20060112@gmail.com' + '&username=Tim' + '&password=0000', headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
        .then(response => {
            response.json().then(data => {
                console.log(data.message);
            });
        });
}
window.onload = insert_user();
