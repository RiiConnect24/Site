function popToast(message) {
    M.toast({ html: message, displayLength: 4000, classes: 'rounded grey lighten-4 black-text' });
}

function catClicked() {

    // Play ogg file
    var i = Math.floor(3 * Math.random())

    var audio = new Audio('sounds/cat/cat' + (i + 1) + '.wav');
    audio.play();

    // One random message out of 8
    var r_text = new Array();
    r_text[0] = "Follow https://wii.guide/ to set up RiiConnect24 on your system.";
    r_text[1] = "RiiConnect24 was started in 2015.";
    r_text[2] = "Be sure to check out Wiimmfi and WiiLink!";
    r_text[3] = "Make sure to join our Discord to talk with other RiiConnect24 users!";
    r_text[4] = "You have to mod your Wii to install RiiConnect24, but it's worth it.";
    r_text[5] = "Check out RiiTag to make your own gamertag!";
    r_text[6] = "If you set your DNS to 167.86.108.126, you can receive DLC items if you play Animal Crossing on the Wii.";
    r_text[7] = "Make sure to register your friends with RiiConnect24 on the Wii Message Board.";
    r_text[8] = "Shoutouts to M3KAI5ER44 for drawing me!";
    r_text[9] = "The cats in the Photo Channel and News Channel are brothers and sisters. The one on the News Channel is male, and his younger sister's on the Photo Channel.";
    r_text[10] = "The News Channel uses news from reliable sources!";
    r_text[11] = "The Forecast Channel receives weather from AccuWeather.";
    r_text[12] = "RiiConnect24 is and will always be free.";
    r_text[13] = "Make sure to follow our Twitter.";
    r_text[14] = "Installing RiiConnect24 is fun, straightforward, and safe.";
    r_text[15] = "RiiConnect24 works on the Wii, the Wii U, and Dolphin."
    var i = Math.floor(16 * Math.random())

    popToast(r_text[i]);
}