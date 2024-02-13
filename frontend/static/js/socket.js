
// countdown_animation()
var link2 = "http://127.0.0.1:5300/";
if(location.href.includes("ckcsc.net"))
    link2 = "https://backend.ckcsc.net/";

var socket = io(link2,{ autoConnect: false });

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
  // console.log(data);

  
  if (data.status == 'info') {
    loader_animation_off();
    let information = document.getElementById('information');
    information.innerHTML = '';
    information.innerHTML += "<li>player:" + data['player'] + "</li>";
    information.innerHTML += "<li>username:" + window.username + "</li>";
    information.innerHTML += "<li>opponent:" + data['opponent'] + "</li>";
    window.player = data.player;
    // window.speedx=data['speedx'];
    // window.speedy=data['speedy'];
    
    if (window.player == 1)//main
    {
      // ball();
      setInterval(()=>{
        if (window.countdown_number==0)//not countdowning
          socket.emit('sync', { player: 1, speedx: speedx, speedy: speedy, x: x, y: y, player_y: player1_y,player1_score:player1_score,player2_score:player2_score,msg:msg});
        if (msg=='countdown')
        {
          window.msg='';
        }
        },5);
        countdown_animation(3,'delay',callback=ball);
      
    } else {setInterval(()=>{
      if (window.countdown_number==0)
      socket.emit('sync', { player: 2, player_y: player2_y });
      },5)
      countdown_animation(3,'delay');
    }

    
    
  }else if(data.status=="syncing"){//同步遊戲數據
    // console.log(data);
    // console.log(window);
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
      window.x=data.x;
      window.y=data.y;
      window.speedx=data.speedx;
      window.speedy=data.speedy;
      if (data.msg=="countdown")
        countdown_animation(3,'delay');
    }
  }else if (data.status=='waiting')
    loader_animation_on();
    

});
function connect() {
  socket.connect();
}

function a(){
  alert(1);
}