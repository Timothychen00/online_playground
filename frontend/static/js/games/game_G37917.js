let numbers = Array.from(Array(9), () => new Array(9).fill(0));
let boom_location = new Array(9);
let boom_number_text = new Array(256);
let boom_number_text_count = 0;
let i,
    j,
    score_display = 0;
let clicked = Array.from(new Array(9), () => new Array(9)); //0,1 green,2 red
let status = Array.from(new Array(9), () => new Array(9).fill(0)); //0,1 click once,2 click twice
let lose = 0;
let a = 0;
let boom = 0; //9 blocks's boom
let background_img;
function setup() {
    var canvas=createCanvas(540, 650);
    canvas.parent('container');
    for (i = 0; i < 9; i++) {
        for (j = 0; j < 9; j++) {
            if (a <= 9) {
                numbers[int(random(0, 9))][int(random(0, 9))] = 1;
                a += 1;
            }
        }
    }
    for (i = 0; i < 9; i++) {
        for (j = 0; j < 9; j++) {
            console.log(numbers[j][i]);
        }
        console.log(" ");
    }
    let boom_string = "";
    for (i = 0; i < 9; i++) {
        for (j = 0; j < 9; j++) {
            boom_string += str(numbers[j][i]);
        }
        boom_location[i] = boom_string;
        boom_string = "";
    }
    console.log("BOMMMMM" + boom_location);
    //////////printArray(boom_location);
}
function preload() {
    background_img = loadImage("https://i.imgur.com/29At4Qk.jpg");
}
function draw() {
    background(0);
    image(background_img, 0, 0);
    textAlign(LEFT);
    textSize(20); //score_display_display
    fill(255, 255, 255);
    text("score:" + score_display, 10, 30);
    for (i = 0; i < 9; i++) {
        //square
        for (j = 0; j < 9; j++) {
            fill("#FFFFFF");
            rect(60 * j, 60 * i + 60, 60, 60);
        }
    }
    for (i = 0; i < 9; i++) {
        for (j = 0; j < 9; j++) {
            if (clicked[j][i] == 1) {
                fill("#018a00");
                rect(60 * j, 60 * i + 60, 60, 60);
            } else if (clicked[j][i] == 2) {
                lose = 1;
                fill("#e6000b");
                rect(60 * j, 60 * i + 60, 60, 60);
                for (i = 0; i < 9; i++) {
                    //lose//
                    for (j = 0; j < 9; j++) {
                        if (numbers[j][i] == 0) {
                            fill("#018a00");
                            rect(60 * j, 60 * i + 60, 60, 60);
                        } else if (numbers[j][i] == 1) {
                            fill("#e6000b");
                            rect(60 * j, 60 * i + 60, 60, 60);
                        }
                    }
                }
                textSize(128);
                fill(256);
                text("Loser", width / 2 - 170, height / 2 + 50);
            }
            if (score_display == 81 - a + 1) {
                lose = 1;
                for (i = 0; i < 9; i++) {
                    //win//
                    for (j = 0; j < 9; j++) {
                        if (numbers[j][i] == 0) {
                            fill("#018a00");
                            rect(60 * j, 60 * i + 60, 60, 60);
                        } else if (numbers[j][i] == 1) {
                            fill("#e6000b");
                            rect(60 * j, 60 * i + 60, 60, 60);
                        }
                        textSize(128);
                        fill(256);
                        text("Genius", width / 2 - 200, height / 2 + 50);
                    }
                }
            }
        }
    }
    draw_boom_text(); //boom_text(); //boom
} //void boom_text(){
//   if (mousePressed) {
//      for(int i=0;i<3;i++){
//         for(int j=0;j<3;j++){
//            if (numbers[floor(mouseX/60)-1+j][floor((mouseY-60)/60)-1+i]==1){
//                boom+=1;
//            }
//         }
//      }
//   }
//  println(boom);
//  textSize(32);
//  fill(0, 0, 0);
//  textAlign(CENTER);
//  text(boom,int(mouseX/60)*60+30, int(mouseY/60)*60+45);
//}
function mousePressed() {
    console.log("IM HERE:  " + floor(mouseX / 60) + "    " + floor((mouseY - 60) / 60));
    console.log(status[floor(mouseX / 60)][floor((mouseY - 60) / 60)]);
    if (mouseY >= 60 && mouseY <= 600) {
        if (numbers[floor(mouseX / 60)][floor((mouseY - 60) / 60)] == 0) {
            fill("#15FF4D");
            rect(
                60 * floor(mouseX / 60),
                60 * floor((mouseY - 60) / 60) + 60,
                60,
                60
            );
            clicked[floor(mouseX / 60)][floor((mouseY - 60) / 60)] = 1;
            status[floor(mouseX / 60)][floor((mouseY - 60) / 60)] += 1;
            if (clicked[floor(mouseX / 60)][floor((mouseY - 60) / 60)] == 1 &&
                status[floor(mouseX / 60)][floor((mouseY - 60) / 60)] == 1)
                if (lose != 1)
                    score_display += 1;
        } else if (
            numbers[floor(mouseX / 60)][floor((mouseY - 60) / 60)] == 1
        ) {
            fill("#FF0303");
            rect(
                60 * floor(mouseX / 60),
                60 * floor((mouseY - 60) / 60) + 60,
                60,
                60
            );
            clicked[floor(mouseX / 60)][floor((mouseY - 60) / 60)] = 2;
        }
        boom_number_text[boom_number_text_count] = floor(mouseX / 60);
        boom_number_text_count += 1;
        boom_number_text[boom_number_text_count] = floor(mouseY / 60 - 1);
        boom_number_text_count += 1;
        let startX = 0;
        let endX = 0;
        let startY = 0;
        let endY = 0;
        let count = 0; //println("mouse/60"+str(mouseX/60));
        //println(mouseY/60-1);
        //mouseX
        if (floor(mouseX / 60 < 1)) {
            //println("I'm in first");
            startX = 0;
            endX = 1;
        }
        if (floor(mouseX / 60 >= 1 && mouseX / 60 < 8)) {
            //println("I'm in second");
            startX = mouseX / 60 - 1;
            endX = mouseX / 60 + 1;
        }
        if (floor(mouseX / 60 >= 8)) {
            //println("I'm in third");
            startX = mouseX / 60 - 1;
            endX = mouseX / 60;
        } //mouseY
        if (floor(mouseY / 60 - 1 < 1)) {
            //println("I'm in first");
            startY = 0;
            endY = 1;
        }
        if (floor(mouseY / 60) - 1 >= 1 && floor(mouseY / 60) - 1 < 8) {
            //println("I'm in second");
            startY = floor(mouseY / 60) - 1 - 1;
            endY = floor(mouseY / 60) - 1 + 1;
        }
        if (floor(mouseY / 60) - 1 >= 8) {
            //println("I'm in third");
            startY = floor(mouseY / 60) - 1 - 1;
            endY = floor(mouseY / 60) - 1;
        } //println("startX"+str(startX));
        //println("endX"+str(endX));
        //println("startY"+str(startY));
        //println("endY"+str(endY));
        let yourString = "";
        console.log("BOOM LOCATION" + boom_location);
        for (i = startY; i <= endY; i++) {
            console.log("i" + i);
            yourString = boom_location[i];
            for (let t = startX; t <= endX; t++) {
                console.log(yourString.charAt(t));
                if (yourString.charAt(t) == "1") {
                    count += 1;
                }
                console.log("count" + count);
            }
        }
        console.log("Bomom!!!!" + count);
        boom_number_text[boom_number_text_count] = count;
        boom_number_text_count += 1;
        count = 0;
        ////////printArray(boom_number_text);
        draw_boom_text();
    }
}
function draw_boom_text() {
    for (let e = 0; e < boom_number_text_count; e += 3) {
        textAlign(CENTER);
        textSize(40);
        fill(256); //println(boom_number_text[e],boom_number_text[e+1] *60,boom_number_text[e+2]*60);
        text(boom_number_text[e + 2], boom_number_text[e] * 60 + 30, boom_number_text[e + 1] * 60 + 105);
    }
}
