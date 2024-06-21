
// 文字、分數顯示
function text_active() {
    $('.square').show();
    $(".square").toggleClass('active');
}

function score_active() {
    $('.score').show();
    $(".score").toggleClass('active');
}

function display_text() {
    var x = document.getElementsByClassName("heartBeat_text");
    for (let i = 0; i < x.length; i++) {
        x[i].classList.add("animate__heartBeat");
        x[i].style.display = 'block';
    }
}


function display_score() {
    var x = document.getElementsByClassName("bounce_text");
    for (let i = 0; i < x.length; i++) {
        x[i].classList.add("animate__animated");
        x[i].classList.add("animate__rubberBand");
        x[i].style.display = 'block';
    }
}

text_active();

setTimeout(display_text, 500);
setTimeout(score_active, 1200);
setTimeout(display_score, 1700);
console.log('text');

// 顯示更多資訊
$('.square').hover(function () {
    $('.more_information').show();
    $('.square').height('90px');
}).mouseleave(function () {
    $('.square').height('50px');
    $('.more_information').hide();
});

// 加分


document.getElementById('add_score_1').onclick = function () {
    $('#score_1_display').html('<h5 class="bounce_text" id="score_1" style="margin-top:-5px;">' + Math.round(Number($('#score_1').text()) + 1) + '</h5>');
    var audio = new Audio('/static/mp3/success_sound.mp3');
    audio.play();

}

document.getElementById('add_score_2').onclick = function () {
    $('#score_2_display').html('<h5 class="bounce_text" id="score_2" style="margin-top:-5px;">' + Math.round(Number($('#score_2').text()) + 1) + '</h5>');
    var audio = new Audio('/static/mp3/success_sound.mp3');
    audio.play();
}