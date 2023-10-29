var x, y, speedx=0, speedy=0;
var player1_y=0;
var kscore, mscore, flg;
var player2_y=0;

function choice() {
  const choose = [1, -1];
  return choose[Math.floor(Math.random() * 2)];
}

function setup() {
  var canvas=createCanvas(800, 600);
  canvas.parent('container');  
  x = width / 2;
  y = height / 2;
  speedx =0;
  speedy =0;
  x  = height / 2;
  kscore = 0;
  mscore = 0;
  flg = 0;
}

function draw() {
  background(133, 157, 201);

  noFill();
  strokeWeight(6);
  stroke(32, 72, 89);
  rect(4, 4, width - 8, height - 8);
  line(width / 2, 0, width / 2, height);

  stroke(76, 214, 245);
  fill(76, 214, 245);
  ellipse(x, y, 30, 30);

  x = x + speedx;
  y = y + speedy;
  if (y > height || y < 0) {
    speedy = -speedy;
  }
  fill(215, 242, 10);
  stroke(215, 242, 10);
  rect(width - 10, player2_y, 10, 160);

  if (x >= width - 10 && (y >= player2_y && y <= player2_y + 160)) {
    speedx = -speedx;
  } else if (x > width) {
    if (flg === 0) {
      kscore++;
      flg = 1;
    }
  }

  rect(0, player1_y, 10, 160);
  if (keyIsPressed) {
    if (key === 'w' && player1_y > 0) player1_y -= 10;
    if (key === 's' && player1_y < height - 160) player1_y += 10;
    if (key === 'i' && player2_y > 0) player2_y -= 10;
    if (key === 'k' && player2_y < height - 160) player2_y += 10;
  }

  if (x <= 10 && (y >= player1_y && y <= player1_y + 160)) {
    speedx = -speedx;
  } else if (x < 0) {
    if (flg === 0) {
      mscore++;
      flg = 1;
    }
  }

  fill(35, 36, 32);
  stroke(35, 36, 32);
  textSize(128);
  text(kscore, width / 2 - 128, 120);
  text(mscore, width / 2 + 64, 120);
}

// function mousePressed() {
//   x = width / 2;
//   y = height / 2;
//   speedx = Math.floor(Math.random() * 3 + 5) * choice();
//   speedy = Math.floor(Math.random() * 3 + 5) * choice();
//   flg = 0;
// }