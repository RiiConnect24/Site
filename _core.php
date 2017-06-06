<?php
require '/var/www/riiconnect24.net/public_html/vendor/autoload.php'; // Composer

function rc24_initialise_twig($dir = '/var/www/riiconnect24.net/public_html/views/') {
	$loader = new Twig_Loader_Filesystem($dir, array('debug' => true)); // initialise Twig stuff
	return new Twig_Environment($loader);
}
?>
