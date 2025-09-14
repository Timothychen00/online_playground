let Health_display = 10000,
    HealthO = 10000;
let score_display = 0,
    EasyScorePlus = 5,
    NormalScorePlus = 20,
    HardScorePlus = 100; //int InsaneX,InsaneY,InsaneVx,InsaneHP=2^64;
let enemyAttack_TIME = 0;
let MP = 0,
    EasyMPPlus = 5,
    NormalMPPlus = 10,
    HardMPPlus = 20;
let CD;
let STATUS = "Start";
let teki = [];
let enemyAttackY = [];
let HP = [];
let HPO = []
let TG = []
let X = []
let Vx = []
let GameStart, Setting;
let EasyCharacter, NormalCharacter, HardCharacter;
let EasyAttack, NormalAttack, HardAttack;
let haikeiEasy, haikeiNormal, haikeiHard, haikeiInsane;
let enemyAttack, enemyAttack_mahoujin, enemyAttack_mahoujin_kidou;
let EasyEnemy_0, EasyEnemy_1, EasyEnemy_2, EasyEnemy_3, EasyEnemy_4;
let NormalEnemy = []
let HardEnemy = [] //PImage InsaneBoss;
function setup() {
    Health_display = 10000,
        HealthO = 10000;
    score_display = 0,
        EasyScorePlus = 5,
        NormalScorePlus = 20,
        HardScorePlus = 100; //int InsaneX,InsaneY,InsaneVx,InsaneHP=2^64;
    enemyAttack_TIME = 0;
    MP = 0,
        EasyMPPlus = 5,
        NormalMPPlus = 10,
        HardMPPlus = 20;
    STATUS = "Start";
    teki = []
    enemyAttackY = []
    HP = []
    HPO = []
    TG = []
    X = []
    Vx = []
    NormalEnemy = []
    HardEnemy = [] //PImage InsaneBoss;

    var canvas = createCanvas(1576 * 2 / 3, 900 * 2 / 3);
    canvas.parent('container');

    X[0] = width;
    X[1] = width;
    X[2] = width;
    X[3] = width;
    X[4] = width;
    textSize(25); //InsaneBoss =loadImage("InsaneBoss.png");
}
function preload() {
    GameStart = loadImage("https://i.imgur.com/iYh1Yat.png");
    Setting = loadImage("https://i.imgur.com/uUb7SIH.png");
    EasyCharacter = loadImage("https://i.imgur.com/bUVV8wC.png");
    // NormalCharacter = loadImage("https://i.imgur.com/V46jbZ2.png");
    // HardCharacter = loadImage("https://i.imgur.com/WAbFYNi.png");
    haikeiEasy = loadImage("https://i.imgur.com/3D5vS7q.jpg");
    // haikeiNormal = loadImage("https://i.imgur.com/xXMIeYR.jpg");
    // haikeiHard = loadImage("https://i.imgur.com/HlmbR9y.jpg");
    enemyAttack = loadImage("https://i.imgur.com/J8uKclB.png");
    enemyAttack_mahoujin = loadImage("https://i.imgur.com/yF48Wm1.png");
    enemyAttack_mahoujin_kidou = loadImage("https://i.imgur.com/c1m9De8.png");
    EasyEnemy_0 = loadImage("https://i.imgur.com/PNJkTDO.png");
    EasyEnemy_1 = loadImage("https://i.imgur.com/lMqSoZa.png");
    EasyEnemy_2 = loadImage("https://i.imgur.com/tIlllPX.png");
    EasyEnemy_3 = loadImage("https://i.imgur.com/gYX6JND.png");
    EasyEnemy_4 = loadImage("https://i.imgur.com/VEPiWLH.png");
    // NormalEnemy[0] = loadImage("https://i.imgur.com/LhiSVLl.png");
    // NormalEnemy[1] = loadImage("https://i.imgur.com/ruYrrrz.png");
    // NormalEnemy[2] = loadImage("https://i.imgur.com/DNvSiZH.png");
    // NormalEnemy[3] = loadImage("https://i.imgur.com/RQCj4YG.png");
    // NormalEnemy[4] = loadImage("https://i.imgur.com/DiutqU2.png");
    // HardEnemy[0] = loadImage("https://i.imgur.com/qVSvvu0.png");
    // HardEnemy[1] = loadImage("https://i.imgur.com/VWuHkPA.png");
    // HardEnemy[2] = loadImage("https://i.imgur.com/FCMzOb3.png");
    // HardEnemy[3] = loadImage("https://i.imgur.com/gxZPpgR.png");
    // HardEnemy[4] = loadImage("https://i.imgur.com/cxHXHKS.png");
    EasyAttack = loadImage("https://i.imgur.com/jJnn0qa.png");
    NormalAttack = loadImage("https://i.imgur.com/YdAx1xC.png");
    HardAttack = loadImage("https://i.imgur.com/KvU9q6T.png");
    console.log("preload");
}

