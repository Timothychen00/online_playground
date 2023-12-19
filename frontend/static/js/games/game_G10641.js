//30821 snaken game
let angle = 0;
let snakesize = 5;
let time = 0;
let headx = new Array(2500);
let heady = new Array(2500);
let applex = (Math.round(getRandomInt(50)) + 1) * 8;
let appley = (Math.round(getRandomInt(50)) + 1) * 8;
let redo = true;
let stopgame = false;

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}
function setup() {
    restart();
    var canvas = createCanvas(600, 600);
    canvas.parent('container');
    textAlign(CENTER);
    background(255);
}
function draw() {
    if (stopgame) {
        //do nothing because of game over (stop playing)
    } else {
        // background(255);
        //draw stationary stuff
        time += 1;
        fill(255, 0, 0);
        stroke(0);
        rect(applex, appley, 8, 8);
        fill(0);
        stroke(0);
        rect(0, 0, width, 8);
        rect(0, height - 8, width, 8);
        rect(0, 0, 8, height);
        rect(width - 8, 0, 8, height); //my modulating time by 5, we create artificial frames each 5 frames
        //(otherwise the game would go WAY too fast!)
        if (time % 5 == 0) {
            travel();
            display();
            checkdead();
        }
    }
} //controls:
function keyPressed() {
    if (key) {
        //what key was pressed? is the previous angle the opposite direction?
        //we wouldn't want to go backwards into our body, that would hurt!
        //also, is the previous body segment in front of the direction?
        //(based on the previous question, but added for secure turning without suicide)
        if (keyCode == UP_ARROW && angle != 270 && heady[1] - 8 != heady[2]) {
            angle = 90;
        }
        if (keyCode == DOWN_ARROW && angle != 90 && heady[1] + 8 != heady[2]) {
            angle = 270;
        }
        if (keyCode == LEFT_ARROW && angle != 0 && headx[1] - 8 != headx[2]) {
            angle = 180;
        }
        if (
            keyCode == RIGHT_ARROW &&
            angle != 180 &&
            headx[1] + 8 != headx[2]
        ) {
            angle = 0;
        }
        if (keyCode == SHIFT) {
            //restart the game by pressing shift
            restart();
        }
    }
}
function travel() {
    for (let i = snakesize; i > 0; i--) {
        if (i != 1) {
            //shift all the coordinates back one array
            headx[i] = headx[i - 1];
            heady[i] = heady[i - 1];
        } else {
            //move the new spot for the head of the snake, which is
            //always at headx[1] and heady[1].
            switch (angle) {
                case 0:
                    headx[1] += 8;
                    break;
                case 90:
                    heady[1] -= 8;
                    break;
                case 180:
                    headx[1] -= 8;
                    break;
                case 270:
                    heady[1] += 8;
                    break;
            }
        }
    }
}
function display() {
    //is the head of the snake eating the apple?
    if (headx[1] == applex && heady[1] == appley) {
        //grow and spawn the apple somewhere away from the snake
        //(currently some of the code below might not be working, but the game still works.)
        snakesize += Math.round(getRandomInt(3) + 1);
        redo = true;
        while (redo) {
            applex = (Math.round(getRandomInt(47)) + 1) * 8;
            appley = (Math.round(getRandomInt(47)) + 1) * 8;
            for (let i = 1; i < snakesize; i++) {
                if (applex == headx[i] && appley == heady[i]) {
                    redo = true;
                } else {
                    redo = false;
                    i = 1000;
                }
            }
        }
    } //draw the new head of the snake...
    stroke(sinecolor(1), sinecolor(0), sinecolor(0.5));
    fill(0);
    rect(headx[1], heady[1], 8, 8); //...then erase the back end of the snake.
    fill(255);
    rect(headx[snakesize], heady[snakesize], 8, 8);
}
function checkdead() {
    for (let i = 2; i <= snakesize; i++) {
        //is the head of the snake occupying the same spot as any of the snake chunks?
        if (headx[1] == headx[i] && heady[1] == heady[i]) {
            fill(255);
            rect(125, 125, 160, 100);
            fill(0);
            text("GAME OVER", 200, 150);
            text("Score:  " + str(snakesize - 1) + " units long", 200, 175);
            text("To restart, press Shift.", 200, 200);
            stopgame = true;
        } //is the head of the snake hitting the walls?
        if (
            headx[1] >= width - 8 ||
            heady[1] >= height - 8 ||
            headx[1] <= 0 ||
            heady[1] <= 0
        ) {
            fill(255);
            rect(125, 125, 160, 100);
            fill(0);
            text("GAME OVER", 200, 150);
            text("Score:  " + str(snakesize - 1) + " units long", 200, 175);
            text("To restart, press Shift.", 200, 200);
            stopgame = true;
        }
    }
}
function restart() {
    //by pressing shift, all of the main variables reset to their defaults.
    background(255);
    headx[1] = 200;
    heady[1] = 200;
    for (let i = 2; i < 1000; i++) {
        headx[i] = 0;
        heady[i] = 0;
    }
    stopgame = false;
    applex = (Math.round(getRandomInt(47)) + 1) * 8;
    appley = (Math.round(getRandomInt(47)) + 1) * 8;
    snakesize = 5;
    time = 0;
    angle = 0;
    redo = true;
}
function sinecolor(percent) {
    let slime =
        sin(radians((((time + 255 * percent) % 255) / 255) * 360)) * 255;
    return slime;
}

