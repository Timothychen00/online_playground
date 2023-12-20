//2 ECE4DB
//4 ECE1CC
//8 E9B582
//y->i
//x->j
let colors = ["#FFFFFF", "#ECE4DB", "#ECE1CC", "#E9B582", "#E99A6D", "#E78367", "#E56948", "#E8D180", "#E8CD72",'#EDC53F','#edc22e','#3c3a33']
; let text_colors = ["#FFFFFF", "#756E66", "#756E66", "#F8F6F2", "#F8F6F2", "#F8F6F2", "#F8F6F2", "#F8F6F2", "#F8F6F2",'#f8f6f2','#f8f6f2','#f8f6f2']; let score = 0; let steps = 0; let isPush = 0; let lose = 0; let available_movements = 0; let proress = 0; //animation
let appear = [- 1, - 1]; let animation_start = 0; function show_score() { //rect();
    fill("#CAC1B5");
    rect(535 - 80 - 5, 70, 80, 80, 10);
    fill("#F8F6F2"); //println(score);
    //text(,100,100);
    textSize(20);
    text("Score", 535 - 80 - 5, 70 - 20);
    text(str(score), 535 - 80 - 5, 70 + 20);
}
function check_can_move() {
    let condition = 0;
    for (let i = 0; i < 4; i++) {
        for (let j = 0; j < 3; j++) {
            if (block_num[i][j] == block_num[i][j + 1] || block_num[i][j] == 0 || block_num[i][j + 1] == 0) {
                condition = 1;
            }
        }
    } for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 4; j++) { if (block_num[i][j] == block_num[i + 1][j] || block_num[i][j] == 0 || block_num[i + 1][j] == 0) { condition = 1; } }
    } return condition;
}
let block_width = 82;
let block_radius = 13;
let animation_queue = []; //set the colors
let g = 15; let click = 0;
let x = [280 - 3 * g / 2, 360 - g / 2, 440 + g / 2, 520 + 3 * g / 2];
let y = [205 - 3 * g / 2, 285 - g / 2, 365 + g / 2, 445 + 3 * g / 2];
let block_num = [[512, 0, 0, 0], [2, 8, 32, 4], [8, 2, 8, 0], [32, 128, 16, 0]];
let default_block = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
function count_white() {

    let points = [];
    for (let i = 0; i < 4; i++) for (let j = 0; j < 4; j++) if (block_num[i][j] == 0) points = append(points, (str(i) + "," + str(j))); //printArray(points);
    return points;
} function random_block() {
    let white = count_white(); if (white.length > 0) { //full
        let point = split(white[int(random(white.length))], ","); //printArray(point);
        let block_number = (int(random(1, 40)) % 2 + 1) * 2; block_num[int(point[0])][int(point[1])] = block_number; appear[0] = int(point[0]); appear[1] = int(point[1]); //print(point[0]);
        console.log(',', point[0], point[1]); console.log(',', appear[0], appear[1]); console.log("appear:" + appear[0] + ',' + appear[1]);
    } //show_block();
    available_movements = 0;
} let count = 0; function show_block() {
    generate_board(); for (let i = 0; i < 4; i++) {
        for (let j = 0; j < 4; j++) { //stroke("#FFFFFF");
            if (block_num[i][j] != 0) {
                let num = int(log(block_num[i][j]) / log(2)); if (appear[0] != - 1) {
                    if (int(appear[0]) == i && int(appear[1]) == j) {
                        isPush = 1; push(); //print(i);
                        if (animation_start == 0) { animation_start = millis(); } let now = millis(); if (now - animation_start < 250) { translate(x[j], y[i]); scale(count * 0.15); translate(- x[j], - y[i]); count++; } else { count = 0; appear[0] = - 1; appear[1] = - 1; animation_start = 0; } scale(1); //popMatrix();
                    }
                } fill(colors[num]); rect(x[j], y[i], 82, 82, 13); fill(text_colors[num]); textAlign(CENTER, CENTER); textSize(55); //text(block[i][j],x[j]-13,y[i]+20);
                text(block_num[i][j], x[j], y[i]); if (appear[0] != - 1 && int(appear[0]) == i && int(appear[1]) == j) { pop(); }
            }
        }
    } if (lose == 1) { fill("#e0d296"); rect(400, 325, 390, 390, 25); fill("#FFFFFF"); text("you lose!", 400, 325); }
} //initial the main block

