<?php
require getcwd() . '/vendor/autoload.php'; // Composer

function rc24_initialise_twig($dir = 'views/') {
	$loader = new Twig_Loader_Filesystem(getcwd() . '/' . $dir , array('debug' => true)); // initialise Twig stuff
	return new Twig_Environment($loader);
}
?>
