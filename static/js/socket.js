
// countdown_animation()

var socket = io({ autoConnect: false });

socket.on('connect', function () {
  let username = document.getElementById('username').value;
  if (username != "") {
    socket.emit('join', username);
    document.getElementById('close').click();
    document.getElementById('defaultCanvas0').style.display = 'block';
    document.getElementById('button').classList += 'visually-hidden d-none';
    loader_animation_on();

    window.username=username;
  }
});
socket.on('sync', function (data) {
  console.log(data);

  
  if (data.status == 'info') {
    console.log(100000000);
    loader_animation_off();
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
      setInterval(()=>{
        if (window.countdown_number==0)
          socket.emit('sync', { player: 1, speedx: speedx, speedy: speedy, x: x, y: y, player_y: player1_y,player1_score:player1_score,player2_score:player2_score});
        },20);
      
    } else {setInterval(()=>{
      if (window.countdown_number==0)
      socket.emit('sync', { player: 2, player_y: player2_y });
      },20)

    }
    countdown_animation(3);
    
  }else if(data.status=="syncing"){//同步遊戲數據
    console.log(data);
    console.log(window);
    if (window.player == 1)//main
    {
      window.player2_y=data.player_y;
    } else {
      window.player1_y=data.player_y;
      player1_score=data.player1_score;
      player2_score=data.player2_score;
      // window.countdown_number=data.countdown_number;
      // document.getElementById('countdown_text').innerText=countdown_number;
      // countdown_animation(data.countdown_number,'display');
      // window.x=data.x;
      // window.y=data.y;
      // window.speedx=data.speedx;
      // window.speedy=data.speedy;
    }
  }else if (data.status=='waiting')
    loader_animation_on();
    

  //socket.emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
  //socket.to("1").emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
});
function connect() {
  //alert(1);
  socket.connect();
}

function a(){
  alert(1);
}