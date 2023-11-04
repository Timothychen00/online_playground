
function loader_animation_on(){
    document.getElementById("preloader").classList.remove('visually-hidden');
}
function loader_animation_off(){
    document.getElementById("preloader").classList.add('visually-hidden');
}
function countdown_animation(times,mode='delay'){
    document.getElementById('countdown').classList.remove('visually-hidden');
    window.start_time=performance.now()
    update_countdown(times,mode);
    
}

function update_countdown(times,mode='delay'){
    if(times>0){
        console.log(mode);
        delay_offset=(performance.now()-window.start_time)-(3-times)*1000
        console.log(delay_offset);
        if (mode=='delay'){
            if (delay_offset<=1000)
                setTimeout(update_countdown,1000-delay_offset,times-1);
            else
                update_countdown(times-1);
        }
        console.log(3-times);
        
        document.getElementById('countdown_text').innerText=times;
        window.countdown_number=times-1;
    }else
        document.getElementById('countdown').classList.add('visually-hidden');
}
// var start_time=performance.now();
