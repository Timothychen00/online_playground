let ground_x, ground_speedX;
let cactus_x, cactus_x_2, cactus_speedX;
let jump_y, jump_speedY;
let pic;
let pic_2;
let failed_img;
let ground_img;
let dino_img;
let status = "normal";
let game_status = "before_start";
let cheat_mode = "False";
let recent_time = 0;
let previous_time;
let speed_time = 0;
let speed_previous_time;
let recent_score = 0;
let highest_score = 0;
let loading_time = 0;
let loading_text = "Loading"; //JSONObject json;

function preload() {
    pic = loadImage("https://i.imgur.com/94KY6OW.png");
    pic_2 = loadImage("https://i.imgur.com/nHnXtw1.png");
    failed_img = loadImage("https://i.imgur.com/htcg5IO.png");
    ground_img = loadImage("https://i.imgur.com/rMLnWXl.png");
    dino_img = loadImage("https://i.imgur.com/iQyqmk7.png");

}
function setup() {
    previous_time = millis();
    speed_previous_time = millis();
    //setting size & background
    var canvas = createCanvas(800, 600);
    canvas.parent('container');
    background(255); //setting initial value
    //ground_value
    ground_x = 0;
    ground_speedX = 7; //cactus_value
    cactus_x = 800;
    cactus_x_2 = 1300;
    cactus_speedX = 7; //jump_value
    jump_y = 240;
    jump_speedY = 10.3; //recent_score
    recent_score = 0; //load json
    //json = loadJSONObject("data.json");
    //highest_score = json.getInt("highest_score");
    ////print initial_message
    //JSONArray initial_message= json.getJSONArray("initial_message");
    //for (int i = 0; i < initial_message.size(); i++) {
    //  println(initial_message.getString(i) );
    //}
}
function draw() {
    switch (game_status) {
        case "before_start":
            welcome_page();
            break;
        case "loading":
            loading();
            break;
        case "start":
            ground();
            cactus_1();
            cactus_2();
            dino();
            score();
            failed();
            speed();
            text(
                "CHEATING MODE " + cheat_mode + "!!",
                0.83 * width,
                0.98 * height
            );
            break;
        case "failed":
            image(
                pic,
                0.5 * width - pic.width / 2,
                220
            );
            textAlign(CENTER);
            textSize(30);
            fill(83, 83, 83);
            text("G A M E   O V E R", 0.5 * width, 0.33 * height);
    } //println(jump_y);
    //println(status);
} //loading_scenes
function ground() {
    background(255);
    ground_x -= ground_speedX;
    image(ground_img, ground_x, 300);
    if (ground_x <= -(width - 150)) {
        ground_x = 0;
    }
}
function cactus_1() {
    cactus_x -= cactus_speedX;
    image(pic, cactus_x, 250);
    if (cactus_x <= -(width - 150)) {
        cactus_x = Math.random() * 100 + 800;
        pic = loadImage("https://i.imgur.com/94KY6OW.png");
    }
}
function cactus_2() {
    cactus_x_2 -= cactus_speedX;
    image(pic_2, cactus_x_2, 250);
    if (cactus_x_2 <= -(width - 150)) {
        cactus_x_2 = Math.random() * 100 + 850;
        pic_2 = loadImage("https://i.imgur.com/nHnXtw1.png");
    }
}
function dino() {
    if (status == "normal") {
        image(dino_img, 20, 240);
    } else {
        jump();
    }
}
function jump() {
    if (status == "jump") {
        if (jump_y > 100) {
            jump_y -= jump_speedY;
        } else {
            status = "too_high";
        }
    }
    if (status == "too_high") {
        if (jump_y < 240) {
            jump_y += jump_speedY - 5;
        } else {
            status = "normal";
        }
    }
    image(dino_img, 20, jump_y); //if (status=="jump"){
    //  jump_y-=jump_speedY;
    //  println("...........");
    //  image(loadImage("dino.png"),20,jump_y);
    //}
    //if (jump_y< 240){
    //  status="too_high";
    //  jump_y+=jump_speedY;
    //  image(loadImage("dino.png"),20,jump_y);
    //}
    //if (jump_y > 300){
    //  status="normal";
    //  jump_y=240;
    //  dino();
    //}
}
function score() {
    recent_time = millis(); //json = loadJSONObject("data.json");
    //highest_score = json.getInt("highest_score");
    highest_score = recent_score;
    textSize(24);
    fill("#000000");
    text(
        "HI" + "   " + highest_score + "   " + recent_score,
        0.8 * width,
        0.1 * height
    ); //if (recent_score > highest_score){
    //  json.setInt("highest_score", recent_score);
    //  saveJSONObject(json, "data/data.json");
    //}
    if (recent_time - previous_time > 150) {
        recent_score += 1;
        previous_time = millis();
    }
}
function welcome_page() {
    textAlign(CENTER);
    textSize(40);
    fill("#EE6AA7");
    text("START", 0.5 * width, 0.4 * height);
    textSize(24);
    fill("#000000");
    text("Press space to start", 0.5 * width, 0.5 * height);
}
function loading() {
    background(255, 255, 255);
    loading_text += ".";
    welcome_page();
    text(loading_text, 0.5 * width, 0.7 * height); //println(loading_text);
    loading_time += 1;
    if (loading_time >= 8) {
        game_status = "start";
    }
}
function speed() {
    if (recent_score >= 100) {
        speed_time = millis();
        text("SPEEDING_UP!!", 0.8 * width, 0.2 * height);
        if (speed_time - speed_previous_time > 1000) {
            cactus_speedX += 0.5;
            ground_speedX += 0.5; //println("add");
            //println(cactus_speedX);
            speed_previous_time = millis();
        }
    }
}
function failed() {
    if (cheat_mode == "False") {
        //println(cactus_x-5.5);
        //println(jump_y);
        if (cactus_x - 5.5 < 50 && cactus_x - 5.5 > 0 && jump_y >= 180) {
            //println("failed_1");
            game_status = "failed";
        }
        if (cactus_x_2 - 5.5 < 50 && cactus_x_2 - 5.5 > 0 && jump_y >= 180) {
            //println("failed_2");
            game_status = "failed";
        }
    }
}
function keyPressed() {
    if (game_status == "start") {
        if (key == " ") {
            if (status == "normal") {
                jump();
                status = "jump";
            }
        }
        if (keyCode) {
            if (keyCode == UP_ARROW) {
                if (status == "normal") {
                    jump();
                    status = "jump";
                }
            }
        }
    }
    if (game_status == "before_start") {
        if (key == " ") {
            game_status = "loading";
        }
        if (keyCode) {
            if (keyCode == UP_ARROW) {
                game_status = "loading";
            }
        }
    }
    if (game_status == "failed") {
        if (key == " ") {
            setup();
            game_status = "start";
        }
        if (keyCode) {
            if (keyCode == UP_ARROW) {
                setup();
                game_status = "start";
            }
        }
    }
    if (key == "c") {
        if (cheat_mode == "True") {
            cheat_mode = "False";
        } else {
            cheat_mode = "True";
        }
    }
}
