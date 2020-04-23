document.addEventListener('turbolinks:load', () => {
    let timerSpan = document.getElementById('timer');

    if (timerSpan) {
        let secondsLeft = timerSpan.dataset.seconds;
        timerSpan.textContent = secondsToTimeString(secondsLeft);
        startTimer(secondsLeft, timerSpan);
    }
});

function startTimer(seconds, display) {
    let testPassageId = display.dataset.testPassageId;
    let secondsInput = document.getElementById('seconds');

    setInterval(() => {
        seconds -= 1;
        secondsInput.value = seconds
        display.textContent = secondsToTimeString(seconds);
        if (seconds < 0) {
            window.location.href = `/test_passages/${testPassageId}/result`;
        }
    }, 1000);
}

function secondsToTimeString(seconds) {
    let min = parseInt(seconds / 60, 10);
    let sec = parseInt(seconds % 60, 10);

    min = min < 10 ? "0" + min : min;
    sec = sec < 10 ? "0" + sec : sec;

    return min + ":" + sec;
}
