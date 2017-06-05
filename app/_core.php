<?php
require '../../../vendor/autoload.php'; // Composer

function rc24_initialise_twig($dir = '/Volumes/2TB Passport/Git/Site/views/') {
	$loader = new Twig_Loader_Filesystem($dir, array('debug' => true)); // initialise Twig stuff
	return new Twig_Environment($loader);
}
?>
