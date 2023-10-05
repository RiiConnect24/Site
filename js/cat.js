function popToast(message) {
    M.toast({ html: message, displayLength: 5000, classes: 'rounded grey lighten-4 black-text' });
}

function catClicked() {

    // Play ogg file
    var i = Math.floor(3 * Math.random())

    var audio = new Audio('sounds/cat/cat' + (i + 1) + '.wav');
    audio.play();

    // One random message out of 40
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
    r_text[13] = "Make sure to follow us on social media.";
    r_text[14] = "Installing RiiConnect24 is fun, straightforward, and safe.";
    r_text[15] = "RiiConnect24 works on the Wii, the Wii U, and Dolphin."
    r_text[16] = "The Wii was nicknamed \"Revolution\" during its development stage.";
    r_text[17] = "Did you know the letters in the Wii model number RVL stand for the Wii's codename, Revolution?";
    r_text[18] = "The music used in many of the Wii's channels (including the Wii Shop, Mii, Check Mii Out, and Forecast Channel) was composed by Kazumi Totaka.";
    r_text[19] = "The Internet Channel once costed 500 Wii Points.";
    r_text[20] = "It's possible to use candles as a Wii Sensor Bar.";
    r_text[21] = "The blinking blue light that indicates a system message has been received is actually synced to the bird call of the Japanese bush warbler. More info about it on RiiConnect24 YouTube Channel^^!";
    r_text[22] = "Wii Sports is the most sold game on the Wii. It sold 82.85 million. Overall it is the 3rd most sold game in the world.";
    r_text[23] = "Did you know that most of the scripts used to make RiiConnect24 work are written in Python?";
    r_text[24] = "Did you know that we have an awesome Discord server where you can always stay updated about the project status?";
    r_text[25] = "The Everybody Votes Channel was originally an idea about sending quizzes and questions daily to Wiis.";
    r_text[26] = "The News Channel developers had an idea at some point about making a dad's Mii being the news caster in the Channel, but it probably didn't make it because some stories on there probably aren't appropriate for kids.";
    r_text[27] = "The Everybody Votes Channel was originally called the Questionnaire Channel, then Citizens Vote Channel.";
    r_text[28] = "The Forecast Channel had a \"laundry index\" (to show how appropriate it is to dry your clothes outside) and a \"pollen count\" in the Japanese version.";
    r_text[29] = "During the Forecast Channel development, Nintendo's America department got hit by a thunderstorm, and the developers of the Channel in Japan lost contact with them.";
    r_text[30] = "During the News Channel development, Nintendo's Europe department got hit by a big rainstorm, and the developers of the Channel in Japan lost contact with them.";
    r_text[31] = "The News Channel has an alternate slide show song that plays as night.";
    r_text[32] = "During E3 2006, Satoru Iwata said WiiConnect24 uses as much power as a miniature lightbulb while the console is in standby.";
    r_text[33] = "The effect used when rapidly zooming in and out of photos on the Photo Channel was implemented into the News Channel to zoom in and out of text.";
    r_text[34] = "The help cats in the News Channel and the Photo Channel are brothers and sisters (the one in the News Channel being male, and the Photo Channel being a younger female).";
    r_text[35] = "The Japanese version of the Forecast Channel does not show the current forecast.";
    r_text[36] = "The Forecast Channel, News Channel and the Photo Channel were made by nearly the same team.";
    r_text[37] = "The first worldwide Everybody Votes Channel question about if you like dogs or cats more got more than 500,000 votes.";
    r_text[38] = "The night song that plays when viewing the local forecast in the Forecast Channel was made before the day song, that was requested to make people not feel sleepy when it was played during the day.";
    r_text[39] = "The globe in the Forecast and News Channel is based on imagery from NASA, and the same globe was used in Mario Kart Wii.";
    r_text[40] = "You can press the Reset button while the Wii's in standby to turn off the blue light that glows when you receive a message.";

    var i = Math.floor(41 * Math.random())

    popToast(r_text[i]);
}