var game_image_url='';

function upload_game(){
    let key=['game_name','author','description','users_number','sync_mode','sync_variables','code_file'];
    msg={};
    
    console.log(key.length)
    for(i=0;i<key.length;i++){
       

        msg[key[i]]=document.getElementById(key[i]).value;
        
    }
    // msg=msg.substring(0,msg.length-1);
    
    console.log(game_image_url);
    // msg = JSON.stringify({'code_file':
    // document.getElementById('code_file').value})

    if (game_image_url!=''){
        msg['img_url']=game_image_url;
    }else{
        alert('等待圖片上傳')
    }
    msg=JSON.stringify(msg);
    console.log(msg);
    
    fetch('http://127.0.0.1:5300/api/game',{body:msg,mode:'cors',method:'POST',headers:{'Content-Type':'application/json'}})
}

// const form = document.getElementById('upload');
// const fileInput = form.querySelector('#file');

// form.addEventListener('submit', evt => {
//     evt.preventDefault();
//     const params = {
//         url: '/api/upload',
//         fileName: 'file',
//         fileData: fileInput.files[0]
//     };
//     uploadFile(params).then(results => {
//         //...
//     });
// }, false);



$('.imgur').change(function () {
    var reader = new FileReader();
    reader.onload = function (e) {
        var iurl = e.target.result.substr(e.target.result.indexOf(",") + 1, e.target.result.length);
        var clientId = "3328cf6f44c685f";
        $.ajax({
            url: "https://api.imgur.com/3/upload",
            type: "POST",
            datatype: "json",
            data: {
                'image': iurl,
                'type': 'base64'
            },
            success: fdone,
            error: function () { alert("圖片上傳失敗，請稍後再試") },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization", "Client-ID " + clientId);
            }
        });
    };
    reader.readAsDataURL(this.files[0]);
});

function fdone(data) {
    console.log("Successfully upload image! Link:"+data.data.link);
    game_image_url = data.data.link;
}