function draw() {
    // console.log(STATUS);
    // console.log("draw");
    Startfunction();
    backgroundfunction();
    characterfunction();
    attackfunction();
    enemyfunction();
    enemyAttackfunction();
    scorefunction();
    statusfunction();
    Health();
    MPfunction();
    Lostfunction();
    Cheatfunction();
    // X[0] = width;
    // X[1] = width;
    // X[2] = width;
    // X[3] = width;
    // X[4] = width;
    textSize(25); //InsaneBoss =loadImage("InsaneBoss.png");
}
function Startfunction() {
    if (STATUS == "Start") {
        background(GameStart);
        if (keyIsPressed) {
            if (key == "q" || key == "Q") {
                STATUS = "Setting";
            }
        }
    }
    if (STATUS == "Setting") {
        background(Setting);
    }
    if (STATUS == "Start" || STATUS == "Setting") {
        if (keyIsPressed) {
            if (key == " ") {
                STATUS = "Easy";
            }
        }
    }
}
function backgroundfunction() {
    if (STATUS == "Easy") {
        background(haikeiEasy);
    }
}
function characterfunction() {
    if (STATUS == "Easy") {
        image(EasyCharacter, mouseX - 33, mouseY - 50);
    }
}
function attackfunction() {
    //BEEEEMu
    if (STATUS == "Easy") {
        if (mouseIsPressed == true) {
            for (let c1 = mouseX, c2 = mouseY; c1 < width; c1 += 50) {
                image(EasyAttack, c1 + 37, c2 - 30); //ellipse(c1,c2,1,1);
            }
        }
    }
    //ATTACK
    if (STATUS == "Easy") {
        if (keyIsPressed && MP > 50) {
            if (key == "x" || key == "X") {
                if (mouseIsPressed) {
                    if (
                        mouseY >= teki[0] - 30 &&
                        mouseY <= teki[0] + 80 + 30 &&
                        mouseX <= X[0] + 130
                    ) {
                        HP[0] -= 1000;
                    }
                    if (
                        mouseY >= teki[1] - 30 &&
                        mouseY <= teki[1] + 54 + 30 &&
                        mouseX <= X[1] + 118
                    ) {
                        HP[1] -= 1000;
                    }
                    if (
                        mouseY >= teki[2] - 30 &&
                        mouseY <= teki[2] + 36 + 30 &&
                        mouseX <= X[2] + 156
                    ) {
                        HP[2] -= 1000;
                    }
                    if (
                        mouseY >= teki[3] - 30 &&
                        mouseY <= teki[3] + 50 + 30 &&
                        mouseX <= X[3] + 66
                    ) {
                        HP[3] -= 1000;
                    }
                    if (
                        mouseY >= teki[4] - 30 &&
                        mouseY <= teki[4] + 70 + 30 &&
                        mouseX <= X[4] + 114
                    ) {
                        HP[4] -= 1000;
                    }
                    MP -= 2;
                }
            }
        }
        if (mouseIsPressed) {
            if (
                mouseY >= teki[0] - 30 &&
                mouseY <= teki[0] + 80 + 30 &&
                mouseX <= X[0] + 130
            ) {
                HP[0] -= 1;
            }
            if (
                mouseY >= teki[1] - 30 &&
                mouseY <= teki[1] + 54 + 30 &&
                mouseX <= X[1] + 118
            ) {
                HP[1] -= 1;
            }
            if (
                mouseY >= teki[2] - 30 &&
                mouseY <= teki[2] + 36 + 30 &&
                mouseX <= X[2] + 156
            ) {
                HP[2] -= 1;
            }
            if (
                mouseY >= teki[3] - 30 &&
                mouseY <= teki[3] + 50 + 30 &&
                mouseX <= X[3] + 66
            ) {
                HP[3] -= 1;
            }
            if (
                mouseY >= teki[4] - 30 &&
                mouseY <= teki[4] + 70 + 30 &&
                mouseX <= X[4] + 114
            ) {
                HP[4] -= 1;
            }
        }
    }

}
function enemyfunction() {
    //Easy
    if (STATUS == "Easy") {
        if (
            X[0] == width &&
            X[1] == width &&
            X[2] == width &&
            X[3] == width &&
            X[4] == width
        ) {
            for (let i = 0; i < 5; i++) {
                teki[i] = int(random(20, height - 20));
                HP[i] = int(random(50, 100));
                TG[i] = "B";
                Vx[i] = int(random(4, 7));
                HPO[i] = HP[i];
            }
        }
        if (HP[0] > 0) TG[0] = "B";
        if (HP[0] <= 0 && TG[0] == "B") TG[0] = "A";
        if (TG[0] == "A" && X[0] > 0) {
            score_display += EasyScorePlus;
            MP += EasyMPPlus;
            TG[0] = "C";
        }
        switch (TG[0]) {
            case "C":
                fill(255);
                fill(0);
                break;
            default:
                //ellipse(x,teki [0],100,100);
                image(EasyEnemy_0, X[0], teki[0]);
                if (HP[0] > (HPO[0] * 2) / 3) {
                    fill("#23C141");
                }
                if (HP[0] <= (HPO[0] * 2) / 3) {
                    fill("#D1801E");
                }
                if (HP[0] <= HPO[0] / 4) {
                    fill("#EA0C0C");
                } //text("HP:"+HP[0],x,teki [0]);
                rect(X[0], teki[0] - 10, HP[0], 10);
                fill(0);
        }
        if (HP[1] > 0) TG[1] = "B";
        if (HP[1] <= 0 && TG[1] == "B") TG[1] = "A";
        if (TG[1] == "A" && X[1] > 0) {
            score_display += EasyScorePlus;
            MP += EasyMPPlus;
            TG[1] = "C";
        }
        switch (TG[1]) {
            case "C":
                fill(255);
                fill(0);
                break;
            default:
                //ellipse(x,teki [1],100,100);
                image(EasyEnemy_1, X[1], teki[1]);
                if (HP[1] > (HPO[1] * 2) / 3) {
                    fill("#23C141");
                }
                if (HP[1] <= (HPO[1] * 2) / 3) {
                    fill("#D1801E");
                }
                if (HP[1] <= HPO[1] / 4) {
                    fill("#EA0C0C");
                } //text("HP:"+HP[1],x,teki [1]);
                rect(X[1], teki[1] - 10, HP[1], 10);
                fill(0);
        }
        if (HP[2] > 0) TG[2] = "B";
        if (HP[2] <= 0 && TG[2] == "B") TG[2] = "A";
        if (TG[2] == "A" && X[2] > 0) {
            score_display += EasyScorePlus;
            MP += EasyMPPlus;
            TG[2] = "C";
        }
        switch (TG[2]) {
            case "C":
                fill(255);
                fill(0);
                break;
            default:
                //ellipse(x,teki [2],100,100);
                image(EasyEnemy_2, X[2], teki[2]);
                if (HP[2] > (HPO[2] * 2) / 3) {
                    fill("#23C141");
                }
                if (HP[2] <= (HPO[2] * 2) / 3) {
                    fill("#D1801E");
                }
                if (HP[2] <= HPO[2] / 4) {
                    fill("#EA0C0C");
                } //text("HP:"+HP[2],x,teki [2]);
                rect(X[2], teki[2] - 10, HP[2], 10);
                fill(0);
        }
        if (HP[3] > 0) TG[3] = "B";
        if (HP[3] <= 0 && TG[3] == "B") TG[3] = "A";
        if (TG[3] == "A" && X[3] > 0) {
            score_display += EasyScorePlus;
            MP += EasyMPPlus;
            TG[3] = "C";
        }
        switch (TG[3]) {
            case "C":
                fill(255);
                fill(0);
                break;
            default:
                //ellipse(x,teki [3],100,100);
                image(EasyEnemy_3, X[3], teki[3]);
                if (HP[3] > (HPO[3] * 2) / 3) {
                    fill("#23C141");
                }
                if (HP[3] <= (HPO[3] * 2) / 3) {
                    fill("#D1801E");
                }
                if (HP[3] <= HPO[3] / 4) {
                    fill("#EA0C0C");
                } //text("HP:"+HP[3],x,teki [3]);
                rect(X[3], teki[3] - 10, HP[3], 10);
                fill(0);
        }
        if (HP[4] > 0) TG[4] = "B";
        if (HP[4] <= 0 && TG[4] == "B") TG[4] = "A";
        if (TG[4] == "A" && X[4] > 0) {
            score_display += EasyScorePlus;
            MP += EasyMPPlus;
            TG[4] = "C";
        }
        switch (TG[4]) {
            case "C":
                fill(255);
                fill(0);
                break;
            default:
                //ellipse(x,teki [4],100,100);
                image(EasyEnemy_4, X[4], teki[4]);
                if (HP[4] > (HPO[4] * 2) / 3) {
                    fill("#23C141");
                }
                if (HP[4] <= (HPO[4] * 2) / 3) {
                    fill("#D1801E");
                }
                if (HP[4] <= HPO[4] / 4) {
                    fill("#EA0C0C");
                } //text("HP:"+HP[4],x,teki [4]);
                rect(X[4], teki[4] - 10, HP[4], 10);
                fill(0);
        }
    } //Easy
    if (STATUS == "Easy") {
        X[0] -= Vx[0];
        X[1] -= Vx[1];
        X[2] -= Vx[2];
        X[3] -= Vx[3];
        X[4] -= Vx[4];
    }
    if (X[0] < 0 && X[1] < 0 && X[2] < 0 && X[3] < 0 && X[4] < 0) {
        //x=width;
        X[0] = width;
        X[1] = width;
        X[2] = width;
        X[3] = width;
        X[4] = width;
    }
    if (HP[0] <= 0 && HP[1] <= 0 && HP[2] <= 0 && HP[3] <= 0 && HP[4] <= 0) {
        //x=width;
        X[0] = width;
        X[1] = width;
        X[2] = width;
        X[3] = width;
        X[4] = width;
    } //RESET
}
function enemyAttackfunction() {
    if (
        (STATUS == "Easy") &&
        enemyAttack_TIME == 0
    ) {
        for (let i = 0; i < 5; i++) {
            enemyAttackY[i] = int(random(50, height - 50));
        }
        enemyAttack_TIME = 1;
        CD = width;
    }
    if (CD < width && enemyAttack_TIME == 1) {
        image(enemyAttack_mahoujin, width - 100, enemyAttackY[0]);
        image(enemyAttack_mahoujin, width - 100, enemyAttackY[1]);
        image(enemyAttack_mahoujin, width - 100, enemyAttackY[2]);
        image(enemyAttack_mahoujin, width - 100, enemyAttackY[3]);
        image(enemyAttack_mahoujin, width - 100, enemyAttackY[4]);
    }
    if (CD < width / 2 && enemyAttack_TIME == 1) {
        image(enemyAttack_mahoujin_kidou, width - 100, enemyAttackY[0]);
        image(enemyAttack_mahoujin_kidou, width - 100, enemyAttackY[1]);
        image(enemyAttack_mahoujin_kidou, width - 100, enemyAttackY[2]);
        image(enemyAttack_mahoujin_kidou, width - 100, enemyAttackY[3]);
        image(enemyAttack_mahoujin_kidou, width - 100, enemyAttackY[4]);
    }
    if (CD <= width / 4 && enemyAttack_TIME == 1) {
        stroke("#FF0537");
        strokeWeight(2);
        line(width - 60, enemyAttackY[0] + 40, 0, enemyAttackY[0] + 40);
        line(width - 60, enemyAttackY[1] + 40, 0, enemyAttackY[1] + 40);
        line(width - 60, enemyAttackY[2] + 40, 0, enemyAttackY[2] + 40);
        line(width - 60, enemyAttackY[3] + 40, 0, enemyAttackY[3] + 40);
        line(width - 60, enemyAttackY[4] + 40, 0, enemyAttackY[4] + 40);
        strokeWeight(1);
        stroke(0);
    }
    if (CD < width / 20 && enemyAttack_TIME == 1) {
        for (let k1 = width; k1 > -30; k1 -= 30) {
            image(enemyAttack, k1 - 100, enemyAttackY[0] + 33);
            image(enemyAttack, k1 - 100, enemyAttackY[1] + 33);
            image(enemyAttack, k1 - 100, enemyAttackY[2] + 33);
            image(enemyAttack, k1 - 100, enemyAttackY[3] + 33);
            image(enemyAttack, k1 - 100, enemyAttackY[4] + 33);
        }
        if (STATUS == "Easy") {
            if (
                (mouseY >= enemyAttackY[0] - 17 &&
                    mouseY <= enemyAttackY[0] + 83) ||
                (mouseY >= enemyAttackY[1] - 17 &&
                    mouseY <= enemyAttackY[1] + 83) ||
                (mouseY >= enemyAttackY[2] - 17 &&
                    mouseY <= enemyAttackY[2] + 83) ||
                (mouseY >= enemyAttackY[3] - 17 &&
                    mouseY <= enemyAttackY[3] + 83) ||
                (mouseY >= enemyAttackY[4] - 17 &&
                    mouseY <= enemyAttackY[4] + 83)
            ) {
                Health_display -= HealthO / 500;
            }
        }
    }
    fill(255);
    if (STATUS != "Start" && STATUS != "Setting") {
        arc(75, 160, 50, 50, 0, 2 * PI - (2 * PI * CD) / width);
        if (CD <= 0 && enemyAttack_TIME == 1) {
            enemyAttack_TIME = 0;
        }
        CD -= 3;
    }
}
function scorefunction() {
    if (STATUS != "Start" && STATUS != "Setting") {
        text("Score:" + score_display, 50, 80);
    }
}
function statusfunction() {
    if (score_display >= 200) {
        STATUS = "Normal";
    }
    text("Mode:" + STATUS, 50, 50);
}
function Health() {
    if (X[0] <= 0) {
        if (HP[0] > 0) {
            Health_display -= HealthO / 30;
            HP[0] = 0;
        }
    }
    if (X[1] <= 0) {
        if (HP[1] > 0) {
            Health_display -= HealthO / 30;
            HP[1] = 0;
        }
    }
    if (X[2] <= 0) {
        if (HP[2] > 0) {
            Health_display -= HealthO / 30;
            HP[2] = 0;
        }
    }
    if (X[3] <= 0) {
        if (HP[3] > 0) {
            Health_display -= HealthO / 30;
            HP[3] = 0;
        }
    }
    if (X[4] <= 0) {
        if (HP[4] > 0) {
            Health_display -= HealthO / 30;
            HP[4] = 0;
        }
    }
    if (MP >= 150) {
        if (keyIsPressed) {
            if (key == "z" || key == "Z") {
                MP -= 150;
                Health_display += HealthO / 3;
            }
        }
    }
    if (STATUS != "Start" && STATUS != "Setting") {
        fill("#23C141");
        rect(50, 90, Health_display / 50, 20);
        fill(255);
    }
}
function MPfunction() {
    if (STATUS != "Start" && STATUS != "Setting") {
        if (MP < 200) {
            MP += 0.02;
        }
        if (MP > 0) {
            fill("#1AC1ED");
        }
        if (MP > 50) {
            fill("#1137ED");
        }
        if (MP > 150) {
            fill("#A11BDB");
        }
        if (MP >= 200) {
            MP = 200;
        }
        rect(50, 112, MP, 20);
    }
}
function Lostfunction() {
    if (Health_display <= 0) {
        background(0);
        textSize(50);
        text(
            "You Lost!!",
            0.5 * width,
            0.5 * height
        );
        noLoop();
        console.log("You Lost!!!");
    }
}
function Cheatfunction() {
    if (keyIsPressed) {
        if (key == "m" || key == "M") {
            MP += 100;
        }
    }
    if (keyIsPressed) {
        if (key == "p" || key == "P") {
            score_display += 20;
        }
    }
}

// X[0] = width;
// X[1] = width;
// X[2] = width;
// X[3] = width;
// X[4] = width;
// textSize(25); //InsaneBoss =loadImage("InsaneBoss.png");
