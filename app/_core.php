<?php
require '../../../vendor/autoload.php'; // Composer

function rc24_initialise_twig($dir = '/var/www/riiconnect24.net/public_html/.jsatest/views/') {
	$loader = new Twig_Loader_Filesystem($dir); // initialise Twig stuff
	return new Twig_Environment($loader);
}