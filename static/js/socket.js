var socket = io({ autoConnect: false });

socket.on('connect', function () {
  let username = document.getElementById('username').value;
  if (username != "") {
    socket.emit('join', username);
    document.getElementById('close').click();
    document.getElementById('defaultCanvas0').style.display = 'block';
    document.getElementById('button').style.display = 'none';
    //socket.to("1").emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
  }
});
socket.on('sync', function (data) {
  console.log(data);
  alert(1);
  //socket.join("1");
  let player=data.player;
  if (player==1)//main
  {
    socket.emit('sync', {player:1,speedx:speedx,speedy:speedy,x:x,y:y,player_y:player1_y});
  }else{
    socket.emit('sync', {player:1,player_y:player2_y});
  }
  //socket.emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
  //socket.to("1").emit('my event', {speedx:speedx,speedy:speedy,x:x,y:y,kby,kby });
});
function connect() {
  //alert(1);
  socket.connect();
}
