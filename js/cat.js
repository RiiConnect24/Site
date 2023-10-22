function popToast(message) {
    M.toast({ html: message, displayLength: 5000, classes: 'rounded grey lighten-4 black-text' });
}

function catClicked() {

    // Play ogg file
    var i = Math.floor(3 * Math.random())

    var audio = new Audio('sounds/cat/cat' + (i + 1) + '.wav');
    audio.play();

    // One random message out of 40
    var r_text = [
        "Follow https://wii.guide/ to set up RiiConnect24 on your system.",
        "RiiConnect24 was started in 2015.",
        "Be sure to check out Wiimmfi!",
        "Make sure to join our Discord to talk with other RiiConnect24 users!",
        "You have to mod your Wii to install RiiConnect24, but it's worth it.",
        "Check out RiiTag to make your own gamertag!",
        "If you set your DNS to 167.86.108.126, you can receive DLC items if you play Animal Crossing on the Wii.",
        "Make sure to register your friends with RiiConnect24 on the Wii Message Board.",
        "Shoutouts to M3KAI5ER44 for drawing me!",
        "The cats in the Photo Channel and News Channel are brothers and sisters. The one on the News Channel is male, and his younger sister's on the Photo Channel.",
        "The News Channel uses news from reliable sources!",
        "The Forecast Channel receives weather from AccuWeather.",
        "RiiConnect24 is and will always be free.",
        "Make sure to follow us on social media.",
        "Installing RiiConnect24 is fun, straightforward, and safe.",
        "RiiConnect24 works on the Wii, the Wii U, and Dolphin.",
        "The Wii was nicknamed \"Revolution\" during its development stage.",
        "Did you know the letters in the Wii model number RVL stand for the Wii's codename, Revolution?",
        "The music used in many of the Wii's channels (including the Wii Shop, Mii, Check Mii Out, and Forecast Channel) was composed by Kazumi Totaka.",
        "The Internet Channel once costed 500 Wii Points.",
        "It's possible to use candles as a Wii Sensor Bar.",
        "The blinking blue light that indicates a system message has been received is actually synced to the bird call of the Japanese bush warbler. More info about it on RiiConnect24 YouTube Channel^^!",
        "Wii Sports is the most sold game on the Wii. It sold 82.85 million. Overall it is the 3rd most sold game in the world.",
        "Did you know that most of the scripts used to make RiiConnect24 work are written in Python?",
        "Did you know that we have an awesome Discord server where you can always stay updated about the project status?",
        "The Everybody Votes Channel was originally an idea about sending quizzes and questions daily to Wiis.",
        "The News Channel developers had an idea at some point about making a dad's Mii being the news caster in the Channel, but it probably didn't make it because some stories on there probably aren't appropriate for kids.",
        "The Everybody Votes Channel was originally called the Questionnaire Channel, then Citizens Vote Channel.",
        "The Forecast Channel had a \"laundry index\" (to show how appropriate it is to dry your clothes outside) and a \"pollen count\" in the Japanese version.",
        "During the Forecast Channel development, Nintendo's America department got hit by a thunderstorm, and the developers of the Channel in Japan lost contact with them.",
        "During the News Channel development, Nintendo's Europe department got hit by a big rainstorm, and the developers of the Channel in Japan lost contact with them.",
        "The News Channel has an alternate slide show song that plays as night.",
        "During E3 2006, Satoru Iwata said WiiConnect24 uses as much power as a miniature lightbulb while the console is in standby.",
        "The effect used when rapidly zooming in and out of photos on the Photo Channel was implemented into the News Channel to zoom in and out of text.",
        "The help cats in the News Channel and the Photo Channel are brothers and sisters (the one in the News Channel being male, and the Photo Channel being a younger female).",
        "The Japanese version of the Forecast Channel does not show the current forecast.",
        "The Forecast Channel, News Channel and the Photo Channel were made by nearly the same team.",
        "The first worldwide Everybody Votes Channel question about if you like dogs or cats more got more than 500,000 votes.",
        "The night song that plays when viewing the local forecast in the Forecast Channel was made before the day song, that was requested to make people not feel sleepy when it was played during the day.",
        "The globe in the Forecast and News Channel is based on imagery from NASA, and the same globe was used in Mario Kart Wii.",
        "You can press the Reset button while the Wii's in standby to turn off the blue light that glows when you receive a message.",
        "The News Channel has an alternate song which plays during the night if you're on slide show. It plays from 10PM-5AM.",
        "The Forecast Channel has an alternate set of music which plays during the night. It plays from 6PM-5AM."
    ]
    var i = Math.floor(r_text.length * Math.random())

    popToast(r_text[i]);
}