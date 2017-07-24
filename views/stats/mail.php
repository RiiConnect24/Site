{% extends "_layout.html" %}
{% set title = 'Stats - Mail' %}

{% block mainContent %}
	<div class="section no-pad-bot">
		<div class="container">
			<br><br>
			<h1 class="header center blue-text"><i class="fa fa-bar-chart" aria-hidden="true"></i> Stats - Wii Message Board</h1>
			<div class="row center">
				<h5 class="header col s12 light">This tells you which games currently let you send stuff to your friends' Wii Message Boards.</h5>
			</div>
			<audio autoplay>
				<source src="/sounds/wiimenureserved.wav" type="audio/wav">
				Your browser does not support the audio element.
			</audio>
			<br><br>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row center">
				<ul class="collection with-header">
					<li class="collection-header">
						<h4>Color Key</h4>
					</li>
					<li class="collection-item green">
						<h5>Green indicates exchanging data in this game is working with RiiConnect24.</h5>
					</li>
					<li class="collection-item yellow">
						<h5>Yellow indicates we're testing if exchanging data in this game works with RiiConnect24.</h5>
					</li>
					<li class="collection-item red">
						<h5>Red indicates that exchanging data in this game isn't working with RiiConnect24 right now.</h5>
					</li>
				</ul>
				<br>
				<ul class="collection with-header">
					<li class="collection-header"><h4>List of Games/Apps using Wii Mail:</h4></li>
					<li class="collection-item yellow">
						<h5>All-Star Cheerleader 2</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Animal Crossing: City Folk/Let's Go to the City</h5>
						<b>Exchange: </b> Pictures and messages
					</li>
					<li class="collection-item yellow">
						<h5>Band Hero</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Big Brain Academy: Wii Degree</h5>
						<b>Exchange: </b> Records
					</li>
					<li class="collection-item yellow">
						<h5>Blast Works: Build, Trade, Destroy</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Boom Blox</h5>
						<b>Exchange: </b> Levels
					</li>
					<li class="collection-item green">
						<h5>Bonsai Barber</h5>
						<b>Exchange: </b> Pictures
					</li>
					<li class="collection-item yellow">
						<h5>Cake Mania: In the Mix!</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Calling</h5>
						<b>Exchange: </b> Pictures
					</li>
					<li class="collection-item yellow">
						<h5>Chess Challenge!</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Conduit 2</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Crazy Machines</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Dewy's Adventure</h5>
						Not Yet Tested
					</li>
					<li class="collection-item red">
						<h5>Dr. Mario Online Rx/& Germ Buster</h5>
						<b>Exchange: </b> Friend Battle Demo<br>
						No use for it to be working, the Friend Battle Demo would have to be patched for Wiimmfi to work.
					</li>
					<li class="collection-item green">
						<h5>ExciteBike: World Rally</h5>
						<b>Exchange: </b> Courses
					</li>
					<li class="collection-item red">
						<h5>Guitar Hero 5</h5>
						Not working, seems to freeze when sending a song to Wii Friends.
					</li>
					<li class="collection-item green">
						<h5>Happy Holidays: Christmas</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item green">
						<h5>Happy Holidays: Halloween</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item yellow">
						<h5>Horse Life Adventures/2</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Internet Channel</h5>
						<b>Exchange: </b> Internet addresses
					</li>
					<li class="collection-item green">
						<h5>Kirby's Epic Yarn</h5>
						<b>Exchange: </b> Pictures
					</li>
					<li class="collection-item yellow">
						<h5>Liight</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>MaBoShi's Arcade/The Three Shape Arcade</h5>
						<b>Exchange: </b> Replays
					</li>
					<li class="collection-item yellow">
						<h5>Marble Saga: Kororinpa/Marbles! Balance Challenge</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Mario & Sonic at the Olympic Winter Games</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Mario Kart Wii</h5>
						<b>Exchange: </b> Ghost data and friend requests
					</li>
					<li class="collection-item yellow">
						<h5>Metroid Prime 3: Corruption</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Metroid Prime Trilogy</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Mii Channel</h5>
						<b>Exchange: </b> Miis, and receive Miis in the Mii Parade.
					</li>
					<li class="collection-item yellow">
						<h5>Mix Superstar</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>My Aquarium</h5>
						<b>Exchange: </b> Aquariums
					</li>
					<li class="collection-item green">
						<h5>My Aquarium 2</h5>
						<b>Exchange: </b> Aquariums
					</li>
					<li class="collection-item green">
						<h5>My Pokémon Ranch</h5>
						<b>Exchange: </b> Pictures, and ranch invitations
					</li>
					<li class="collection-item yellow">
						<h5>Our House Party!</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Photo Channel</h5>
						<b>Exchange: </b> Pictures
					</li>
					<li class="collection-item yellow">
						<h5>Pro Evolution Soccer 2008</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Pro Evolution Soccer 2009</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Rabbids Go Home</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>Rock Revolution</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>Strong Bad Episode 1: Homestar Ruiner</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item green">
						<h5>Strong Bad Episode 2: Strong Badia - The Free</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item green">
						<h5>Strong Bad Episode 3: Baddest of the Bands</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item green">
						<h5>Strong Bad Episode 4: Dangeresque 3</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item green">
						<h5>Strong Bad Episode 5: 8-bit is Enough</h5>
						<b>Exchange: </b> Letters
					</li>
					<li class="collection-item green">
						<h5>Super Mario Galaxy</h5>
						<b>Exchange: </b> Pictures
					</li>
					<li class="collection-item green">
						<h5>Super Mario Galaxy 2</h5>
						<b>Exchange: </b> Pictures
					</li>
					<li class="collection-item green">
						<h5>Super Smash Bros. Brawl</h5>
						<b>Exchange: </b> Snapshots, stages, replays
						<br>
						<b>Note: </b> You need to be registered with a friend on Wiimmfi to send data.
					</li>
					<li class="collection-item yellow">
						<h5>The Conduit</h5>
						Not Yet Tested
					</li>
					<li class="collection-item yellow">
						<h5>UFC Personal Trainer: The Ultimate Fitness System</h5>
						Not Yet Tested
					</li>
					<li class="collection-item green">
						<h5>WarioWare: D.I.Y. Showcase</h5>
						<b>Exchange: </b> Survey data, microgames
						<br>
						<b>Note: </b> <a style="color: #0072ab" href="https://github.com/RiiConnect24/auto-wiiware-patcher/releases">The game must be patched for Wiimmfi for this to work.</a>
					</li>
					<li class="collection-item red">
						<h5>Wii Music</h5>
						<b>Exchange: </b> Video clips<br>
						Not working because it connects to an additional server to verify if your Wii Friends have this game.
					</li>
			  </ul>
			</div>
		</div>
	</div>
{% endblock %}