function generate_board() { fill("#B9ADA1"); rect(400, 325, 390, 390, 25); fill("#CAC1B5"); stroke("#B9ADA1"); for (let i = 0; i < 4; i++) { for (let j = 0; j < 4; j++) { rect(x[i], y[j], 82, 82, 13); } } } function non_empty(certain, dx, dy, start, end) { //dx,dy
    let return_value = - 1; if (dy == 0) {
        console.log("pppp"); for (let i = start; i != end; i += dx) { //move right
            if (block_num[certain][i] != 0) { //println(block_num[certain][i]);
                if (i == start) continue; return i; //else
            }
        }
    } else if (dx == 0) { //move down
        console.log("----"); for (let i = start; i != end; i += dy) { if (block_num[i][certain] != 0) { console.log(block_num[i][certain]); if (i == start) continue; return i; } }
    } //else if(dx>0){//move left
    return return_value;
} function handle_movement(dx, dy) {
    if (dx < 0) {
        console.log("movement dx"); for (let j = 0; j < 4; j++) {
            for (let i = 3; i != - 1; i += dx) {
                let next = non_empty(j, - 1, 0, i, - 1); if (next != - 1) { //not empty
                    if (block_num[j][i] == block_num[j][next]) //merge
                    {
                        block_num[j][i] *= 2; block_num[j][next] = 0; score += block_num[j][i]; //cal_score
                        available_movements++;
                    }
                }
            } for (let i = 3; i != 0; i += dx) {
                let next = non_empty(j, - 1, 0, i, - 1); //println(next);
                if (next != - 1) { //not empty
                    //block_num[0][]
                    if (block_num[j][i] == 0) { //move
                        block_num[j][i] = block_num[j][next]; block_num[j][next] = 0; available_movements++;
                    }
                }
            }
        }
    } if (dy < 0) {
        console.log("movement dy"); for (let j = 0; j < 4; j++) {
            for (let i = 3; i >= 0; i--) {
                let next = non_empty(j, 0, - 1, i, - 1); if (next != - 1) { //not empty
                    if (block_num[i][j] == block_num[next][j]) //merge
                    {
                        block_num[i][j] *= 2; block_num[next][j] = 0; score += block_num[i][j]; //cal_score
                        available_movements++;
                    }
                }
            } for (let i = 3; i >= 0; i--) {
                let next = non_empty(j, 0, - 1, i, - 1); //println(next);
                if (next != - 1) { //not empty
                    //block_num[0][]
                    if (block_num[i][j] == 0) { //move
                        block_num[i][j] = block_num[next][j]; block_num[next][j] = 0; available_movements++;
                    }
                }
            }
        }
    } if (dx > 0) {
        console.log("movement dy"); //int j=0;
        for (let j = 0; j < 4; j++) {
            for (let i = 0; i != 4; i++) {
                let next = non_empty(j, dx, dy, i, 4); if (next != - 1) { //not empty
                    if (block_num[j][i] == block_num[j][next]) //merge
                    {
                        block_num[j][i] *= 2; block_num[j][next] = 0; score += block_num[j][i]; //cal_score
                        available_movements++;
                    }
                }
            } for (let i = 0; i != 4; i++) {
                let next = non_empty(j, dx, dy, i, 4); if (next != - 1) { //not empty
                    if (block_num[j][i] == 0) { //move
                        block_num[j][i] = block_num[j][next]; block_num[j][next] = 0; available_movements++;
                    }
                }
            }
        }
    } if (dy > 0) { //int j=0;
        console.log("movement dy"); //int j=0;
        for (let j = 0; j < 4; j++) {
            for (let i = 0; i != 4; i++) {
                let next = non_empty(j, dx, dy, i, 4); if (next != - 1) { //not emwpty
                    if (block_num[i][j] == block_num[next][j]) //merge
                    {
                        block_num[i][j] *= 2; block_num[next][j] = 0; score += block_num[i][j]; //cal_score
                        available_movements++;
                    }
                }
            } for (let i = 0; i != 4; i++) {
                let next = non_empty(j, dx, dy, i, 4); if (next != - 1) { //not empty
                    if (block_num[i][j] == 0) { //move
                        block_num[i][j] = block_num[next][j]; block_num[next][j] = 0; available_movements++;
                    }
                }
            }
        }
    }
}

function setup() {
    smooth(8); frameRate(30); pixelDensity(displayDensity());
    //  let sans; textFont(sans);
    var canvas = createCanvas(800, 600);
    canvas.parent('container');
    
    canvas.classList='shadow p-3 mb-5 bg-body rounded';
    background("#FAF8F0");
    textSize(80); //fill("#0d0d0d");
    fill("#B9ADA1"); //stroke("#756E66");
    text("2048", 205, 100); //stroke("#FFFFFF");
    rectMode(CENTER); //block

    generate_board(); //show_block();
    fill("#8C7B68"); rect(545, 90, 80, 40, 10); fill("#FFFFFF"); textSize(15); text("New game", 510, 95); fill("#CAC1B5"); rect(535 - 80 - 5, 70, 80, 80, 10); start_game(0);
} function preload() {
    // sans = loadFont("http://127.0.0.1:8000/static/Sans.ttf");
} function start_game(reset) {
    lose = 0;
    score = 0;
    appear[0] = - 1;
    appear[1] = - 1;
    animation_start = 0; count = 0; //reset
    if (reset == 1) {
        for (let i = 0; i < 4; i++) for (let j = 0; j < 4; j++) block_num[i][j] = 0; //println("ful");
    } random_block(); //show_block();
} //start
function mouseClicked() {
    if (mouseX > 535 - 70 && mouseX < 535 + 90) {
        if (mouseY > 40 && mouseY < 120) {
            click = 1; //setup();
            // alert(2);
            start_game(1); //println(click);
        }
    }
} function keyPressed() {
    if (isPush == 1) { //popMatrix();
        isPush = 0;
    } if (key == 'd') {
        handle_movement(- 1, 0);
    } else if (key == 's') {
        handle_movement(0, - 1);
    } else if (key == 'a') {
        handle_movement(1, 0);
    } else if (key == 'w') {
        handle_movement(0, 1);
    } //random_block();
    console.log(available_movements); if (check_can_move() == 1) {
        if (available_movements > 0) { random_block(); }
    }
} function draw() { let steps; show_block(); show_score(); if (check_can_move() == 0) lose = 1; } 