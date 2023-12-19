let x = 150;
let y = 150;
let apple_x = 150;
let apple_y = 300;
let bomb_x = 500;
let bomb_y = 0;
let bomb_x_2 = 200;
let bomb_y_2 = -50;
let font;
let a = 0;
let b;
let c = 400;
let speed_y = 25;
let tree;
let apple;
let hand;
let bomb;
let bomb_2;
function setup() {
    var canvas=createCanvas(612, 533);
    canvas.parent('container');
}
function preload() {
    tree = loadImage("https://i.imgur.com/JxMWDax.jpg");
    apple = loadImage("https://i.imgur.com/pnfT7xt.png");
    hand = loadImage("https://i.imgur.com/fc2PHlH.png");
    bomb = loadImage("https://i.imgur.com/ZuG0fHW.jpg");
    bomb_2 = loadImage("https://i.imgur.com/ZuG0fHW.jpg");
    // font = loadFont("QingNiaoHuaGuangJianMeiHei-2.ttf");
    // {'image_2.png': 'https://i.imgur.com/fc2PHlH.png', 'image_3.jpg': 'https://i.imgur.com/ZuG0fHW.jpg', 'image_1.png': 'https://i.imgur.com/pnfT7xt.png', 'image_0.jpg': 'https://i.imgur.com/JxMWDax.jpg'}
}
function draw() {
    frameRate(20);
    background(tree);
    move();
    apple.resize(100, 100);
    image(apple, apple_x, apple_y);
    image(bomb, bomb_x, bomb_y);
    bomb.resize(75, 75);
    image(bomb_2, bomb_x_2, bomb_y_2);
    bomb_2.resize(100, 100);
    image(hand, x, y);
    hand.resize(100, 100);
    
    font_display();
    over();
    console.log(
        sqrt((apple_x - x) * (apple_x - x) + (apple_y - y) * (apple_y - y))
    );
    if (
        sqrt((apple_x - x) * (apple_x - x) + (apple_y - y) * (apple_y - y)) < 50
    ) {
        apple_display();
        a += 20;
    }
    if (sqrt((bomb_x - x) * (bomb_x - x) + (bomb_y - y) * (bomb_y - y)) < 50) {
        bomb_display();
        a -= 20;
    }
    if (
        sqrt(
            (bomb_x_2 - x) * (bomb_x_2 - x) + (bomb_y_2 - y) * (bomb_y_2 - y)
        ) < 50
    ) {
        bomb_2_display();
        a -= 20;
    }
    bomb_y += speed_y;
    bomb_y_2 += speed_y;
    if (bomb_y > height) {
        bomb_display();
    }
    if (bomb_y_2 > height) {
        bomb_2_display();
    }
}
function move() {
    if (keyIsPressed) {
        if ((key == "a" || key=='A') && x != 0) {
            x -= 10;
        }
        if ((key == "d" || key=='D') && x != 600) {
            x += 10;
        }
        if ((key == "w" || key=='W') && y != 0) {
            y -= 10;
        }
        if ((key == "s" || key=='S') && y != 0) {
            y += 10;
        }
        if (key == "q") {
            exit();
        }
    }
}
function apple_display() {
    apple_x = random(50, 500);
    apple_y = random(50, 400);
}
function bomb_display() {
    bomb_x = random(50, 500);
    bomb_y = -50;
}
function bomb_2_display() {
    bomb_x_2 = random(50, 500);
    bomb_y_2 = 0;
}
function font_display() {
    // textFont(font);
    fill(0);
    text(a, 10, 150);
    text(b, 550, 150);
}
function over() {
    c -= 1;
    b = c / 20;
    if (c == 0) {
        fill(20, 100, 240);
        noStroke();
        rect(10, 170, 700, 240);
        // textFont(font);
        fill(0);
        let s = "your score is";
        text(s, 10, 250);
        text(a, 100, 400);
        // stop();
        sleep(1000);

    }
}
