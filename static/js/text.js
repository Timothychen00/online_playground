$(".square").toggleClass('active');

function display_text() {
    document.getElementById("player_text").classList.add("animate__heartBeat");
    document.getElementById('player_text').style.display = 'block';
}
setTimeout(display_text, 1300);
console.log('text');
