var socket = io({ autoConnect: false });

socket.on('connect', function () {
  let username = document.getElementById('username').value;
  if (username != "") {
    socket.emit('join', username);
    document.getElementById('close').click();
    document.getElementById('defaultCanvas0').style.display = 'block';
    document.getElementById('button').classList += 'visually-hidden d-none';
    document.getElementById('preloader').classList.remove('visually-hidden');

    window.username=username;
    // document.getElementById('offset').classList += 'visually-hidden';
    //socket.to("1").emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
  }
});
socket.on('sync', function (data) {
  console.log(data);

  // alert(1);
  //socket.join("1");
  
  if (data.status == 'info') {
    document.getElementById('preloader').classList.add('visually-hidden');
    let information = document.getElementById('information');
    information.innerHTML = '';
    information.innerHTML += "<li>player:" + data['player'] + "</li>";
    information.innerHTML += "<li>username:" + window.username + "</li>";
    information.innerHTML += "<li>opponent:" + data['opponent'] + "</li>";
    window.player = data.player;
    window.speedx=data['speedx'];
    window.speedy=data['speedy'];
    if (window.player == 1)//main
    {
      setInterval(()=>{socket.emit('sync', { player: 1, speedx: speedx, speedy: speedy, x: x, y: y, player_y: player1_y });},10);

    } else {
      setInterval(()=>{socket.emit('sync', { player: 2, player_y: player2_y });},10)
    }
  }else{//同步遊戲數據
    console.log(data);
    console.log(window);
    if (window.player == 1)//main
    {
      window.player2_y=data.player_y;
    } else {
      window.player1_y=data.player_y;
      // window.x=data.x;
      // window.y=data.y;
      // window.speedx=data.speedx;
      // window.speedy=data.speedy;
    }
  }

  //socket.emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
  //socket.to("1").emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
});
function connect() {
  //alert(1);
  socket.connect();
}
